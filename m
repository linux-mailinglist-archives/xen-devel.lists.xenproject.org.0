Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BCD615E32
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435640.689272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9O9-0005pd-13; Wed, 02 Nov 2022 08:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435640.689272; Wed, 02 Nov 2022 08:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9O8-0005mi-TZ; Wed, 02 Nov 2022 08:46:20 +0000
Received: by outflank-mailman (input) for mailman id 435640;
 Wed, 02 Nov 2022 08:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unuU=3C=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oq9O7-0005m3-Dy
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:46:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1203af1-5a8a-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 09:46:18 +0100 (CET)
Received: from DB6P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::15) by
 PAXPR08MB7550.eurprd08.prod.outlook.com (2603:10a6:102:24d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.21; Wed, 2 Nov 2022 08:46:15 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::dc) by DB6P195CA0005.outlook.office365.com
 (2603:10a6:4:cb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Wed, 2 Nov 2022 08:46:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 08:46:14 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Wed, 02 Nov 2022 08:46:14 +0000
Received: from f543fb238fa0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BC1D5D9-64A2-4A3E-8312-97F211CB72BD.1; 
 Wed, 02 Nov 2022 08:46:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f543fb238fa0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Nov 2022 08:46:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7401.eurprd08.prod.outlook.com (2603:10a6:20b:4c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 08:46:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 08:46:06 +0000
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
X-Inumbo-ID: d1203af1-5a8a-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HSNZPpN1VdnEYAm+BhRBGF7q3mu3y8VEfpNvWG1gMBFfWDf258niWdY06qH8OIeqVyC4aC2k9nGhf1Lg2iUo0N0CkpGAPMeME0C5xobCvF+jgCy4lcJywQlNrRqBzuijg2ojhaKwW0N9X2G+jRr+9oaeYG0YShaGtTPoKodnk/sQdMA5Vjmp/6ukl+suFjuArJrDU416QibetB2iTrDZmOsgkSvbkvigkRM14nhU1slMm8My0DUPG/Dec5amPOt1EOdO8CWldS1zKW78LsUIguie2HCnFaXi5yLlOrMRICHJaLly/P/xpPmNwVtM39wvb/6X5kkztJu0VSa/ZDaSAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZAJMsg5VB2gzKE8hg7O1E/6R/0GVI0d5VUs9fDRXnI=;
 b=X4X4nqwBBMoQLIDjCrHhLGqbI1NK+VGJCp0riPU+Gxr1PcruVkJ8MHQ8qeZ0YM2t7e+soQvBj00jLjng6ATaY+xlXmtyZcNURKY9e+YYylUvKJNEtQJtA76GOxy4avlwOnn2F+9sx8rOSZ60ICFYYSPqx6vBhD+vM6Zk9Vb1m573S47chcS6V6gOQR86IcQhxp+zdtX6axgkLXI5OTV8VF2gW4dnJasc3yfHZjAhbSxPxsgokMY0t8JZaovAqfJJQXfcpItBxjhLtB+7qBDoXGWxiMX9RfonJuYNl8WxHRL9TqggutDGankxecpuvB2whpZs90BOuTA3kOu6keBDjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZAJMsg5VB2gzKE8hg7O1E/6R/0GVI0d5VUs9fDRXnI=;
 b=pgvzwZIInZ6w5putUy/6NKM56VgoR+K/RtcU3Dauxc3Kt4XcZ9LziowwxksBwBda/g0MQy4hBg9eYVDasMSLQ6gik8YMAcAONl+ULc/+7M8kqFXqAa1Jqz97OGuqpkS1KkrDJQ85ARKbv8KVzBJtMoT0pWVOSPzpKRZuZevxsnc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTuycf9zzlbxqYTxQdkjOkm5i4oMStiO98sPjycXlUXD5PnjTlYaBWFhq+LgXkJuHB9KMm1kvOrxBVO3OO9vhex0ekul6+XXJjRRWkpVmlmjnF9/VfwkWvJ3XNipZWAr1WzHPfQZouu7QM2qOGKT4tRJ9SMymPu5wLJn2eBNzVFzwcCiPGQQYVqQmABgdWssADTfrktWA8fRa5yP3uUGOgXibZUWEBPI7S5Nv+b7wEeZ9zUf8B5A9ISRwPgLqQl+jic+5q7NJuf1SQixhR74kFx4wRLYeQzziLDfhrhnw31XYRHzfGvlK9eWp5Kv1bUG/8JqnWkkXTZmccx9VrNpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZAJMsg5VB2gzKE8hg7O1E/6R/0GVI0d5VUs9fDRXnI=;
 b=aAIsiGWKGPPPmPf858ZzOuVatVo6Iu4WLwY0d+i9pttOwsgrlsxELK1Tdc123hgg3+WJUqI+bNjvS6ytqqJWjA5RDpA51sDPpbIT0OLtiDL1ofrA546dlXggQT5nv97MrXu0OHiqxFY7rEc0DIjK/5t/D77UfV/VcSj8MGGbyVigrIqIjdnqomfVh67pdoMJTv3sr63KckBULvV8iQ7zFp2Mo8nJd4KUL6yYIfhARO4a4kwf79onRf6gCn75LsuDwlVFS1MZXjPaNnp3PcjVJjJNMCeKkVj7O+UEjsWCZgQ4eMWnKlKsBVa7fnI0SjMHoXi9zpNel3C9lCoPpJnqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZAJMsg5VB2gzKE8hg7O1E/6R/0GVI0d5VUs9fDRXnI=;
 b=pgvzwZIInZ6w5putUy/6NKM56VgoR+K/RtcU3Dauxc3Kt4XcZ9LziowwxksBwBda/g0MQy4hBg9eYVDasMSLQ6gik8YMAcAONl+ULc/+7M8kqFXqAa1Jqz97OGuqpkS1KkrDJQ85ARKbv8KVzBJtMoT0pWVOSPzpKRZuZevxsnc=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17 v2 1/3] hvm/msr: load VIRT_SPEC_CTRL
Thread-Topic: [PATCH for-4.17 v2 1/3] hvm/msr: load VIRT_SPEC_CTRL
Thread-Index: AQHY6sNlCXMYVGLn/0u9RJaApMVaua4otHcAgAKk/kA=
Date: Wed, 2 Nov 2022 08:46:06 +0000
Message-ID:
 <AS8PR08MB7991363682CC3B3CEE22692792399@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221028114913.88921-1-roger.pau@citrix.com>
 <20221028114913.88921-2-roger.pau@citrix.com>
 <2d1f7271-1399-f5ea-9519-9db4e4ca3de0@suse.com>
In-Reply-To: <2d1f7271-1399-f5ea-9519-9db4e4ca3de0@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8ABE42886634D04EAFB65A7C1EE184ED.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7401:EE_|DBAEUR03FT063:EE_|PAXPR08MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: f3557d03-2036-45c7-083a-08dabcaeb37a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9vYMuM0lCAXB0IQTv1lLN6NsF+R4o4zKT77cYdxn3AZRVXVsN88S3Z9MvUaSRdaYfXQ+u3kwEssDW9Mo8HCiouRyPcJCRq15bbOkQ+pasCVzV9Aq+m6SHQ0WjH/UV2Ehf4PllVyugs7yGrLYQbXoJw38Xl3TOrDlpYEEnth29aR/OZuvjs2MPXUtjKrDzc3qGLm75Nww37aqkT7141H5A2vrRZ58NvNtsoMQaPn2v8dRsb53ZDL4CcT9ktB9TCvk5XP2+dcyHBFjmaQIW9SztZHiUMNDhVLZ/hFvt64jamCSzzvNWdnjSMvCtj2bzKs+Ds2dv7THeyd5/Et5kPD40/hh2fCv+d2g+12NF9R6/VA1IneVKoxx8ijGGSIPJUXm42S1Bw+0QdUBfS8h4W1v28eNm7kK1CyYJyafbTnNHDwJMEi+BfJnhYqtz9LCKfQfbpwvazBs3EObgYe3saUhwDc2085Il7RLZwkkFGdAWrRMcCPh/4Cq6OzpgVwodplzIBIPJp8bX1Z4rzyc3eBT8u6eXGFIzvQ9nut15NHka1YhufGwWQynd75zDWERgewAhZJzQk9IwPMWQWDxZD133VItdOBCrYhErra8csd/LQhei+ZWlp0Q1O+9sqbIWwO9SqgHnxGjEPo+1VBQF9AaBv4zAW1sgxYamwvAtTmIKZrfVuG+UaZncjsCU0QDRWRRGjhz4/Gn0RdhT7LyzHrwhUERcp/HPoTOgNLUA6/bkyTd1VQr98ExBQIjIoe+YysAyf8hRvw0KBpvu1/ULZNuZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(7696005)(33656002)(38070700005)(26005)(86362001)(9686003)(53546011)(55016003)(8676002)(41300700001)(6506007)(4326008)(186003)(316002)(66476007)(4744005)(76116006)(52536014)(71200400001)(66446008)(478600001)(66946007)(110136005)(122000001)(54906003)(38100700002)(5660300002)(64756008)(83380400001)(8936002)(66556008)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7401
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	678e44e4-7829-4418-05cf-08dabcaeaec9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mvHkzj2J3yUJmIiSDVJ09e10Gkq3yKa+ueo/LLsAI1bM7N+nY71jSLBbPzD3rgVgfj8B9XdwbQyj32BTldigc0EL7gLD7fRcxIGOfiX1FeE77e27SFBrkR6mbejaqXwrB6yHHVr2i9+OZosrU/c59GqrYxnK1uzHZKaImJdxO2agEXS8uvJBL2GqNALswlN300nOqV9tJPUJdbHMLlUcu75B0/tbUpbUBfKgYNIt26Jh6EY58qBX16xF2c42kPNh1PCN4Xdu2vVQwJWxiKJL365y7X726DQvdhpITC0yYQp+iVVh+RA5g0Kds9Y5WB6/tGFJvLAU3m5zMFgqLP6+lCwwycbqWZe2L2emJudAvVNYc41ssIc8V/svi+1XGQ5oCcPl+cBwCFpEbrtkNzp9Jt5+kNRNwXR+uqwG1+Yh4NICSxvw+WcJBzcXTv7U8NW7EbWC2tgaTYTR53uTY11U7P8DDpm8HZuF+l+5jc1i/384EMCUYpdTds4WGCW8gCX5Bwt18v46Jf7tVfMu6XsKJImSR6vTNJtYLh3Bd8lb17/cIQ2lTTfxfHXilcjJoWvEj80LTGkqsUaa3PoffWjYc9SJE6AYgy5Jlevs+pIJz3PPGl42fGK+IHPak4cvg+MmHAX+cKCg3OwKFQPEVxHWcuoNUx7Q5lGS/FPVf9aj/1DiSZ3X/bVtLrJxrSIdZpcXlgrHU9cKY2YctICw4gFmTbq3R1/UH7CHhHgQ+x0mvxr16wEp8L4HykxxhxWt6y3sPA1KFW7mEI7vIDmmS05tmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(86362001)(83380400001)(33656002)(356005)(82740400003)(4744005)(5660300002)(2906002)(70206006)(70586007)(8936002)(52536014)(41300700001)(36860700001)(7696005)(81166007)(4326008)(6506007)(53546011)(82310400005)(40460700003)(336012)(186003)(9686003)(26005)(316002)(54906003)(8676002)(478600001)(55016003)(40480700001)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 08:46:14.7640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3557d03-2036-45c7-083a-08dabcaeb37a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7550

SGkgYm90aCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTcg
djIgMS8zXSBodm0vbXNyOiBsb2FkIFZJUlRfU1BFQ19DVFJMDQo+IA0KPiBPbiAyOC4xMC4yMDIy
IDEzOjQ5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+ID4gQWRkIE1TUl9WSVJUX1NQRUNfQ1RS
TCB0byB0aGUgbGlzdCBvZiBNU1JzIGhhbmRsZWQgYnkNCj4gPiBodm1fbG9hZF9jcHVfbXNycygp
LCBvciBlbHNlIGl0IHdvdWxkIGJlIGxvc3QuDQo+ID4NCj4gPiBGaXhlczogOGZmZDU0OTZmNCAo
J2FtZC9tc3I6IGltcGxlbWVudCBWSVJUX1NQRUNfQ1RSTCBmb3IgSFZNIGd1ZXN0cw0KPiBvbiB0
b3Agb2YgU1BFQ19DVFJMJykNCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCg0KUmVsZWFzZS1h
Y2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMs
DQpIZW5yeQ0KDQo=

