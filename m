Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B150A53B697
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 12:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341024.566190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhjc-0002UJ-1M; Thu, 02 Jun 2022 10:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341024.566190; Thu, 02 Jun 2022 10:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhjb-0002SA-Tx; Thu, 02 Jun 2022 10:07:19 +0000
Received: by outflank-mailman (input) for mailman id 341024;
 Thu, 02 Jun 2022 10:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifcq=WJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nwhjZ-0002S4-WC
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 10:07:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6e1cd2a-e25b-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 12:07:15 +0200 (CEST)
Received: from DB6PR0301CA0074.eurprd03.prod.outlook.com (2603:10a6:6:30::21)
 by VI1PR08MB5296.eurprd08.prod.outlook.com (2603:10a6:803:eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Thu, 2 Jun
 2022 10:07:11 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::6d) by DB6PR0301CA0074.outlook.office365.com
 (2603:10a6:6:30::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Thu, 2 Jun 2022 10:07:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Thu, 2 Jun 2022 10:07:10 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Thu, 02 Jun 2022 10:07:09 +0000
Received: from 835691efd495.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEAC8EB5-9375-45A2-9220-C09808849F4E.1; 
 Thu, 02 Jun 2022 10:07:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 835691efd495.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Jun 2022 10:07:03 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB3110.eurprd08.prod.outlook.com (2603:10a6:209:45::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Thu, 2 Jun
 2022 10:07:00 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::ccd5:23df:33bc:1b]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::ccd5:23df:33bc:1b%9]) with mapi id 15.20.5314.012; Thu, 2 Jun 2022
 10:07:00 +0000
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
X-Inumbo-ID: c6e1cd2a-e25b-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CBnRDK3+929jG2BEtKkF6ERVKUyv1B7CnsMtIYELe1PrJXPN04Ht474fyGkMBonJhIMqJZW1JAKSWuJrMGjPWYIlNg/bSUMvgaSuPHIj9x3AqFS9N6xRzGN4b3f7HNAjsDh+taRQx2aSVYhljq5UH5oUwdhRphkyinVlTCKIBU2HRjVK1UM/h9rc8ssmNlsIKAJdrn8IH85MCQEPpfV3NWc2W3x5qu/UcDoDxCHbwSrccioB84bjKMabpyqbkVvAn6MhtKkB5avg7EkwkrtaFFsEoO1kdICqjZR3okGXYiMhOABvmT4eVlRZ+wWDrF86e0xjI4YZq8BJMVGiuHRofg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGLT+CTPi9nVsaGk6By6eC6CzYWHyDyS0UPXgKX49HY=;
 b=Ry9Lo8PgPvPbLdOA0+bSRI4bxBWN/e1thiRR4SkcxwchmuRErm2U7W+qyYUBBesRhFX/hDFWpJ1Rk/XyG9u8GK0nlJkhxioOI/Pk7csNSezld1ToL+mmEFxugftYonx51fVeHvDtFN0TJbbyqrvbpBgKVfCGnFxmdMuehZ/ZIuEX1Sgxqm4LAiO1yuUy9ssXXILg3hHK5qjHjK1Eb0MTfR0YekjEa9EX6bMvMeHZWalenpOdoLh71rQ7HwgoxXC6a/JCv5VBcx1IBlOC3gsMH56OJPjZDR0Nd17/yRZ50ZwMrBLFxKZL4psljEmMgsaeHoQcQd7bqUxJfz7+T1gkKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGLT+CTPi9nVsaGk6By6eC6CzYWHyDyS0UPXgKX49HY=;
 b=ov54RxpNDBvAILM2GcMXIaPayRf/4FF5cwIhuR+K+fBGEPmFA4X/2kOHFn5BkcTTNAFfwx+qXtBUusmmlZyHBk5XXy+86FnH7dzP/zXqJKJISaCjtUKsesg80XqkBcT4VDZD53NFfkOeHRVyoVjt9/ExVS+OsHkuj7sC02r0Fl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7u7eFgUcwHF8iZzec8YbaqjPGVytLP6H5kdz+8uq5LJUv0nJpKq9uF8+KXtv80ldDsalqCFwZqKnAFdmngLXDpCBptqF8mcui9Hb7ZRLsvoagE9V0vNjHgcevMTLck9IMhStZpAkR3vvWwPm8qgMnh79Voj/PtJU4obuFKHv6Ga6BoZc+WQ98y8QjejQTlHZInp6NM9Zy1DFx2GvBpMi58QbaU9lac00hGOGHb3UacDmhd7jsBYdTZ64lhtE5Y3J+QHBf8eXLiewFOK1otXeC1YpMiqfBZ+Ebib1bFjza/bybpE0PaMLPTHkKitDzM7py0diW5xJU6uPqo6sFB08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGLT+CTPi9nVsaGk6By6eC6CzYWHyDyS0UPXgKX49HY=;
 b=dcLEaWe376H17e15eGGLx/paNCnri37DozboQ8zx/ezg0l7vIKLRfVF7nTnptfh578oWLyWmKSY+yy1YeWRCVCEEJAJRgc/Gi4wgTOhYgVgue61F+joSbTDwobnoi5w5k5iP4MoiN8SJ6qi7dT/QUHFHI2OLZgZLSN+pTrljnmouEYfg52JkZ3RerwdZ4JvUnSpBm4IbUvOiTMi00GrAtJzYfF6d80LPOnpCENWnNjgpVCDk84iKnInDMwpSrkBp62PuHFRBQ8Qv806xHqDWFC38UUBDdyIb7yTTkJOdbTANX0cYVqWSAs3XDqmA8iRLVC+nP+/bshPCywjBAzKxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGLT+CTPi9nVsaGk6By6eC6CzYWHyDyS0UPXgKX49HY=;
 b=ov54RxpNDBvAILM2GcMXIaPayRf/4FF5cwIhuR+K+fBGEPmFA4X/2kOHFn5BkcTTNAFfwx+qXtBUusmmlZyHBk5XXy+86FnH7dzP/zXqJKJISaCjtUKsesg80XqkBcT4VDZD53NFfkOeHRVyoVjt9/ExVS+OsHkuj7sC02r0Fl4=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 6/9] xen/arm: introduce CDF_staticmem
Thread-Topic: [PATCH v5 6/9] xen/arm: introduce CDF_staticmem
Thread-Index: AQHYdJxz5gwtTkiV8EuW1ruWinPeo604qxSAgAM6niA=
Date: Thu, 2 Jun 2022 10:07:00 +0000
Message-ID:
 <DU2PR08MB7325C5D659A735D1BC3A1214F7DE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-7-Penny.Zheng@arm.com>
 <cd7455ab-c26f-8a91-fbf0-acf988d8371f@suse.com>
In-Reply-To: <cd7455ab-c26f-8a91-fbf0-acf988d8371f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 444F69286ACCE746AB631C1C1B26DBD7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1d0da567-5b4f-4aa9-ea08-08da447fa84e
x-ms-traffictypediagnostic:
	AM6PR08MB3110:EE_|DBAEUR03FT020:EE_|VI1PR08MB5296:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB52968853C31AA3FD6A63B4B1F7DE9@VI1PR08MB5296.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f+PzCb9VWUpBeYurg29pGFCJELTuu6DNKSOLKM7DN3UMVL02MkpDZhX147PyYu/MISwbrLLi0zu5MYdX0iwUf8yGogBkDVbZ51DrayKzDv5niKrueitZOA8I7b6AdUSilW0sA9awrc9pVftFDJ5ZUZChwmfyh28PgBpUBEMN9xAmisJLACCes5r6ONGPar14mA91nnpOr1X3tFDUCQXkhiWvOppZ3ugXBTJPZcIvYd5md3kJQdLXcq7yrU8wcjkGTbyT5dYgc3i7cf7wkHIhWnpEyXkbeSlD+9lg43FRIarYbpTTDIzUcDCQPhw4FpVpRqNcbhoWEsQDthB6udYTQqzYjctq0Zi3GjbJVnj/WDkgTuItG1va/6qt3L6xeCdyl8G9AleFmaBU5OgmVbS6dam5XRJpYWov4lYwCVV9EYuq3frhpNDSz5KXuRNCjSSf8CwX80T/OgiZEBnSYfQH7jWbLciICg4odWCARWrsKsaRLSsMU1Xv2IeGZcq73U7AS5c2PvDoOJAC80lHq7Y6UUJOyXbYkI4zeln8J5vzjbgxZk4BOou+1bgpIU+hQYpwCG3PgzMhbEFxGeM8tpze2dmiSNxVOGDAzjqtUoqOLriCBi4VdugMMVeMSqvE3hstQhkY1/iDXQKcHa17cIotuuzBcsNA5ahWPdkPZdKq/TswhnqXK5ge8JDcSeiknsn2YScgsHaII42HOTyu4Mtp8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(53546011)(26005)(8676002)(52536014)(4326008)(54906003)(8936002)(86362001)(9686003)(6916009)(2906002)(33656002)(38100700002)(83380400001)(7696005)(186003)(66946007)(122000001)(508600001)(76116006)(66446008)(66476007)(316002)(64756008)(66556008)(38070700005)(6506007)(55016003)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3110
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc843a2a-c7c9-4007-ab25-08da447fa26f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uSHW+a0u/2Lp7ezO+KgOdxVPkIkApPmKqwvDt7CEQilB1bdxMRswKvy7k4vq4xqM9Xru874iqR/hAzjT6UIAAUcpXyu9Nspyc6NTk+Jo/XIEaEpWPIayq0C00xkM3E2F6KeFSrv61640ODSmVKUkkHDfpsn0/6mEXHtbTFaLIGQ9j5ls64+PXfQUViuZ08w57oP7/ZNfU1E9cnZYgLxQlxd+D0+43uVHwlHVZWHMKI2lfhUIKDkDKs3YL9DoFt35xvTHa5QVY6VtT2WwJWwKaCBJXlZtbqoJNSM9Be8HS+35Yxm4BIcJ3eOlHYx3Xh1Dj1H/pmMkR8Y3YwXs+ANWikrXp4BJ4nK8JFOu+QMpLA7mVZU38mlahkoCoIWR7xFFbkDOVLaE8piC7HOpq7UQiadr6rnZMDPkkzlBZHFndGuB/8mURtql8gaKmkSqdJfwqMcxBoyQjk1jhqm1sPFCvgN1ib9laZzdEM8Wb/kCAaL2VnR7Fb+dPMiB+JVAStMSBTvln63iMog2g3pDANg060f3bQ/gYwOL8Layo0oruOzl3RUXLCWAAhL0TAGScITqNEFEmKMJzSMJ0jCrITjk+Q6NORYKob5KGevWO1JvLAxHqf/6oHWgUfAtVOt47LCJJrOa7SRrXFdI0oEk0JEzJKVDsYsAvCI+tQlZqBGe+FpJxeVSgKuOIZ0BpMQ2l6x8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2906002)(81166007)(6862004)(316002)(36860700001)(8676002)(4326008)(70586007)(83380400001)(33656002)(70206006)(5660300002)(6506007)(356005)(186003)(26005)(9686003)(55016003)(7696005)(53546011)(86362001)(508600001)(8936002)(336012)(82310400005)(40460700003)(52536014)(54906003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 10:07:10.1625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0da567-5b4f-4aa9-ea08-08da447fa84e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5296

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMzEsIDIwMjIgNDo0
MSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBN
YXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0K
PiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPjsNCj4gV2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDYvOV0geGVuL2FybTogaW50cm9kdWNlIENE
Rl9zdGF0aWNtZW0NCj4gDQo+IE9uIDMxLjA1LjIwMjIgMDU6MTIsIFBlbm55IFpoZW5nIHdyb3Rl
Og0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0KPiA+ICsrKyBi
L3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0KPiA+IEBAIC0zMSw2ICszMSwxMCBA
QCBlbnVtIGRvbWFpbl90eXBlIHsNCj4gPg0KPiA+ICAjZGVmaW5lIGlzX2RvbWFpbl9kaXJlY3Rf
bWFwcGVkKGQpICgoZCktPmNkZiAmIENERl9kaXJlY3RtYXApDQo+ID4NCj4gPiArI2lmZGVmIENP
TkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gKyNkZWZpbmUgaXNfZG9tYWluX3VzaW5nX3N0YXRpY21l
bShkKSAoKGQpLT5jZGYgJiBDREZfc3RhdGljbWVtKQ0KPiA+ICsjZW5kaWYNCj4gDQo+IFdoeSBp
cyB0aGlzIGluIHRoZSBBcm0gaGVhZGVyLCByYXRoZXIgdGhhbiAuLi4NCj4gDQo+ID4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFp
bi5oDQo+ID4gQEAgLTM0LDYgKzM0LDEyIEBAIHZvaWQgYXJjaF9nZXRfZG9tYWluX2luZm8oY29u
c3Qgc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAjaWZkZWYgQ09ORklHX0FSTQ0KPiA+ICAvKiBTaG91
bGQgZG9tYWluIG1lbW9yeSBiZSBkaXJlY3RseSBtYXBwZWQ/ICovDQo+ID4gICNkZWZpbmUgQ0RG
X2RpcmVjdG1hcCAgICAgICAgICAgICgxVSA8PCAxKQ0KPiA+ICsvKiBJcyBkb21haW4gbWVtb3J5
IG9uIHN0YXRpYyBhbGxvY2F0aW9uPyAqLw0KPiA+ICsjZGVmaW5lIENERl9zdGF0aWNtZW0gICAg
ICAgICAgICAoMVUgPDwgMikNCj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICsjaWZuZGVmIGlzX2Rv
bWFpbl91c2luZ19zdGF0aWNtZW0NCj4gPiArI2RlZmluZSBpc19kb21haW5fdXNpbmdfc3RhdGlj
bWVtKGQpICgodm9pZCkoZCksIGZhbHNlKQ0KPiA+ICAjZW5kaWYNCj4gDQo+IC4uLiBoZXJlICh3
aXRoIHdoYXQgeW91IGhhdmUgaGVyZSBub3cgc2ltcGx5IGJlY29taW5nIHRoZSAjZWxzZSBwYXJ0
KT8NCj4gT25jZSBsaXZpbmcgaGVyZSwgSSBleHBlY3QgaXQgYWxzbyBjYW4gYmUgYW4gaW5saW5l
IGZ1bmN0aW9uIHJhdGhlciB0aGFuIGEgbWFjcm8sDQo+IHdpdGggdGhlICNpZmRlZiBtZXJlbHkg
aW5zaWRlIGl0cyBib2R5Lg0KPiANCg0KSW4gb3JkZXIgdG8gYXZvaWQgYnJpbmcgdGhlIGNoaWNr
ZW4gYW5kIGVnZyBwcm9ibGVtIGluIHhlbi9pbmNsdWRlL3hlbi9kb21haW4uaCwNCkkgbWF5IG5l
ZWQgdG8gbW92ZSB0aGUgc3RhdGljIGlubGluZSBmdW5jdGlvbiB0byB4ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaCh3aGljaA0KaGFzIGFscmVhZHkgaW5jbHVkZWQgZG9tYWluLmggaGVhZGVyKS4NCg0K
PiBKYW4NCg0K

