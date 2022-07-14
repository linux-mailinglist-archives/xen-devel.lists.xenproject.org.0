Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF44574876
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367133.598186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBuyv-0002k7-AZ; Thu, 14 Jul 2022 09:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367133.598186; Thu, 14 Jul 2022 09:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBuyv-0002hq-7c; Thu, 14 Jul 2022 09:18:01 +0000
Received: by outflank-mailman (input) for mailman id 367133;
 Thu, 14 Jul 2022 09:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZjPX=XT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBuyt-0002hk-S9
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 09:17:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d963f0a6-0355-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 11:17:57 +0200 (CEST)
Received: from FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::23)
 by DB9PR08MB6959.eurprd08.prod.outlook.com (2603:10a6:10:2bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 14 Jul
 2022 09:17:54 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::d) by FR3P281CA0025.outlook.office365.com
 (2603:10a6:d10:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.7 via Frontend
 Transport; Thu, 14 Jul 2022 09:17:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16 via Frontend Transport; Thu, 14 Jul 2022 09:17:53 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Thu, 14 Jul 2022 09:17:53 +0000
Received: from 969db86233e7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 138DCEFA-C007-4352-8A16-37505B897494.1; 
 Thu, 14 Jul 2022 09:17:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 969db86233e7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 09:17:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB4270.eurprd08.prod.outlook.com (2603:10a6:803:f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Thu, 14 Jul
 2022 09:17:44 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 09:17:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d963f0a6-0355-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AbW4VT52VwEo8MXrH8ulsfrm5OIkym6MneC1KxG75i4EenE0b11Ruam26xZP2MfzjVss6xT0ny0r0K/hKVaQ6GQAN9Ox4EPhZORRvkS0SHMGewisTWZ/i1PgCnsB5Wc1KiqCv8uQwSrfWvrGbgu89VCCKUZ7ERw3UyAFIcdup76qgAxCGTegGYtqSxg2/lEVWvWk4XNLgCu2SsJah3A0YKmEtjjKMfLSIdvTerDIEcMKCyN3Ct8xprs5hFK/dvZDzijUwPLR/4ODhIzXE54g/qj9d1imqWUhPb9kYweZEQbyEmhGQq4+hXNHvlSF0oWpNBE75UQ4SWVaHoORNnw4QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHIaqGKAV4GSAaAAgx/n/6Xin3AeRZwXkbmphePOUgE=;
 b=kWtWPrNgVBC8u/1slDXk7KEobBvy+6UP0V3WsqK4TDdNuISHVlX5rIIzjWhLKc49jFJiaE2RU8YHj/3mti5nIvciLkMeWUEc5YqpCZTyrTKv7+krgxM/YbfevLZJl9NfxPNXIlqkPzrFaO4mnWPHU+1rNrX7oLXR6tZgQHfsptJvzR4wXZPcPHhjkgfIpjAD1d1TjBVPzAHiv27hlb72q+Nj96KB5czAGUS2mtPkyqxnlcXHK3DauJTA8oQ3jJg0qhPSGVIzhoOqq2dytKzAVmkc83Vd2xAzcJNaKifF9bLRd0/GpJ6A9YB7lVZJ9jAhhHzrvox2N559y5FsD7u4JQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHIaqGKAV4GSAaAAgx/n/6Xin3AeRZwXkbmphePOUgE=;
 b=WjbTewEzZz359NrFu+Nv1V3HZPNeU3intQKGj0GKzpDm8Yxp9vjcimon6Z7KBbBc95fZOvY1gJzS4LFfUDoBZcCIfwpG+3F9qw18bn8/nj8mBn7O3hmkVQujX+UJtwzoKXoOAVpJzmgNLZZOmW7K2QyHImOTNIsWsVxodmkYPiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgtImSabczKKtsrR7bSgzNgd3UcJZGcEpXyhcUWgf6vt3qt6bdR0GrVLKe8Sa2jYmFgzFWd45cjd2unpgS2+oriEBHsoN9+2j56d0o+mjCNUJzUmQ2y29h+2C4/F4hdUHoGMje1FoSm20Is0eXJg/K7u+Vl/2hRUMqxsi2q9zp/E9qRKeM6d3prfTW8aCCjVCTAQMv+F1MYcqTbAvia/DEAkDXsony81kACJOsx2xaawZ9iX6woNj1daD79deVoL5XmJcFkWxE6JZ/c9r/qGYUx7fsjuzWhAEeWLtp10y/PjHJ1J+kLyaLUgwValBkIxXYhlYx3UVUBI5aIkpLfXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHIaqGKAV4GSAaAAgx/n/6Xin3AeRZwXkbmphePOUgE=;
 b=ga12MosjF8XnuFJq+51GCOmII/n/XSgpbX1kmYxuymRvSfrbZ1C7QZKE1zwC/N3f2x/DLt8mO98EYl51Tf1amLA/atimvCzcvXbD+puldhScqJNFyYQNK9cn0au3m4OFfpDX5jFNA52JGPbDzMa5dsQzsLed7fSCLmwI7Ea7QDEFNEUFQdWBV5wnX34trEEY+8/a+r2yYV8UESJ+IaIGSGccVFde54jiM0hU8UvkEy6sSe7wp7hPprDu9zF2lFW9KYoJBdaP3pN8wGLMuef4c3xR/57a09zNw4MY6F9OyiKzOnFUd0uBrdVJws4+jJV5f6Rg5X7GbtbXmovjLoci7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHIaqGKAV4GSAaAAgx/n/6Xin3AeRZwXkbmphePOUgE=;
 b=WjbTewEzZz359NrFu+Nv1V3HZPNeU3intQKGj0GKzpDm8Yxp9vjcimon6Z7KBbBc95fZOvY1gJzS4LFfUDoBZcCIfwpG+3F9qw18bn8/nj8mBn7O3hmkVQujX+UJtwzoKXoOAVpJzmgNLZZOmW7K2QyHImOTNIsWsVxodmkYPiI=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 7/9] xen/x86: rename bad_srat to numa_bad
Thread-Topic: [PATCH v2 7/9] xen/x86: rename bad_srat to numa_bad
Thread-Index: AQHYktrEQRgCjYljLE+D+LLS9lLfW6160MYAgALOd4A=
Date: Thu, 14 Jul 2022 09:17:44 +0000
Message-ID:
 <PAXPR08MB7420E189A0F9FFD280D6751B9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-8-wei.chen@arm.com>
 <fb8c6843-2170-c0d6-52f9-0edfb0d6684d@suse.com>
In-Reply-To: <fb8c6843-2170-c0d6-52f9-0edfb0d6684d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3EC4D5A975DC4143ABC87AF5D533560F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ae72757d-2939-422a-4787-08da6579bb84
x-ms-traffictypediagnostic:
	VI1PR08MB4270:EE_|VE1EUR03FT062:EE_|DB9PR08MB6959:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 e6zpfNVxFmNTupgDzDJDlL1r/lF+pkTH/NJaY1Vz9LHOZzBeLCEiFrzx9oslqBFOiU0JWGpgeXiPkEjVxa2WWt4QCxixf0pddVoHHz7tfLd+oUmoupLENum9aKs79TbCWSLc+GoxDNYYlpH0DRBcxRtPoEjR+gkEneCvvqA8mlRwn1ZGRH+GIhTCqwAcJgEBp9lS9Jmtvi6x4Fe2g2rgF6dOVSmB4objLSz9mPHocSGsTtdibd7Fz+ms2kOxLNXIIaCCsMeyZpBWgIhemebblgXpnf1qMILhjoU6ce1kTGkr/aAK7aPldNBsuWepIZQs7srsCuUky8q7YMo1m70i8uBEHcbG25lLeCHhZdqDyy57QoTaHNcUpLMQi+gMlRhptXyogYbwZ26PN6XTrBZlJNKiIZKTsh1IPKZzZ4f0oikGcdF6UqqMsBogAtn5Vxtm4uTYxgmcTieejU/ENP0CS5zU2rkzSOCayT2lMg4Jux2I814W7yyClEVJJPF339DBch5KfSmJ0MOyVRa4yJHHR+QIcGKBQcW+oL0pnjscgdURefSxHpVraU6ICa7puG6nMf41Zga0kNJZJyrNj4Pgtn4maTJ9ICDPq50RMh7AktVZFCVF3q1fqFH/wUsv5VLPhghM5qEiNxpnTsxENTgA709LwAo25BKuvItZgQ4Z+ybKDCNj+yFjfilBoFMK6gehFrVwt/s9etfmbYuExNOsjYhfdt/au1GJMYbGSW3iAOKqRbKS5Akgt3N6OxNsWX2OZw5EiRq6YcABMLFJv9TzaoUjxAo4ygNK1c8+NFZJp3yYpFeGHF8ZAAV7KaEcr+Lj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(6506007)(478600001)(9686003)(7696005)(8936002)(52536014)(26005)(53546011)(122000001)(2906002)(5660300002)(38070700005)(33656002)(86362001)(41300700001)(186003)(38100700002)(55016003)(83380400001)(4326008)(66946007)(66476007)(66556008)(316002)(64756008)(66446008)(8676002)(76116006)(71200400001)(54906003)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4270
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7dfb751f-41f1-471d-3f53-08da6579b625
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ynNMgYM6cD+kzrmwBIN1Qo+1VdLnYeOrwYjAZ1jNVd3qBmcvl55pd/cm+Tdoby625YNPTvuPK3lXKmJmaXJinsTkI7JnvjpjR7L4/Mbdb89dNvY/zUxIE0/Rfr8B7cmwqLSgEaCdm5ixf3mIxRLdzQQB9x5A47XK/o48CHmyrqoh7IsRFqTvINKF3ZoApHdBs01VQVPeFOXQOGlX39MqyMrpztfM1LoFY2j7DYmg5waCveSZiZqErSF+7BE7hwJDRU354IMfNPBa+ToMJPnDE2uEItouyaw3KUMfGzazFDOhc2wRpp0LLsypEEik3SvPed0crAEJpz3UEf5cCMtUqlpIdUMTtvzlK1cUxn0db/pEgBeUtrYR6Vkpe0dg11iOxuQ5g7Tl9Y8eWb4GCy3mU5JIXKOeMNtOAdZybJLnh3nBKfY3sKu0Vk1IJv/UfVqjTWhW9ispkzf3ZDuEeNhdBRBPpWgu9DLy4Ceflat682/oqEYISbbnMUXn7K1bHCMLjrhp9GfTu9O5iohbXtfJbh8d/HeSSLYcLnaUOdD7XI5gO6RSLuxFnYROwwwncq8XtD+8M+TO7itsdH/zkmj+kCBQAy5OClocHhPw7REnhYj1ajpbrNzx8qgT6PP/AdyqWE9iTELL9HxVknpgeAuK1AJ4j7B8aglabSEQXv2+OO/rnDQUAAafdyeJC/k6fUVQs4Ck15ybKDaQwfZsXE9LGLJkZz6rpV8ixHSo99yAIuC9WOM8rE3gp9eC/jL2o8+m8JvdVVHBdugftjBckbkCVf4Y9V2W1NIMgIKqyQz4uiy83IN11xqso4Axbs7U1S8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(40470700004)(36840700001)(478600001)(47076005)(36860700001)(2906002)(33656002)(82310400005)(336012)(26005)(356005)(55016003)(40460700003)(83380400001)(316002)(41300700001)(7696005)(82740400003)(8676002)(52536014)(70206006)(186003)(4326008)(86362001)(8936002)(5660300002)(54906003)(81166007)(6862004)(70586007)(40480700001)(9686003)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:17:53.6709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae72757d-2939-422a-4787-08da6579bb84
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6959

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAyMjoyNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgNy85XSB4ZW4veDg2OiByZW5hbWUgYmFkX3NyYXQgdG8gbnVtYV9iYWQNCj4gDQo+IE9u
IDA4LjA3LjIwMjIgMTY6NTQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFdoZW4gTlVNQSBpbml0aWFs
aXphdGlvbiBjb2RlIGlzIGZhaWxlZCBpbiBzY2FubmluZyBTUkFULiBJdCB3aWxsDQo+ID4gY2Fs
bCBiYWRfc3JhdCB0byBzZXQgZGlzYWJsZSBOVU1BIGFuZCBjbGVhciByZWxhdGUgZGF0YS4gQnV0
IHRoaXMNCj4gPiBuYW1lIGlzIEFDUEkgc3BlY2lmaWMsIHdlIGhhdmUgbW92ZWQgZ2VuZXJpY2Fs
bHkgdXNhYmxlIE5VTUEgY29kZXMNCj4gPiB0byBjb21tb24sIGJhZF9zcmF0IGhhcyBjYW1lIHdp
dGggdGhlc2UgY29kZXMgdG8gY29tbW9uIGNvZGUuIEJ1dA0KPiA+IGl0J3Mgbm90IHJlYXNvbmFi
bGUgZm9yIG90aGVyIE5VTUEgaW1wbGVtZW50YXRpb25zIHRvIGltcGxlbWVudCBhDQo+ID4gZmFs
bCBiYWNrIGZ1bmN0aW9uIG5hbWVkIGJhZF9zcmF0LiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSByZW5h
bWUNCj4gPiBiYWRfc3JhdCB0byBudW1hX2JhZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdl
aSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+IHYxIC0+IHYyOg0KPiA+IDEu
IE5ldyBpbiB2Mi4NCj4gDQo+IEkgdGhpbmsgdGhpcyB3YW50cyB0byBjb21lIGJlZm9yZSBtb3Zp
bmcgdG8gY29tbW9uIGNvZGUuIEFuZCBJJ2QNCj4gYWxzbyBsaWtlIHlvdSB0byBjb25zaWRlciB1
c2luZyBlLmcuIG51bWFfZndfYmFkKCkgb3INCj4gbnVtYV9maXJtd2FyZV9iYWQoKSB0byBiZXR0
ZXIgcmVmbGVjdCB0aGUgb3JpZ2luYWwgcHVycG9zZS4NCj4gDQoNCk9rLCBJIHdpbGwgcmUtb3Jk
ZXIgdGhlIHNlcmllcyBhbmQgdXBkYXRlIHRoZSBmdW5jdGlvbiBuYW1lcy4NCg0KVGhhbmtzLA0K
V2VpIENoZW4NCg0KPiBKYW4NCg==

