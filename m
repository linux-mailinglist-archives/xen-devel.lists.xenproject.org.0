Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B86037B6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 03:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425416.673203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okyM2-0002EM-Nx; Wed, 19 Oct 2022 01:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425416.673203; Wed, 19 Oct 2022 01:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okyM2-0002CO-Jk; Wed, 19 Oct 2022 01:58:46 +0000
Received: by outflank-mailman (input) for mailman id 425416;
 Wed, 19 Oct 2022 01:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JMjo=2U=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1okyM0-0002CH-I0
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 01:58:44 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2054.outbound.protection.outlook.com [40.107.103.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e7c561b-4f51-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 03:58:42 +0200 (CEST)
Received: from AS9PR0301CA0056.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::34) by VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 01:58:39 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::eb) by AS9PR0301CA0056.outlook.office365.com
 (2603:10a6:20b:469::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Wed, 19 Oct 2022 01:58:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 19 Oct 2022 01:58:39 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 19 Oct 2022 01:58:38 +0000
Received: from b90bcecbffbf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06FDA684-6BA4-492F-BCA5-5F4F1C93FCB2.1; 
 Wed, 19 Oct 2022 01:58:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b90bcecbffbf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 01:58:32 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 01:58:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%4]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 01:58:31 +0000
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
X-Inumbo-ID: 8e7c561b-4f51-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jXasIwam82MYKrekQvkIeHb13B2de5cwEud1W8FPZQUHwl/7FpjojB/kla2MZFiWtBbnS+MJc3d3RzGiDuMJwUmgGHiOCmsQhucrsoza1EGXgU05a3bgbtaPm7gh9xpLJnETBKlo2YMPfoPEFYuzW9ZqaRu9oyjhDYHCF79+A92S074ri0p6hnwEZbQ7ASWAtsceDd1cWynqud8QZV1Y4ZkBmPbymOlWMCnNWXlbtGSP6AJut1RpCur7yv8kTj4riZ06ZexE2pgGvrhJ/iphdFcTbWqrM0BP/sefiuaB2P810dVCI/m8Q6C0NmY57xE8Y7jDirZJ4ITJnM260eShrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1w6JL9suuS75LD7hgwtYV7oE2h10TSLhKXd1ToEJSU=;
 b=mrYfEmDPJPVEDdRfBacv6zZm5kBLVJJ8y3AuPc+9zVxV8DwaF8X3v7UQly8BIDGh99213kfkLg0a/XxxjuEWd9FppeWZfEdmF4j9MlEEc85smfT/YxIOWR3tefgmocf/btPxAtaZtSaGLhk7WSvPl73kTRyK/LCXp5qBYeTcLDxduyEATVsB9e4COt1IStAyAi5h7OoAGCzRyu3BiNhIaZzHNvma6RpZLd5A1A7QO38WgFb7dtOd+IiTBc8uVslJ7nZuL8gTf2v53TI08gaYyqoVQk02kdPaYqfFxBVIGLs9KBiTH+8PW/hrtrzq8hCKzV1e79Uza5A03ZcIvTYdPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1w6JL9suuS75LD7hgwtYV7oE2h10TSLhKXd1ToEJSU=;
 b=7YYQTFLSySlna6tddyqk5XNxM0YzNZ9ZxBsZ+64yc8ftcfXaRwP/zctJCzN026mlwppvtiz97rdHnLAU5Ewz6ABIDVEc/CVjy2hmkFRd2Ag4GZjafou1ZiBDhy0DT0owIQxL3Bal2/blfbg399dePvd1TMD2tN9QBm6jZ51Koj4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5p6j9N5HKRJJO5Br83OSDI4Qi4/htLYWuvZqhHLcdo2PBzePdbDDZEAtsFihMcWZt6BUD3rkm9/2rWn9YZVI8ROaQhj2J3EafWLrAILwwYfmai3D139Ob1feNsfRczdwRZaN5Egpf7RADwIPOf1opy6PGwBzAM9ft7CHogNCAbIqoWwgEbFGBTPy7KZEJ0IDRqZtfUGAev2H8jERAuOPPyLKQjx5nopvhrgg6fCZpITdlazmaZNYwIT0agygO9dXhmSJlnZrkexyZVBjbRZ/zeIGrmXt31NCrOH2pQofxYZttKn6F5yhtW67gwYZJrvAO+OD08TklTcZrR0+K/2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1w6JL9suuS75LD7hgwtYV7oE2h10TSLhKXd1ToEJSU=;
 b=cXbILwK/oHxMr3jfz2u0zDDvoiSBhTDRULjd5Juj9bpjBJmQNUDG0EVUYcVXI6k0/QastCqTFMV5kMWA0o/vT0n4jB6RfjsJhkUnO2zRDTFHFJol1kqZYzcjZhPIy9rWl5hezZz2w06v5Bt2E0FEuLaySD6bhEHYgPnWJ1VRoP3I1wG2BV9gy1lsIV/N/GzDAWcrX86nTgYDAVPpz4TNfjYHh65c4HoK/29Uov6d9cCMkq+Sa8k/pWwS17yaC41p2oFlVq8t+2+E0EvGH+OsM1cJrLvpNrZc5W7LrJqJpufhi+e4cOJwXLi9sG4gqpqvsj7xgML+78vkX4fHQZJGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1w6JL9suuS75LD7hgwtYV7oE2h10TSLhKXd1ToEJSU=;
 b=7YYQTFLSySlna6tddyqk5XNxM0YzNZ9ZxBsZ+64yc8ftcfXaRwP/zctJCzN026mlwppvtiz97rdHnLAU5Ewz6ABIDVEc/CVjy2hmkFRd2Ag4GZjafou1ZiBDhy0DT0owIQxL3Bal2/blfbg399dePvd1TMD2tN9QBm6jZ51Koj4=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHY3WMXl9OYk9SO1UmCbrdWlsAFLa4UNRwAgADISRA=
Date: Wed, 19 Oct 2022 01:58:31 +0000
Message-ID:
 <PAXPR08MB7420E9ABED55E0554D3C33689E2B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-3-wei.chen@arm.com>
 <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
In-Reply-To: <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2DF0A0D97B820C428AF7BA898D287AB7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PA4PR08MB6111:EE_|AM7EUR03FT020:EE_|VI1PR08MB5488:EE_
X-MS-Office365-Filtering-Correlation-Id: c18c830f-c655-4336-dc69-08dab17570fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4473X6TPDuTRN/nhjpUyqLIAu+lqfhFHATpWp0yACD8jSn9uo6F8GcerwpcZa7+m1XW4WLdQjdwkbFUz57DVkjG8KEkuiGXsE77NpDJdDKM615l8olGCrk+9K4C/JkO4GvQP2wIUrydFK93uw4zs4atyPCV7ItemjM5o5FgHFNx7eSFF2hgIxunhhESFSAYhwPD+3LdI3dg7895k544FZM4oU1gzvVispyHLQjRjT5ygmJesmpYOhesVWuYyWZTE3Ksop+tvr1cm1Evi5khSbpAvshmQyHOdBiF+lsWeyr+mOiLouoB7/mpSZFt3nUoOcAYaoPQv/F0FGOFb4GexOvDBfdHQy0x4QEw/f8AQF1mPK/YgyqAUtVeI+19He+nNhtyobS+rlhnQ8pSni+TeyOlUG/jdp0UGIig17HFnBbklCBEknmiLP6OTcIQOjm9MO10YghQxXMH1dEI/XnJQRtSl8H51CUseYk30iahFtjy4IrgOZDNBeBgz1ljaKcHQSKaR97k/HTBCmTeeza8qMnW+WUl7vnykDk+pgjxqFlGQ9ortND7O42yXZ5IsosCcEFScpQIqv4kJFv4ttTe3899ojN41ul6IB1Xhyqv2iW8kpO/eUngw5S/dJLlHyt4jfNtVA7GlMgbp/TWpEmYOm5jsg+b0Y4RgFuyVIyX+si8R//Zs3BbZQzcKoLVqZjvX9cItvK4pyrUBWD1SK51z39/lRQDWQ9WPxQkhVVKSPCZDjoIVyjp5QR9T6UbUJqERu8Agv3kFRaBdMqsoCOkBAg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199015)(52536014)(316002)(33656002)(41300700001)(38100700002)(83380400001)(38070700005)(8676002)(64756008)(66946007)(2906002)(8936002)(4326008)(5660300002)(76116006)(55016003)(6916009)(66556008)(71200400001)(66476007)(66446008)(54906003)(186003)(9686003)(26005)(122000001)(86362001)(7696005)(53546011)(6506007)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78de2a19-d5cd-4530-c928-08dab1756c33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dqc13WS6+NbD0dLcUxLsgCoyZNE8uvUEygihYjgDOx9Plf1Tec5/j8/mjZzpIjuZeEGMX5ziXabwcMew+hPR0yuKRCeXdihT1g1s82OFB/fTDXcrCl/hm3jjnOhKwP07/byiztOiiD/cfbSd7uyoRrH7fLHPtQgWKVUdeuPl2r7u20TTKPVeEPT3BqtKC22n9o09IfA3dQj6RpBSFN779LsLdRj6yjGFvumpYUQSHBWwg033ajW6JKsBO8PE+tH900YK9HJrTCBwTuYLDjnfZ4xNtzFsRR/MV5bUGU8AUB6d/MEkWhk93Zjc+1WKtYRBXVnHM+CGW5w5z30psYTPzyEUAPnqO95DI9snZh+xIykeOmZ/lzoU4/RIozA71ZhBR+hQVbQSDVXqzwGcFEJo6VOdIgYqnbXYKv2riNYYifLForeqMkWQH2em7fEF1Fu1MDV+B4VtjePWMciCGylsvDxeob6gVFeQpRbWH0v/95GP5U06VgqrrYolO2/r/cIn0FOVHcogtiWKrffrpcK7/Zm8IVkut2+pqgTA8m5X4L+aJJCpIgB/pkHG6XtfFdWBmqnkFqvwa1KzLv79xkWFxPQA1e0CsfIzYXtvcDSMRYL2TzF4jhmN9L+IiagviDwzRRvtY2jIdtkHx0kG7iHpKW/x1i36JXs/3qcEMAyGWA6za8LTjLWs7ImoOhs8go9HPAZb52NJi6pJi+m6sTiYwDnt7okvBhJ9wWBfWKe6B+Q1UjlVy3dXSG4uCNFE/a7y7zi4bHV17+DRr/gfVIXkww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(356005)(81166007)(47076005)(52536014)(86362001)(9686003)(5660300002)(8936002)(33656002)(6862004)(41300700001)(7696005)(6506007)(70586007)(53546011)(70206006)(26005)(40460700003)(40480700001)(4326008)(55016003)(8676002)(336012)(82310400005)(186003)(54906003)(2906002)(316002)(36860700001)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 01:58:39.0565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18c830f-c655-4336-dc69-08dab17570fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5488

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEw5pyIMTjml6UgMjE6NDYN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+
OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgR2Vv
cmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDIvNl0geGVuL3g4NjogbW92ZSBnZW5lcmljYWxseSB1c2FibGUgTlVNQSBjb2RlDQo+
IGZyb20geDg2IHRvIGNvbW1vbg0KPiANCj4gT24gMTEuMTAuMjAyMiAxMzoxNywgV2VpIENoZW4g
d3JvdGU6DQo+ID4gdjUgLT4gdjY6DQo+ID4gIDEuIFJlcGxhY2UgbnVtYV9zY2FuX25vZGUgdG8g
bnVtYV9wcm9jZXNzX25vZGVzIGluIGNvbW1pdCBsb2cuDQo+ID4gIDIuIExpbWl0IHRoZSBzY29w
ZSBvZiBwYWdlX251bV9ub2RlLCB2bnVtYSBhbmQgcGFnZSBvZiBudW1hX3NldHVwDQo+ID4gICAg
IGZ1bmN0aW9uLg0KPiA+ICAzLiBVc2UgbWVtc2V0IHRvIGluaXQgcGFnZV9udW1fbm9kZSBpbnN0
ZWFkIG9mIGZvcl9lYWNoX29ubGluZV9ub2RlLg0KPiA+ICA0LiBVc2UgJXUgaW5zdGVhZCBvZiAl
ZCBmb3Igbm9kZWlkX3QgYW5kIGogaW4gbnVtYV9zZXR1cCBwcmludA0KPiA+ICAgICBtZXNzYWdl
cy4NCj4gDQo+IFRoZSBvbmx5IGluc3RhbmNlcyBvZiBub2RlaWRfdCB0eXBlZCB2YXJpYWJsZSB1
c2VzIHRoYXQgSSB3YXMgYWJsZSB0bw0KPiBmaW5kIGFyZSBpbiBkdW1wX251bWEoKS4gSSBndWVz
cyB5b3UgY2FuIGxlYXZlIHRoZW0gdGhhdCB3YXksIGJ1dA0KPiBzdHJpY3RseSBzcGVha2luZyAl
dSBpc24ndCBjb3JyZWN0IHRvIHVzZSBmb3Igbm9kZWlkX3QgKGFzIGl0IHByb21vdGVzDQo+IHRv
IGludCwgbm90IHRvIHVuc2lnbmVkIGludCkuDQoNCkluIHRoaXMgY2FzZSwgSSB3aWxsIHJlc3Rv
cmUgdGhlbSB0byAlZC4NCg0KPiANCj4gPiAgNS4gVXNlIG1pbihQQUREUl9CSVRTLCBCSVRTX1BF
Ul9MT05HIC0gMSkgdG8gY2FsY3VsYXRlIHRoZSBzaGlmdA0KPiA+ICAgICB3aGVuIG9ubHkgb25l
IG5vZGUgaXMgaW4gdGhlIHN5c3RlbS4NCj4gDQo+IFRoaXMgY2hhbmdlIG5lZWRzIG1lbnRpb25p
bmcgLyBqdXN0aWZ5aW5nIGluIHRoZSBkZXNjcmlwdGlvbi4NCj4gDQoNCg0KSSB3aWxsIGRvIGl0
Lg0KDQo+ID4gK3N0YXRpYyB2b2lkIGNmX2NoZWNrIGR1bXBfbnVtYSh1bnNpZ25lZCBjaGFyIGtl
eSkNCj4gPiArew0KPiA+ICsgICAgc190aW1lX3Qgbm93ID0gTk9XKCk7DQo+ID4gKyAgICB1bnNp
Z25lZCBpbnQgaSwgaiwgbjsNCj4gPiArDQo+ID4gKyAgICBwcmludGsoIk1lbW9yeSBsb2NhdGlv
biBvZiBlYWNoIGRvbWFpbjpcbiIpOw0KPiA+ICsgICAgZm9yX2VhY2hfZG9tYWluICggZCApDQo+
ID4gKyAgICB7DQo+ID4gKyAgICAgICAgY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsNCj4g
PiArICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9udW1fbm9kZVtNQVhfTlVNTk9ERVNdOw0KPiA+
ICsgICAgICAgIGNvbnN0IHN0cnVjdCB2bnVtYV9pbmZvICp2bnVtYTsNCj4gPiArDQo+ID4gKyAg
ICAgICAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQo+ID4gKw0KPiA+ICsgICAgICAgIHBy
aW50aygiRG9tYWluICV1ICh0b3RhbDogJXUpOlxuIiwgZC0+ZG9tYWluX2lkLA0KPiBkb21haW5f
dG90X3BhZ2VzKGQpKTsNCj4gDQo+IFBlcmhhcHMgc3dpdGNoIHRvIHVzaW5nICVwZCBoZXJlPw0K
PiANCg0KRGlkIHlvdSBtZWFuICVkIGZvciBkLT5kb21haW5faWQgaGVyZT8NCg0KPiA+ICsgICAg
ICAgIG1lbXNldChwYWdlX251bV9ub2RlLCAwLCBzaXplb2YodW5zaWduZWQgaW50KSAqIE1BWF9O
VU1OT0RFUyk7DQo+IA0KPiBTaW1wbHkgKGFuZCBsZXNzIGZyYWdpbGUpIHNpemVvZihwYWdlX251
bV9ub2RlKT8NCg0KT2suDQoNClRoYW5rcywNCldlaSBDaGVuDQoNCj4gDQo+IEphbg0K

