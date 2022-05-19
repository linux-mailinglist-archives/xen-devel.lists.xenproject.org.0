Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7706C52C9DB
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 04:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332581.556299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrW2h-0005lD-2r; Thu, 19 May 2022 02:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332581.556299; Thu, 19 May 2022 02:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrW2g-0005iu-VY; Thu, 19 May 2022 02:37:34 +0000
Received: by outflank-mailman (input) for mailman id 332581;
 Thu, 19 May 2022 02:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+51y=V3=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nrW2e-0005A9-Vd
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 02:37:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe02::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a217b76b-d71c-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 04:37:32 +0200 (CEST)
Received: from AM6P191CA0105.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::46)
 by AM0PR08MB3859.eurprd08.prod.outlook.com (2603:10a6:208:107::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 02:37:29 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::de) by AM6P191CA0105.outlook.office365.com
 (2603:10a6:209:8a::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Thu, 19 May 2022 02:37:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 02:37:28 +0000
Received: ("Tessian outbound 32b886dfa5b9:v119");
 Thu, 19 May 2022 02:37:27 +0000
Received: from edf150d6f917.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D3FBA21-F1EE-424A-9850-45B8F9306F4B.1; 
 Thu, 19 May 2022 02:37:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id edf150d6f917.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 May 2022 02:37:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6796.eurprd08.prod.outlook.com (2603:10a6:10:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Thu, 19 May
 2022 02:37:19 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 02:37:19 +0000
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
X-Inumbo-ID: a217b76b-d71c-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aU1ZZnqgrNYkUx9VdxenAgpy84r4p+ScpIsiSUE6TbyJTCovzfqBwVI5rVuDuy4SBrvZzJQmULt/657Qw3YszYYnX0DKZqhAwRxMTUq3eP35TZipYI8NlcQrKpiL7X1HB32qTI66clH16a7cL+EpbO/E9upWCZe6aYdhi80YoO5/v0GJqxd7yRtpuLt0Paa7vBAyL64bVn08AenXHDxesC1cHg5ebfS5SeGuTb2R9Zm9XOCG356uB/AGuaxCG/OUeOQiCG7e8xfQUWpX9ed9/2JJyOdaZ5NPRxO0+tW+a6+sOPIpfQlgJ1SlOlpi1tpaFohE80MAsXBXO5USj6/+QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0VtX9O6STDiYkp7saiUV02SApI8T6q3B2TRx1qsQx8=;
 b=TyGuRnf8NOaE9t2IL1b9OdlWGnS68q/rrvCoiwWzZyWc5tEVxLMzWkN7XxKsDaB5J48xwIrOOkQ+hNthDBTYZlV50q5KPf/u0RSVQvX9plFLk8I+ZoJNU6xW6mKBOregMgJQ0RLLY1bZIXdVhD+JI/r0zYRErM9EBgBddYFCLAmkhr0QmFxTok3Wp4HfvxX5wz8CW6kw5TQDyqAHWol/itaYDReAjvi6oO/q2nX3TGBn0bEvGQh8xlhy3cLlA1vPlgSqEA0f7OhEkEj5zigK7mg/2D/9Vpa9gatELa3HU88MgR7KHoXuYnp/jW5QQLLJfdUL2SN5GYGR6ZTVl92dUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0VtX9O6STDiYkp7saiUV02SApI8T6q3B2TRx1qsQx8=;
 b=S/7ofVYQYB4fnpBijM7zncHCYZJwm+BaQhr6bvXNRqfGA640ZTJ4eQfF0W7JDRf36dtSVU+GB5uFHQkNLixhbzKCOCXL00JFMQ46mFt9CKrRmBujHt1JHdWnX1jgwoxpxbTtC6hkf3xyxMxNmqCnvmzBmN7x6/00JB3/8EViiQQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGf/my5sl8WwIsx2mk3hpmq8q5moudNVLV31EmcbJnE7C2bIw1Iiu7rega4yKj4YzUXzkZbGjSXouhbaxWUmGtJjfXF1NxCHiimrzxVVPhXGNRqTl/6fmjfjMJdlWTWFgyUOYBfEzmVA9mn30PU/IDLG+f6W4vrRRu+rgJbYbWpLJhwx0qjOjjCJPPz/0eT9CnbA6LHvOOaBjsLSkahEi9VNZRt7yJP9mXA0C1IS57n9ehlHXr2mPEZPIIqBSvHk6heZzM4RZknAq8+dCp3GKVqTswVUdcnPtFZDb1QRzq6cKLbGhfkWu+Og6DH2xaGhkTaYFqmuwQji13VAv7HNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0VtX9O6STDiYkp7saiUV02SApI8T6q3B2TRx1qsQx8=;
 b=JaTiMfEMW70WKuA7Kn4eG3IzwN25NgDZ15vbnnTj/DkQMSlQQtI+JkwWcDJmcGgAY+G/J9Z9/mA6RKXsTDXV9CRemdtZmiv11/GvV+LcMFjzlYNwXy9pu6d1dJlPPy8fjubbI4e3e6+j6g2jqyN+uQyyCnCxiYrzSRGgpZO6VwmZohPZbjB1qm9NzHqkCE+FUL5vwJboKzj8sBoCrwkIyWyFpRzDzFj04TraOT64XbGY2B2AFN5FOEP/e2XwxuEy8Yaj3HBekizRkXq3IXngmcjmBCb2YRtrfTj6qg+NmzAcb3IqYgzyaydxj/PseGgypsq5Aa3+YdaVXk7HdjUhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0VtX9O6STDiYkp7saiUV02SApI8T6q3B2TRx1qsQx8=;
 b=S/7ofVYQYB4fnpBijM7zncHCYZJwm+BaQhr6bvXNRqfGA640ZTJ4eQfF0W7JDRf36dtSVU+GB5uFHQkNLixhbzKCOCXL00JFMQ46mFt9CKrRmBujHt1JHdWnX1jgwoxpxbTtC6hkf3xyxMxNmqCnvmzBmN7x6/00JB3/8EViiQQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 9/9] xen/x86: use INFO level for node's without memory
 log message
Thread-Topic: [PATCH v3 9/9] xen/x86: use INFO level for node's without memory
 log message
Thread-Index: AQHYZNkPIMguWCkDT0iF46SXZxuwPq0krieAgADat1A=
Date: Thu, 19 May 2022 02:37:19 +0000
Message-ID:
 <PAXPR08MB742098770F1BB7009E3C0DAF9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-10-wei.chen@arm.com>
 <da3fcc3a-4e90-2179-1f57-77eb60a7a65f@suse.com>
In-Reply-To: <da3fcc3a-4e90-2179-1f57-77eb60a7a65f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A5FFDF57C93F1945AEF1E59B9EBDD5B8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7ea7460d-db16-4c72-ffae-08da3940841a
x-ms-traffictypediagnostic:
	DB9PR08MB6796:EE_|VE1EUR03FT049:EE_|AM0PR08MB3859:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3859A15547AB3CA5F4E622559ED09@AM0PR08MB3859.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rjLmK8gxpM1ooKC1TT9I3tpqt/rMI+kHH+CHXSrsVMBz0BkyWW6d/Ogwoc59BjNftEDDLeVL8nPCHsxISJmcuTmRTrw3kf0eblNbvvYwh9MfEic/WAB8Ntcqb71Hig3Q+OMvMWueQU1Bc0TmTPnniiJn1PjbLH6ow4/wq4dsRU2REw4fT8dNDSyjvVddAelhEYQutqxWp+1RASuOVRdrtWrf6vNGV59D41l6a0e9aLTnaWLskJI1hd7SiUEFRBWr9GuTxMyo/OufH5QxFHzXq2KBKySgJxlXN5+uEB7kwHv7CJolc5kv0gmxESjigCmjhvUz2iz8/XfUejwkqZ5dhscKUOUSNggM0Kq8P+qckY06UjV5HeKE6CHXmcEj8yXrVF3PIpWReB0LII7KuTcRU56VO2c0OAI/URj03t/N2uTr/0aSJyARxqOG6RSEfXVzBM7ZxjjiigYCOwdWRsFlVN1oHwWvgLkBt1oM0APmxiDmKoo2rP92k5y6JIQfY2t/SmI4aL5tnIwfgj/WdFTSMjUgMYgGUZcW+HHG5v1RcfVw093KGJd5CZGi38wv1ildFqA+vClQydnxFJtL/aG4AGMDlhIxMNujG3coTRHuieiit2sdRqhOGLoaTzTm9R47HNoo2Bb2dRiPZJEcCpRPn39P+u+RODDVMGULEqG+XXDHOIUf12RetRCbkhDI5TpSJ3bSREzi6ay2EbBBEdI9xg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(38070700005)(4326008)(8676002)(38100700002)(66446008)(66946007)(122000001)(66556008)(76116006)(66476007)(316002)(33656002)(71200400001)(55016003)(508600001)(83380400001)(54906003)(6916009)(86362001)(2906002)(8936002)(52536014)(15650500001)(5660300002)(9686003)(26005)(6506007)(53546011)(186003)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6796
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf60dee4-c20d-47ba-af91-08da39407ed8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mc70q+vC8LDgVAoGUl8/+JEh6kYRDDNekZQMt4u5AGaORN0il8tjKbdcr/WGJMRdqKKVrJVnzYP6dDN/SK3lDNyHkmuBvoq+2ITRnLP9lL/+hU7q9sJjiGm3YPmTeGN+q9S8t/wA5aJEJMUhIdYdpvN3MR5JYEnyh+LaHqDt+HpBpM1K2cm1MvcIs7LXpvvyCtxHqz32g7Nf9HZQkfcWm4YDnFpVKIxCBb8Y/RIm7x9TJS58jqkE7NeijO11dHQroU7+3sBiZ35YifWBYUZEmIEAxnDrspk5olIkEwG0Abp6+C597m2Zv8eoyJbpBkaltq5+UHSdBkMHn/ZuraQXX69x5sirqsznxwib+6+JKk0IFQ6X2ijfTOGbfDJviqlu+BYbHe9yIFvGbTR0BlCfUoiBXLUiJhpf4JYyLOSFUrvn62p9jTjavp0l6ouzz7BvaCyxAny+SYynrRiacj4a8tOXA2mQMKWBrvD8UIDPxtDaZTxl7RMr4OIPW27ie+KXtWEU5pNpJxVb13Cg9hTfIoBZG7igktGZ3pZQ4OfBDoBU2AbY5U/0n6X/lRq4ZGXgHwswEbzD+WUIsl1AYL4AFpgVoc4wz8IMyJnzKCxNg2OhxdUEArtt2Bywr+nSBQue+K6XST5EYc4PI8sS3gvhRUPRxqlOGfESIvq6Lti8I40rJRzY1E7qIge/F+dfeOak
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(47076005)(82310400005)(508600001)(36860700001)(55016003)(186003)(5660300002)(2906002)(40460700003)(15650500001)(83380400001)(33656002)(316002)(8676002)(6862004)(52536014)(8936002)(70586007)(54906003)(70206006)(86362001)(6506007)(81166007)(26005)(7696005)(4326008)(356005)(53546011)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 02:37:28.2304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea7460d-db16-4c72-ffae-08da3940841a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3859

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDXmnIgxOOaXpSAyMTozNA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
OS85XSB4ZW4veDg2OiB1c2UgSU5GTyBsZXZlbCBmb3Igbm9kZSdzIHdpdGhvdXQNCj4gbWVtb3J5
IGxvZyBtZXNzYWdlDQo+IA0KPiBPbiAxMS4wNS4yMDIyIDAzOjQ2LCBXZWkgQ2hlbiB3cm90ZToN
Cj4gPiBJbiBwcmV2aW91cyBjb2RlLCBYZW4gd2FzIHVzaW5nIEtFUk5fV0FSTklORyBmb3IgbG9n
IG1lc3NhZ2UNCj4gPiB3aGVuIFhlbiBmb3VuZCBhIG5vZGUgd2l0aG91dCBtZW1vcnkuIFhlbiB3
aWxsIHByaW50IHRoaXMNCj4gPiB3YXJuaW5nIG1lc3NhZ2UsIGFuZCBzYWlkIHRoYXQgdGhpcyBt
YXkgYmUgYW4gQklPUyBCdWcgb3INCj4gPiBtaXMtY29uZmlndXJlZCBoYXJkd2FyZS4gQnV0IGFj
dHVhbGx5LCB0aGlzIHdhcm5pbmcgaXMgYm9ndXMsDQo+ID4gYmVjYXVzZSBpbiBhbiBOVU1BIHNl
dHRpbmcsIG5vZGVzIGNhbiBvbmx5IGhhdmUgcHJvY2Vzc29ycywNCj4gPiBhbmQgd2l0aCAwIGJ5
dGVzIG1lbW9yeS4gU28gaXQgaXMgdW5yZWFzb25hYmxlIHRvIHdhcm4gYWJvdXQNCj4gPiBCSU9T
IG9yIGhhcmR3YXJlIGNvcnJ1cHRpb24gYmFzZWQgb24gdGhlIGRldGVjdGlvbiBvZiBub2RlDQo+
ID4gd2l0aCAwIGJ5dGVzIG1lbW9yeS4NCj4gPg0KPiA+IFNvIGluIHRoaXMgcGF0Y2gsIHdlIHJl
bW92ZSB0aGUgd2FybmluZyBtZXNzYWdlcywgYnV0IGp1c3QNCj4gPiBrZWVwIGFuIGluZm8gbWVz
c2FnZSB0byBpbmZvIHVzZXJzIHRoYXQgdGhlcmUgaXMgb25lIG9yIG1vcmUNCj4gPiBub2RlcyB3
aXRoIDAgYnl0ZXMgbWVtb3J5IGluIHRoZSBzeXN0ZW0uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IHByZWZlcmFibHkgd2l0aCAuLi4NCj4gDQo+ID4g
LS0tIGEveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zcmF0LmMN
Cj4gPiBAQCAtNTQ5LDggKzU0OSw3IEBAIGludCBfX2luaXQgYWNwaV9zY2FuX25vZGVzKHBhZGRy
X3Qgc3RhcnQsIHBhZGRyX3QNCj4gZW5kKQ0KPiA+ICAJCXVpbnQ2NF90IHNpemUgPSBub2Rlc1tp
XS5lbmQgLSBub2Rlc1tpXS5zdGFydDsNCj4gPg0KPiA+ICAJCWlmICggc2l6ZSA9PSAwICkNCj4g
PiAtCQkJcHJpbnRrKEtFUk5fV0FSTklORyAiU1JBVDogTm9kZSAldSBoYXMgbm8gbWVtb3J5LiAi
DQo+ID4gLQkJCSAgICAgICAiQklPUyBCdWcgb3IgbWlzLWNvbmZpZ3VyZWQgaGFyZHdhcmU/XG4i
LCBpKTsNCj4gPiArCQkJcHJpbnRrKEtFUk5fSU5GTyAiU1JBVDogTm9kZSAldSBoYXMgbm8gbWVt
b3J5LlxuIiwgaSk7DQo+IA0KPiAuLi4gdGhlIGZ1bGwgc3RvcCBhbHNvIGRyb3BwZWQgKGFuZCBt
YXliZSB0aGUgdXBwZXItY2FzZSBOIGNvbnZlcnRlZCB0bw0KPiBsb3dlci1jYXNlKS4NCj4gDQoN
Ck9rLCBJIHdpbGwgZG8gaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IEphbg0KDQo=

