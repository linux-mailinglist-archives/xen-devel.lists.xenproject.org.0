Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DA5733F9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 12:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366446.597219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZQB-00049R-Ag; Wed, 13 Jul 2022 10:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366446.597219; Wed, 13 Jul 2022 10:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZQB-000471-7l; Wed, 13 Jul 2022 10:16:43 +0000
Received: by outflank-mailman (input) for mailman id 366446;
 Wed, 13 Jul 2022 10:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKIO=XS=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBZQ9-00046v-NP
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 10:16:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150054.outbound.protection.outlook.com [40.107.15.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1fa702c-0294-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 12:16:39 +0200 (CEST)
Received: from DB9PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:1d9::25)
 by DB6PR08MB2853.eurprd08.prod.outlook.com (2603:10a6:6:1d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 10:16:36 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::41) by DB9PR02CA0020.outlook.office365.com
 (2603:10a6:10:1d9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Wed, 13 Jul 2022 10:16:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 10:16:36 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Wed, 13 Jul 2022 10:16:36 +0000
Received: from c6f78b4064e4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D43A93AA-15E9-42B5-89BF-1FB5A954AE94.1; 
 Wed, 13 Jul 2022 10:16:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6f78b4064e4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 10:16:30 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB3656.eurprd08.prod.outlook.com (2603:10a6:20b:51::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 10:16:28 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 10:16:28 +0000
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
X-Inumbo-ID: e1fa702c-0294-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YWwx3t2kOsv8lcp0+mxOyvq9IehEWLPBqp6gQyTP5WGDbv+JbYroIVeXjBh31DvgWG4uTmlWLJoEQgXZXA6eSW6Q89bc1Udk6Ofo+OxFvd4sRSIP0DChCSiYdCVik6d3kps7SJGtJd0cssDIEMMrHPfso/+ckESe1XYP78Ss63pbrix1ERZCd8CUBTxvdiDHWfJUP0djoB9SzjauU0p7OdMPUN+XklUvSXgNv4IGf2v6ck0FV2q0mKMm3o8Q+eFLN7557lYKu3KnUBsY/cg38izYvI6Y5xhfJQVGsMJzuH8879LRH3WxM6EZ6jHp6+2L0FQlvz0kULCGaKI1lnK1Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xb0w0KYqHRAgHMHI5tHJCkEqglPE9kxIQ9fuCXjxuS4=;
 b=ceyI9jmXSDzHq2xJ4+F1Amnly4+kEjYjzsCPixt59Me30JbgwNDsFxEuIndP4FgiWvxlUTYwoZR/zgoaoAcER6wXOcx0sf0OlgsbwP15+Wp7vYDylkRi3Redb7u7yr7wroinfdsFE/bZO2rwndrhJU548KJz8J8CyJ0FO+sbqodBNbnpQdAbMZzm4llxrJKeWYYj/NUNihwQ2kjEQ9rbSxC/WEvCErk+jYY+3/E3Kefh8wf77BZtK90XELqCx54VD+hzHo2CNIxUY1KyNw5llniyca0aHOpWZgKnYFnhGwrbcBTAYAJj9gMvPrO6Whz1P04YkhvzPC7bP71vhPZL6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xb0w0KYqHRAgHMHI5tHJCkEqglPE9kxIQ9fuCXjxuS4=;
 b=hdQtyB2rcTiHSfVKty28zqPJD1CoIyj1wmnYw72UjsXhzjPjtMB+ttSP2FAHaj089fCazguYSlvdO3cb5gyouuEfuOMbcj3Jjg+zqVsP78qpgJ9IPEIagVv58McsvRcwtuLeYMnQV0q29n27IEcjWxjLfsHZsWIGv53ysAmoyaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yz9ZXHi8+VZqtHP/YGMoEL2E2C9bf7718yrcHLCLs6Y4yCcaN3SGsCObw0TsPc1VXadJHVtve/3YZ0L2bQVO3ECa9Z4u7JR9wTbUC4IGvWnjd1JWWafCTJ/ONVzGLfRRkqX0IlAYGtWJokSkP657LIUh+glXtUMpKpZF8ZQ0WzJcISTjSwY+Ba8BtBBwN0Jd4wWUwKPCfwklVuM4hCRn9Mz1D+goLEaZhleRJvgb2+aEPsZv1zUr86rxwXaDKJA9PyAJKU5f6HBQUT43YpJ6f5eiyzNjMQCYKq8gvAygF2RjMWAOaGwA+jBFKxWHm/eknmrW2YxJVKLQOF+5zeCy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xb0w0KYqHRAgHMHI5tHJCkEqglPE9kxIQ9fuCXjxuS4=;
 b=Swt+4fg2DidimDiRCDoqnUXN3Pgxod1tGck3b2+q/7RZbPF3gHUF3wm4XwBYWvbX5m2NHdvM37mef0nY2Evchhkn/ZbUvxjfyhCKzGHHl8xYD/uUrh3oHxW9BBY5CI+fYxMDL0FTfKImLQ+Hb48EgcmhAzOq5Yo0MvuusEvbrrBOT5eHG09FzUr+2rSg2gkg5YsBbxjMEA2DBWbwgoWrY4Nt3abcoSTLVa4TSmQHRH9q19ZkLlpg0s0fTncP0P7VFeN99/jjkEZJ8gNdShlu3D+1v42kBCxdVucgAGrgS5afd5jRxy4nIGsgb1Xcuv2VmJUpxLqtt7rF2uPH0clMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xb0w0KYqHRAgHMHI5tHJCkEqglPE9kxIQ9fuCXjxuS4=;
 b=hdQtyB2rcTiHSfVKty28zqPJD1CoIyj1wmnYw72UjsXhzjPjtMB+ttSP2FAHaj089fCazguYSlvdO3cb5gyouuEfuOMbcj3Jjg+zqVsP78qpgJ9IPEIagVv58McsvRcwtuLeYMnQV0q29n27IEcjWxjLfsHZsWIGv53ysAmoyaI=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 3/9] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v2 3/9] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHYktq7O5jRSbf360ijLU+hFXQsAa16vIcAgAFcEGA=
Date: Wed, 13 Jul 2022 10:16:27 +0000
Message-ID:
 <PAXPR08MB7420A924BADFE32032B7B3DE9E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-4-wei.chen@arm.com>
 <444a540a-bf0f-f743-3b01-b65210b49361@suse.com>
In-Reply-To: <444a540a-bf0f-f743-3b01-b65210b49361@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B2602CFA98F64F46BD24D2ABBB9648D6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d0d327c1-5841-4528-0931-08da64b8c4a4
x-ms-traffictypediagnostic:
	AM6PR08MB3656:EE_|DBAEUR03FT010:EE_|DB6PR08MB2853:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mMz8V3D5b/coUzOTcxkPq9p+lz6YM0L9ZKvB8+PYjauBBvpxzYjM3wYqJOHadVRu2zOS4L1jqOnCtQSalwuNmEfbY+wbv9aMkkrJRehgxIdGBKrdQuj4x21EFpfQT+4FqIrO9miGLTO3ra4lfo44R9zsJX4OkqtPRbEcjYR6YuRhy/8LkZcwNS6oPF+js5NOCSoei07MKNSrXGRPOwIgxkYbDFleA85AbZf2AZ/fxrHLs9hdOyKVsBRVYAR1r8X2lX8Qvt89h9W0uhFp2cdEaP0kDB5bv2Isey1TiqBGlBa/6bZ45tPrSQ0Spp31Fsmfp4HzuB8zk4EkxNnyiANey+WbynKzxwUm0i5eP4RV+t4gPBLGYvSlA9yikRvDGjqFHv35PtOE+irnfTn3yO7Hvie7mw4SBl87aKIbF40OBXGO9XPJJO+CugcV/pJhdGOODRMymphXNmK7C+ZruNWWLuL3cuCy28/juRMs3GDBa2KR2crI4oBSCL5uy2+9CYdodcQOmtl61Z2lSpHgjysJ/Qbp7D+06EZ5DeXRpYYc0qBdGHxUHL+frwCgTaou+ZKTSAsXBRNdbfJVsyeZAT8TzIPp3lpk40TFK4XPp0N02NMhtsoHeDQxI9W/qcZcKfM4XFEhNWI+Fa/Gv7bR382B8jvEEUmY86kn/fcYuUAuok94230q23p1W5u3OdOUgmW83ms1d6himyqo/l2fMQ1NbgtCt7llG0hBwRbTP0sQ/41VXr/nIrYcMfh9Yt9zp0i6V9vXRDq9o/kd9pHwwtEbaLwDiOLj8L6OQkFm59mVmrVJAtWJO1mZWipxRF2rGqk7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(38100700002)(5660300002)(64756008)(54906003)(8676002)(66476007)(6506007)(66556008)(4326008)(76116006)(66446008)(66946007)(71200400001)(478600001)(41300700001)(7696005)(53546011)(122000001)(2906002)(316002)(86362001)(83380400001)(186003)(26005)(38070700005)(33656002)(6916009)(8936002)(55016003)(52536014)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3656
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	723f42b0-319b-41f5-6d5a-08da64b8bfc3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sxMjy3ED2u4Ag+JMDmSR9aP/sBiLvRbBysVAuX/cw4bd+ylfJ7aBK813B/cX5SvD5urVTd+vwSbw1g9vt5P0zs7f2A9sN3cPpT+sFh2n3uIOkdkvZF59O1Q6cGzU3B8F+UUej/dlv/CdirNhznSlptX+MWJMqAY5pwsWi3yAHU5YVCeAR4Epg1sDDqBDiR/0qNo8QA1dOoE5sd3yyhNjl5PSTlOqAAl4K00kF+vGxeDD2BavgN0+fNhOoxQFwPQr4nes+7EduB8evqxJ7Q4wg91/i/gDI4AyXo81xFdlaESJrK3H5IBSg69buL0hEOdz8S4+LSx8Vrc/hS5MHrntctqwSesapKWmmDHIiEQxeU5JGORqNdXGJrkg4LgO2kyK8UOLpKs7iXF6wyI1zoCgnZqhATvcYdgVxHdtFDeBJ2sGpy7KafrYTzzNUoKn8rPOaHcalcds6fRQgvMdSZ+fm9TAU6Pl/M3XvCOrgqQSz4aFFTIgEg37bcIwHVkmrT+LqJkJ3Q6FoMbZGtC+gRKGOR52jVDf2thlfv6evv+Ux5FQ6PgS4/V9/w2yBKqP6Y0ZgpN41o5j4CAqaxvGDJhwfeMs3mQ23IatbZjrABkVMkLwkksrehjOjSZOwd3S+k21e7cibJoW4NFYNvSz9fiiRzAyfk2BMILqvuHM8xRnU8S8b8Pf1gmO/9iW5oaQchTbFXdxw8SFVrWs/5BYrThKfg2IABc+qmqLSJdV1d7uOryWX42zv0NztDd9l0GDGrjO4HkmARjI30697Xa7o3KauFwgXwAmnmLzT2+8e169zzmelT1qBtXIqYU4IhyC/wIM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(40470700004)(82740400003)(478600001)(26005)(8676002)(336012)(47076005)(8936002)(186003)(6506007)(7696005)(70586007)(81166007)(83380400001)(9686003)(70206006)(316002)(2906002)(53546011)(5660300002)(40460700003)(4326008)(356005)(82310400005)(6862004)(33656002)(52536014)(55016003)(86362001)(54906003)(40480700001)(36860700001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 10:16:36.0941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d327c1-5841-4528-0931-08da64b8c4a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2853

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAyMToxMw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMy85XSB4ZW4veDg2OiBtb3ZlIGdlbmVyaWNhbGx5IHVzYWJsZSBOVU1BIGNvZGUNCj4g
ZnJvbSB4ODYgdG8gY29tbW9uDQo+IA0KPiBPbiAwOC4wNy4yMDIyIDE2OjU0LCBXZWkgQ2hlbiB3
cm90ZToNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIveGVuL2NvbW1vbi9udW1hLmMNCj4g
PiBAQCAtMCwwICsxLDQzOSBAQA0KPiA+ICsvKg0KPiA+ICsgKiBHZW5lcmljIFZNIGluaXRpYWxp
emF0aW9uIGZvciBOVU1BIHNldHVwcy4NCj4gPiArICogQ29weXJpZ2h0IDIwMDIsMjAwMyBBbmRp
IEtsZWVuLCBTdVNFIExhYnMuDQo+ID4gKyAqIEFkYXB0ZWQgZm9yIFhlbjogUnlhbiBIYXJwZXIg
PHJ5YW5oQHVzLmlibS5jb20+DQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPHhlbi9p
bml0Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPg0KPiA+ICsjaW5jbHVkZSA8
eGVuL21tLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gPiArI2luY2x1ZGUg
PHhlbi9udW1hLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vcGFyYW0uaD4NCj4gPiArI2luY2x1ZGUg
PHhlbi9zY2hlZC5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4NCj4gPiArI2luY2x1
ZGUgPGFzbS9hY3BpLmg+DQo+IA0KPiBJc24ndCB0aGUgZ29hbCBmb3IgdGhlIG5vdyBjb21tb24g
Y29kZSB0byBub3QgYmUgZGVwZW5kZW50IHVwb24gQUNQST8NCj4gDQoNCkFoLCBnb29kIGNhdGNo
LCBjdXJyZW50IGNvbW1vbiBjb2RlIHNob3VsZCBiZSBBQ1BJIGRlY291cGxlZC4NCkkgd2lsbCBy
ZW1vdmUgIiNpbmNsdWRlIDxhc20vYWNwaS5oPiINCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KPiA+
ICtzdHJ1Y3Qgbm9kZV9kYXRhIG5vZGVfZGF0YVtNQVhfTlVNTk9ERVNdOw0KPiA+ICsNCj4gPiAr
LyogTWFwcGluZyBmcm9tIHBkeCB0byBub2RlIGlkICovDQo+ID4gK2ludCBtZW1ub2RlX3NoaWZ0
Ow0KPiA+ICtzdGF0aWMgdHlwZW9mKCptZW1ub2RlbWFwKSBfbWVtbm9kZW1hcFs2NF07DQo+ID4g
K3Vuc2lnbmVkIGxvbmcgbWVtbm9kZW1hcHNpemU7DQo+ID4gK3U4ICptZW1ub2RlbWFwOw0KPiAN
Cj4gRm9yIGNvZGUgbW92ZWQsIHBsZWFzZSBzd2l0Y2ggdG8gKGluIHRoaXMgY2FzZSkgdWludDhf
dC4gSSdtIG9uIHRoZQ0KPiBlZGdlIG9mIGFza2luZyB0byBnbyBmdXJ0aGVyIGFuZA0KPiAtIGFs
c28gdXNlIF9fcmVhZF9tb3N0bHkgZm9yIHNvbWUgLyBhbGwgb2YgdGhlc2UsDQo+IC0gbWFrZSBt
ZW1ub2RlX3NoaWZ0IHVuc2lnbmVkIGludCAoc2FkbHkgdGhpcyBsb29rcyB0byByZXF1aXJlIG1v
cmUNCj4gICBhZGp1c3RtZW50cywgZXZlbiBpZiBuZWdhdGl2ZSBzaGlmdCBjb3VudHMgYXJlIG1l
YW5pbmdsZXNzKSwNCj4gLSBjb252ZXJ0IGZyb20gcGxhaW4gaW50IHRvIHVuc2lnbmVkIGludCBl
bHNld2hlcmUgYXMgYXBwcm9wcmlhdGUsDQo+IC0gYWRkIGNvbnN0IHdoZXJlIGFwcHJvcHJpYXRl
IC8gcG9zc2libGUuDQo+IA0KDQpPaywgSSB3aWxsIGFkZHJlc3MgdGhlbSBpbiBuZXh0IHZlcnNp
b24uDQoNCj4gPiArbm9kZWlkX3QgY3B1X3RvX25vZGVbTlJfQ1BVU10gX19yZWFkX21vc3RseSA9
IHsNCj4gPiArICAgIFswIC4uLiBOUl9DUFVTLTFdID0gTlVNQV9OT19OT0RFDQo+ID4gK307DQo+
ID4gKw0KPiA+ICtjcHVtYXNrX3Qgbm9kZV90b19jcHVtYXNrW01BWF9OVU1OT0RFU10gX19yZWFk
X21vc3RseTsNCj4gDQo+IEZvciB0aGVzZSB0d28gcGxlYXNlIHB1dCBfX3JlYWRfbW9zdGx5IGlu
dG8gaXRzIG1vcmUgY29udmVudGlvbmFsDQo+IHBsYWNlIChyaWdodCBhZnRlciB0aGUgdHlwZSku
DQo+IA0KDQpPay4NCg0KPiA+ICtub2RlbWFza190IF9fcmVhZF9tb3N0bHkgbm9kZV9vbmxpbmVf
bWFwID0geyB7IFswXSA9IDFVTCB9IH07DQo+ID4gKw0KPiA+ICtlbnVtIG51bWFfbW9kZSBudW1h
X3N0YXR1czsNCj4gDQo+IFRoaXMgc2hvdWxkIHByb2JhYmx5IGhhdmUgYmVlbiBfX3JlYWRfbW9z
dGx5IGFscmVhZHkgaW4gdGhlIGVhcmxpZXINCj4gcGF0Y2ggaW50cm9kdWNpbmcgaXQuDQo+IA0K
DQpPay4NCg0KPiA+ICsjaWZkZWYgQ09ORklHX05VTUFfRU1VDQo+ID4gK3N0YXRpYyBpbnQgbnVt
YV9mYWtlIF9faW5pdGRhdGEgPSAwOw0KPiANCj4gVGhlIF9faW5pdGRhdGEgYWdhaW4gd2FudHMg
dG8gbW92ZSwgYW5kIHRoZSBpbml0aWFsaXplciBjYW4gYmUgb21pdHRlZC4NCj4gDQoNCk9rLg0K
DQo+ID4gKy8qIFtudW1hPW9mZl0gKi8NCj4gPiArc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sg
bnVtYV9zZXR1cChjb25zdCBjaGFyICpvcHQpDQo+ID4gK3sNCj4gPiArICAgIGlmICggIXN0cm5j
bXAob3B0LCJvZmYiLDMpICkNCj4gDQo+IEFzIHlvdSdyZSBjb3JyZWN0aW5nIHN0eWxlIHZpb2xh
dGlvbnMgZWxzZXdoZXJlLCBwbGVhc2UgYWxzbyBpbnNlcnQgdGhlDQo+IG1pc3Npbmcgc3BhY2Vz
IGhlcmUgYW5kIGJlbG93Lg0KPiANCg0KQWNrLg0KDQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L251bWEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gPiBAQCAtMTgsNCAr
MTgsNzggQEANCj4gPiAgICAoKChkKS0+dmNwdSAhPSBOVUxMICYmIChkKS0+dmNwdVswXSAhPSBO
VUxMKSBcDQo+ID4gICAgID8gdmNwdV90b19ub2RlKChkKS0+dmNwdVswXSkgOiBOVU1BX05PX05P
REUpDQo+ID4NCj4gPiArLyogVGhlIGZvbGxvd2luZyBjb250ZW50IGNhbiBiZSB1c2VkIHdoZW4g
TlVNQSBmZWF0dXJlIGlzIGVuYWJsZWQgKi8NCj4gPiArI2lmZGVmIENPTkZJR19OVU1BDQo+ID4g
Kw0KPiA+ICtleHRlcm4gbm9kZWlkX3QgICAgICBjcHVfdG9fbm9kZVtOUl9DUFVTXTsNCj4gPiAr
ZXh0ZXJuIGNwdW1hc2tfdCAgICAgbm9kZV90b19jcHVtYXNrW107DQo+ID4gKw0KPiA+ICsjZGVm
aW5lIGNwdV90b19ub2RlKGNwdSkgICAgICAgIChjcHVfdG9fbm9kZVtjcHVdKQ0KPiA+ICsjZGVm
aW5lIHBhcmVudF9ub2RlKG5vZGUpICAgICAgIChub2RlKQ0KPiA+ICsjZGVmaW5lIG5vZGVfdG9f
Zmlyc3RfY3B1KG5vZGUpIChfX2Zmcyhub2RlX3RvX2NwdW1hc2tbbm9kZV0pKQ0KPiA+ICsjZGVm
aW5lIG5vZGVfdG9fY3B1bWFzayhub2RlKSAgIChub2RlX3RvX2NwdW1hc2tbbm9kZV0pDQo+ID4g
Kw0KPiA+ICtzdHJ1Y3Qgbm9kZSB7DQo+ID4gKyAgICBwYWRkcl90IHN0YXJ0LCBlbmQ7DQo+ID4g
K307DQo+ID4gKw0KPiA+ICtleHRlcm4gaW50IGNvbXB1dGVfaGFzaF9zaGlmdChzdHJ1Y3Qgbm9k
ZSAqbm9kZXMsIGludCBudW1ub2RlcywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbm9kZWlkX3QgKm5vZGVpZHMpOw0KPiA+ICsNCj4gPiArI2RlZmluZSBWSVJUVUFMX0JVR19P
Tih4KQ0KPiA+ICsNCj4gPiArLyogRW51bWVyYXRpb25zIGZvciBOVU1BIHN0YXR1cy4gKi8NCj4g
PiArZW51bSBudW1hX21vZGUgew0KPiA+ICsgICAgbnVtYV9vbiA9IDAsDQo+ID4gKyAgICBudW1h
X29mZiwNCj4gPiArICAgIC8qIE5VTUEgdHVybnMgb24sIGJ1dCBBQ1BJIHRhYmxlIGlzIGJhZCBv
ciBkaXNhYmxlZC4gKi8NCj4gPiArICAgIG51bWFfbm9fYWNwaSwNCj4gPiArICAgIC8qIE5VTUEg
dHVybnMgb24sIGFuZCBBQ1BJIHRhYmxlIHdvcmtzIHdlbGwuICovDQo+ID4gKyAgICBudW1hX2Fj
cGksDQo+ID4gK307DQo+ID4gKw0KPiA+ICtleHRlcm4gdm9pZCBudW1hX2FkZF9jcHUoaW50IGNw
dSk7DQo+ID4gK2V4dGVybiB2b2lkIG51bWFfaW5pdF9hcnJheSh2b2lkKTsNCj4gPiArZXh0ZXJu
IHZvaWQgbnVtYV9pbml0bWVtX2luaXQodW5zaWduZWQgbG9uZyBzdGFydF9wZm4sIHVuc2lnbmVk
IGxvbmcNCj4gZW5kX3Bmbik7DQo+ID4gK2V4dGVybiBib29sIG51bWFfZW5hYmxlZF93aXRoX2Zp
cm13YXJlKHZvaWQpOw0KPiA+ICtleHRlcm4gZW51bSBudW1hX21vZGUgbnVtYV9zdGF0dXM7DQo+
ID4gKw0KPiA+ICtleHRlcm4gdm9pZCBudW1hX3NldF9ub2RlKGludCBjcHUsIG5vZGVpZF90IG5v
ZGUpOw0KPiA+ICtleHRlcm4gdm9pZCBzZXR1cF9ub2RlX2Jvb3RtZW0obm9kZWlkX3Qgbm9kZWlk
LCBwYWRkcl90IHN0YXJ0LCBwYWRkcl90DQo+IGVuZCk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgY2xlYXJfbm9kZV9jcHVtYXNrKGludCBjcHUpDQo+ID4gK3sNCj4gPiArICAgIGNw
dW1hc2tfY2xlYXJfY3B1KGNwdSwgJm5vZGVfdG9fY3B1bWFza1tjcHVfdG9fbm9kZShjcHUpXSk7
DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qIFNpbXBsZSBwZXJmZWN0IGhhc2ggdG8gbWFwIHBkeCB0
byBub2RlIG51bWJlcnMgKi8NCj4gPiArZXh0ZXJuIGludCBtZW1ub2RlX3NoaWZ0Ow0KPiA+ICtl
eHRlcm4gdW5zaWduZWQgbG9uZyBtZW1ub2RlbWFwc2l6ZTsNCj4gPiArZXh0ZXJuIHU4ICptZW1u
b2RlbWFwOw0KPiA+ICsNCj4gPiArc3RydWN0IG5vZGVfZGF0YSB7DQo+ID4gKyAgICB1bnNpZ25l
ZCBsb25nIG5vZGVfc3RhcnRfcGZuOw0KPiA+ICsgICAgdW5zaWduZWQgbG9uZyBub2RlX3NwYW5u
ZWRfcGFnZXM7DQo+ID4gK307DQo+ID4gKw0KPiA+ICtleHRlcm4gc3RydWN0IG5vZGVfZGF0YSBu
b2RlX2RhdGFbXTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXygocHVy
ZSkpIG5vZGVpZF90IHBoeXNfdG9fbmlkKHBhZGRyX3QgYWRkcikNCj4gDQo+IFBsZWFzZSB1c2Ug
X19hdHRyaWJ1dGVfcHVyZV9fLg0KPiANCg0KQWNrLg0KDQo+IEphbg0K

