Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E32549365F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258764.446034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6Pl-0008Ul-GO; Wed, 19 Jan 2022 08:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258764.446034; Wed, 19 Jan 2022 08:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6Pl-0008Sg-Cb; Wed, 19 Jan 2022 08:33:57 +0000
Received: by outflank-mailman (input) for mailman id 258764;
 Wed, 19 Jan 2022 08:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CaTf=SD=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nA6Pj-0008Sa-9q
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:33:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 877bbbb7-7902-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 09:33:53 +0100 (CET)
Received: from DB6PR0301CA0081.eurprd03.prod.outlook.com (2603:10a6:6:30::28)
 by VE1PR08MB4766.eurprd08.prod.outlook.com (2603:10a6:802:a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 08:33:49 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::bd) by DB6PR0301CA0081.outlook.office365.com
 (2603:10a6:6:30::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Wed, 19 Jan 2022 08:33:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 08:33:48 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 19 Jan 2022 08:33:48 +0000
Received: from 041b8bf567ad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FB7D4F29-C8AC-474B-B9F1-5BEEB336FECA.1; 
 Wed, 19 Jan 2022 08:33:42 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 041b8bf567ad.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jan 2022 08:33:42 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBAPR08MB5622.eurprd08.prod.outlook.com (2603:10a6:10:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 08:33:41 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Wed, 19 Jan 2022
 08:33:41 +0000
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
X-Inumbo-ID: 877bbbb7-7902-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qwy9k64ifZJ0zdhC3c3QPVRCXjZcEOI7lHqezt0o54=;
 b=nQRMPSfJlK847/agRghxXBh+4VuHKSvbxtAidRHhRdIUkDmN9HjTfmBtKA3rtaWZkSMLNx5xDnNLH6zEKBL3/NNRonz0SJiUmKVKlD2T8yunqG+Ifn3JGwE9PvW1wEDvvCO0iEIWE4PLBL5mEf9Xy5Z96di8sOSpoT0X7HWNr7M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtKooMe9HqNjHCKD7Rsj37JMIf4Dq9vtRG5QRrB/rnIVjXEVx05mLuxE5Tyn6hJZzk1bt6e30UiCnn6bxD/s51jxVDUEOOSNRdXwmWzksjqq1FdKkyivfKjynqbShkg93NPuGIULrL8mnFiTKvdY5Uyg//GH0a95/gvI4lHPW374b/Um/btXFvflBmXrCy6sp22BMuNRryKPeNLNnpR7gWBYu6RK4xdzVl07bXU3pcPzqMGFEdBtxayrKYeKQv1vK/0WkqqKVqtnMpEcmKemMs1Zl0Lje3i4OypTj33zoiTNVlD4odqz15Ch8eQD+I2+6WWGorWMR4ULMBxqcAV+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qwy9k64ifZJ0zdhC3c3QPVRCXjZcEOI7lHqezt0o54=;
 b=gENRhZk9zuY3jq/ml8RX5fzSgSCgSiG/xghPTIOTFd7JFMPhhiERweiHGHpWLu7dWPswwyOGkFex+e5J+qP6zA9NHaqhnIxCE0ySdlTjpnTbdCd2hOlr8mSXD4KJ+uxhtv1rs+7LlJ7MBD6S6tuIbKlD4TF/qs8Osn6oiBUZcwws7YUSBRNSnjhaKlN0k9RB8k5qOycf7OGCW8mD0YArXgI7qsXJPjdHu5sU1y7I4wnflf78X+vkp+GaLzdZtCMxjlJY0mBMkpJNy48Ce9uaKcnIOChCWtM8rcjnor8sVQzIUaj1/KuhG1LpgyVDFCSYmzO6EvjWBxsnlzUoHZqriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qwy9k64ifZJ0zdhC3c3QPVRCXjZcEOI7lHqezt0o54=;
 b=nQRMPSfJlK847/agRghxXBh+4VuHKSvbxtAidRHhRdIUkDmN9HjTfmBtKA3rtaWZkSMLNx5xDnNLH6zEKBL3/NNRonz0SJiUmKVKlD2T8yunqG+Ifn3JGwE9PvW1wEDvvCO0iEIWE4PLBL5mEf9Xy5Z96di8sOSpoT0X7HWNr7M=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Topic: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Index:
 AQHXsHMGx8xGhif/FUCDSa9NS/fSLqxoGKiAgAD49HCAABTIAIAACXAAgABbKICAANEXUIAAVWcAgAAL52A=
Date: Wed, 19 Jan 2022 08:33:41 +0000
Message-ID:
 <PAXPR08MB74207E49B9C424CEDA7C1D4B9E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
 <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
 <PAXPR08MB7420CD3B7CFB4D2D81019F479E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <378fcc9b-abfe-28f2-ee67-f5510e99436c@suse.com>
 <PAXPR08MB7420FE209E822108AB1B41E19E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <fd328410-caf0-274e-08b0-f775a6c9a08c@suse.com>
 <PAXPR08MB742030298FE53A7B5AB5D1499E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <22c2134d-40b2-fd5f-aeec-edabf6151ce5@suse.com>
In-Reply-To: <22c2134d-40b2-fd5f-aeec-edabf6151ce5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5AD9856F3E4321488BEEC0C9042947DA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 915d0d9c-f39a-428a-2faa-08d9db266a48
x-ms-traffictypediagnostic:
	DBAPR08MB5622:EE_|DB5EUR03FT040:EE_|VE1PR08MB4766:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB476625FA96DD2CEBD6AA2ADF9E599@VE1PR08MB4766.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fN6vmnv5Zlt3WoMg26YIKYuVfHs/3AJJqDrQOl4YudAwwUsh3CXOu9bQo+ULTeywdMOOsbXcQDGzdNVeafa5UztTdrH53LSINk0K8RJesv985I/KZvLFQoHa5Xv00kI+ZqcAABVpjK+LallkMWnpSoPKz1NY5b5iQOAQMcsYfoniERNhNCbSpqdeECUFSPYRyhJT0P/qHg/2Yfsh9hyEnyjCkFHfZ2qmd5bRP3NJKN1Y6nR4BRfLDN6QjmqyQrOEKHXz5TFLfyaaxcsU2rE7w53yvWxcj2MGoR3nekMpxUQ4uRd7VR3SgcnoFHudfTGgwuDveNx5KSpSL2u6TFaNQSAgCNq9tOrB5wUowXBKSJ7fKrpnDX3ub+bjBXa0YxZDsPIAFgE7L2YbQA8GBT/7FZPNdKmTrFYER7zPtet4pNU2BKRaNcyPwnB94TRf2eKPNRRCPllNovI4vHVanSuqb/HWgp7wjZPGrmvmtxoJfe6ke0Zw+lzjvrPzNjJk1+xYfv2YvZ3pMWysQvf+2pGJNPd+iencVhCxzz6b6T4KBf5r80dtxfHm2NkG48yAR0ff2tPIU5gHnINFIC9FjgURFMXkrU13CZQNJJOBYpn7U/ktgS7cIouygWQ6TihiLhsBoVDDSFZONrpblqEviNRupVA/+1i8xcGsugNkKr2EEU/Yy3hNQ3ytwFlF0h9G8Xep5LKbZ77vuZvlE50Nlb8GtA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6506007)(83380400001)(66446008)(66556008)(122000001)(64756008)(186003)(52536014)(26005)(76116006)(53546011)(71200400001)(66946007)(54906003)(9686003)(6916009)(316002)(2906002)(5660300002)(7696005)(66476007)(508600001)(38100700002)(33656002)(8676002)(38070700005)(86362001)(4326008)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5622
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	49a84285-4469-4fa8-7bf5-08d9db2665d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3cpI0fh+g58HXd4ntWRPIxGU5RQtvsbyQ6ARrPQXqvbQAWukbIPC8pO4Wn+nelqrKbs4nu41NMXKKyKLdJdcCTe7tYByDAx6URZzK4DYXxFH3yyB5bwmqAfpijn0GULy0m3A4Tc0NmopBDicyC+0gR17x4XO03o6rcWwyLXKPQ4CAj8IHyWklhg8VXrdZQoON8xI28CfbQ9XhXgmkfP94Q4hJ0h4XWYIl8eBkFiA93kHO/41PUkl2iociex+BGldbOlu0dcnWEsNB6laSTstYhuKxPx7bY6tWS74SR5vQ8dgLeu1xLgTc8knHd8qe4o0wQKt0qqRBgaGzAppcySCVar+Ftt80qvt8ho0cruuCBpRxoLSVMcEF7ujatt5UXYhmh++OihpW3hEiAktqg5Kp+tTcCHQLoV2fXBCSJbnrrR6XJdOjg9iqZt8SAW/Qa7spkLDJ3vynPg9aUnYf4Uit7sZ+VKP32r8apK2jBw6jt2c12Co6PTH7T9wVSsuJjt/1fX0bLwzHZ+5zlQokPO7Aprdhp7pYDRYBUZnOKT3AjJbx3xRac+8X9hAg+2vuVUoq5c5nTg5ND6TK5T+qcUChtdUQXAY3LcpcjcPfnlcdvkAX/czxF3Z3lYF3pmL1KScpqwMWQkxrUTB13vrPS2n8Q+0ZVQoKv7tLOoBXqLZsCOId6KLhx+0IOx9AxPtXmq/hhi410hyd+Ijip417Es/PiZAOB1D4sxd33L8sUxNIqjYl8eL3tygJmbRj2kTgq1c03oJXY19b+80FzX1I4Qtvg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(6862004)(70206006)(26005)(53546011)(5660300002)(186003)(86362001)(336012)(508600001)(8936002)(81166007)(8676002)(6506007)(33656002)(47076005)(356005)(4326008)(52536014)(83380400001)(2906002)(9686003)(54906003)(40460700001)(82310400004)(55016003)(7696005)(70586007)(316002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:33:48.7835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915d0d9c-f39a-428a-2faa-08d9db266a48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4766

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOeaXpSAxNTo1MA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA0LzM3XSB4ZW46IGludHJvZHVjZSBhbiBhcmNoIGhlbHBlciBmb3IgZGVm
YXVsdCBkbWENCj4gem9uZSBzdGF0dXMNCj4gDQo+IE9uIDE5LjAxLjIwMjIgMDM6NDksIFdlaSBD
aGVuIHdyb3RlOg0KPiA+IEhpIEphbiwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNl
bnQ6IDIwMjLlubQx5pyIMTjml6UgMjI6MTYNCj4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBh
cm0uY29tPg0KPiA+PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPjsgeGVuLQ0KPiA+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlA
a2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNC8z
N10geGVuOiBpbnRyb2R1Y2UgYW4gYXJjaCBoZWxwZXIgZm9yIGRlZmF1bHQNCj4gZG1hDQo+ID4+
IHpvbmUgc3RhdHVzDQo+ID4+DQo+ID4+IE9uIDE4LjAxLjIwMjIgMTA6MjAsIFdlaSBDaGVuIHdy
b3RlOg0KPiA+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+
PiBTZW50OiAyMDIy5bm0MeaciDE45pelIDE2OjE2DQo+ID4+Pj4NCj4gPj4+PiBPbiAxOC4wMS4y
MDIyIDA4OjUxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+Pj4+IFNlbnQ6IDIwMjLlubQx5pyIMTjml6UgMDoxMQ0K
PiA+Pj4+Pj4gT24gMjMuMDkuMjAyMSAxNDowMiwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4+Pj4g
SW4gY3VycmVudCBjb2RlLCB3aGVuIFhlbiBpcyBydW5uaW5nIGluIGEgbXVsdGlwbGUgbm9kZXMg
TlVNQQ0KPiA+Pj4+Pj4+IHN5c3RlbSwgaXQgd2lsbCBzZXQgZG1hX2JpdHNpemUgaW4gZW5kX2Jv
b3RfYWxsb2NhdG9yIHRvIHJlc2VydmUNCj4gPj4+Pj4+PiBzb21lIGxvdyBhZGRyZXNzIG1lbW9y
eSBmb3IgRE1BLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gVGhlcmUgYXJlIHNvbWUgeDg2IGltcGxp
Y2F0aW9ucyBpbiBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBCZWN1YXNlDQo+ID4+Pj4+Pj4gb24g
eDg2LCBtZW1vcnkgc3RhcnRzIGZyb20gMC4gT24gYSBtdWx0aXBsZSBub2RlcyBOVU1BIHN5c3Rl
bSwgaWYNCj4gPj4+Pj4+PiBhIHNpbmdsZSBub2RlIGNvbnRhaW5zIHRoZSBtYWpvcml0eSBvciBh
bGwgb2YgdGhlIERNQSBtZW1vcnkuIHg4Ng0KPiA+Pj4+Pj4+IHByZWZlciB0byBnaXZlIG91dCBt
ZW1vcnkgZnJvbSBub24tbG9jYWwgYWxsb2NhdGlvbnMgcmF0aGVyIHRoYW4NCj4gPj4+Pj4+PiBl
eGhhdXN0aW5nIHRoZSBETUEgbWVtb3J5IHJhbmdlcy4gSGVuY2UgeDg2IHVzZSBkbWFfYml0c2l6
ZSB0byBzZXQNCj4gPj4+Pj4+PiBhc2lkZSBzb21lIGxhcmdlbHkgYXJiaXRyYXJ5IGFtb3VudCBt
ZW1vcnkgZm9yIERNQSBtZW1vcnkgcmFuZ2VzLg0KPiA+Pj4+Pj4+IFRoZSBhbGxvY2F0aW9ucyBm
cm9tIHRoZXNlIG1lbW9yeSByYW5nZXMgd291bGQgaGFwcGVuIG9ubHkgYWZ0ZXINCj4gPj4+Pj4+
PiBleGhhdXN0aW5nIGFsbCBvdGhlciBub2RlcycgbWVtb3J5Lg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+
Pj4gQnV0IHRoZSBpbXBsaWNhdGlvbnMgYXJlIG5vdCBzaGFyZWQgYWNyb3NzIGFsbCBhcmNoaXRl
Y3R1cmVzLiBGb3INCj4gPj4+Pj4+PiBleGFtcGxlLCBBcm0gZG9lc24ndCBoYXZlIHRoZXNlIGlt
cGxpY2F0aW9ucy4gU28gaW4gdGhpcyBwYXRjaCwgd2UNCj4gPj4+Pj4+PiBpbnRyb2R1Y2UgYW4g
YXJjaF9oYXZlX2RlZmF1bHRfZG1hem9uZSBoZWxwZXIgZm9yIGFyY2ggdG8NCj4gZGV0ZXJtaW5l
DQo+ID4+Pj4+Pj4gdGhhdCBpdCBuZWVkIHRvIHNldCBkbWFfYml0c2l6ZSBmb3IgcmVzZXJ2ZSBE
TUEgYWxsb2NhdGlvbnMgb3Igbm90Lg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEhvdyB3b3VsZCBBcm0g
Z3VhcmFudGVlIGF2YWlsYWJpbGl0eSBvZiBtZW1vcnkgYmVsb3cgYSBjZXJ0YWluDQo+ID4+Pj4+
PiBib3VuZGFyeSBmb3IgbGltaXRlZC1jYXBhYmlsaXR5IGRldmljZXM/IE9yIGlzIHRoZXJlIG5v
IG5lZWQNCj4gPj4+Pj4+IGJlY2F1c2UgdGhlcmUncyBhbiBhc3N1bXB0aW9uIHRoYXQgSS9PIGZv
ciBzdWNoIGRldmljZXMgd291bGQNCj4gPj4+Pj4+IGFsd2F5cyBwYXNzIHRocm91Z2ggYW4gSU9N
TVUsIGxpZnRpbmcgYWRkcmVzcyBzaXplIHJlc3RyaWN0aW9ucz8NCj4gPj4+Pj4+IChJIGd1ZXNz
IGluIGEgIVBWIGJ1aWxkIG9uIHg4NiB3ZSBjb3VsZCBhbHNvIGdldCByaWQgb2Ygc3VjaCBhDQo+
ID4+Pj4+PiByZXNlcnZhdGlvbi4pDQo+ID4+Pj4+DQo+ID4+Pj4+IE9uIEFybSwgd2Ugc3RpbGwg
Y2FuIGhhdmUgc29tZSBkZXZpY2VzIHdpdGggbGltaXRlZCBETUEgY2FwYWJpbGl0eS4NCj4gPj4+
Pj4gQW5kIHdlIGFsc28gZG9uJ3QgZm9yY2UgYWxsIHN1Y2ggZGV2aWNlcyB0byB1c2UgSU9NTVUu
IFRoaXMgZGV2aWNlcw0KPiA+Pj4+PiB3aWxsIGFmZmVjdCB0aGUgZG1hX2JpdHNpemUuIExpa2Ug
UlBpIHBsYXRmb3JtLCBpdCBzZXRzIGl0cw0KPiA+PiBkbWFfYml0c2l6ZQ0KPiA+Pj4+PiB0byAz
MC4gQnV0IGluIG11bHRpcGxlIE5VTUEgbm9kZXMgc3lzdGVtLCBBcm0gZG9lc24ndCBoYXZlIGEg
ZGVmYXVsdA0KPiA+Pj4+PiBETUEgem9uZS4gTXVsdGlwbGUgbm9kZXMgaXMgbm90IGEgY29uc3Ry
YWludCBvbiBkbWFfYml0c2l6ZS4gQW5kDQo+IHNvbWUNCj4gPj4+Pj4gcHJldmlvdXMgZGlzY3Vz
c2lvbnMgYXJlIHBsYWNlZCBoZXJlIFsxXS4NCj4gPj4+Pg0KPiA+Pj4+IEknbSBhZnJhaWQgdGhh
dCBkb2Vzbid0IGdpdmUgbWUgbW9yZSBjbHVlcy4gRm9yIGV4YW1wbGUsIGluIHRoZSBtYWlsDQo+
ID4+Pj4gYmVpbmcgcmVwbGllZCB0byB0aGVyZSBJIGZpbmQgIlRoYXQgbWVhbnMsIG9ubHkgZmly
c3QgNEdCIG1lbW9yeSBjYW4NCj4gPj4+PiBiZSB1c2VkIGZvciBETUEuIiBZZXQgdGhhdCdzIG5v
dCBhbiBpbXBsaWNhdGlvbiBmcm9tIHNldHRpbmcNCj4gPj4+PiBkbWFfYml0c2l6ZS4gRE1BIGlz
IGZpbmUgdG8gb2NjdXIgdG8gYW55IGFkZHJlc3MuIFRoZSBzcGVjaWFsIGFkZHJlc3MNCj4gPj4+
PiByYW5nZSBpcyBiZWluZyBoZWxkIGJhY2sgaW4gY2FzZSBpbiBwYXJ0aWN1bGFyIERvbTAgaXMg
aW4gbmVlZCBvZg0KPiBzdWNoDQo+ID4+Pj4gYSByYW5nZSB0byBwZXJmb3JtIEkvTyB0byBfc29t
ZV8gZGV2aWNlcy4NCj4gPj4+DQo+ID4+PiBJIGFtIHNvcnJ5IHRoYXQgbXkgbGFzdCByZXBseSBo
YXNuJ3QgZ2l2ZW4geW91IG1vcmUgY2x1ZXMuIE9uIEFybSwNCj4gb25seQ0KPiA+Pj4gRG9tMCBj
YW4gaGF2ZSBETUEgd2l0aG91dCBJT01NVS4gU28gd2hlbiB3ZSBhbGxvY2F0ZSBtZW1vcnkgZm9y
IERvbTAsDQo+ID4+PiB3ZSdyZSB0cnlpbmcgdG8gYWxsb2NhdGUgbWVtb3J5IHVuZGVyIDRHQiBv
ciBpbiB0aGUgcmFuZ2Ugb2YNCj4gZG1hX2JpdHNpemUNCj4gPj4+IGluZGljYXRlZC4gSSB0aGlu
ayB0aGVzZSBvcGVyYXRpb25zIG1lZXQgeW91ciBhYm92ZSBEb20wIHNwZWNpYWwNCj4gYWRkcmVz
cw0KPiA+Pj4gcmFuZ2UgZGVzY3JpcHRpb24uIEFzIHdlIGhhdmUgYWxyZWFkeSBhbGxvY2F0ZWQg
bWVtb3J5IGZvciBETUEsIHNvIEkNCj4gPj4+IHRoaW5rIHdlIGRvbid0IG5lZWQgYSBETUEgem9u
ZSBpbiBwYWdlIGFsbG9jYXRpb24uIEkgYW0gbm90IHN1cmUgaXMNCj4gdGhhdA0KPiA+Pj4gYW5z
d2VycyB5b3VyIGVhcmxpZXIgcXVlc3Rpb24/DQo+ID4+DQo+ID4+IEkgdmlldyBhbGwgb2YgdGhp
cyBhcyBmbGF3ZWQsIG9yIGFzIGEgd29ya2Fyb3VuZCBhdCBiZXN0LiBYZW4gc2hvdWxkbid0DQo+
ID4+IG1ha2UgYXNzdW1wdGlvbnMgb24gd2hhdCBEb20wIG1heSBuZWVkLiBJbnN0ZWFkIERvbTAg
c2hvdWxkIG1ha2UNCj4gPj4gYXJyYW5nZW1lbnRzIHN1Y2ggdGhhdCBpdCBjYW4gZG8gSS9PIHRv
L2Zyb20gYWxsIGRldmljZXMgb2YgaW50ZXJlc3QuDQo+ID4+IFRoaXMgbWF5IGludm9sdmUgYXJy
YW5naW5nIGZvciBhZGRyZXNzIHJlc3RyaWN0ZWQgYnVmZmVycy4gQW5kIGZvciB0aGlzDQo+ID4+
IHRvIGJlIHBvc3NpYmxlLCBYZW4gd291bGQgbmVlZCB0byBoYXZlIGF2YWlsYWJsZSBzb21lIHN1
aXRhYmxlIG1lbW9yeS4NCj4gPj4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgY29tcGxpY2F0ZWQgYnkg
dGhlIGZhY3QgdGhhdCBkZXNwaXRlIGJlaW5nIEhWTS0NCj4gbGlrZSwNCj4gPj4gZHVlIHRvIHRo
ZSBsYWNrIG9mIGFuIElPTU1VIGluIGZyb250IG9mIGNlcnRhaW4gZGV2aWNlcyBhZGRyZXNzDQo+
ID4+IHJlc3RyaWN0aW9ucyBvbiBEb20wIGFkZHJlc3Mgc3BhY2UgYWxvbmUgKGkuZS4gd2l0aG91
dCBhbnkgWGVuDQo+ID4+IGludm9sdmVtZW50KSB3b24ndCBoZWxwIC4uLg0KPiA+Pg0KPiA+DQo+
ID4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGlzIHBy
b2JhYmx5IHRoZSBiZXN0DQo+ID4ga2luZCBvZiB3b3JrYXJvdW5kLiBEbyB5b3UgaGF2ZSBzb21l
IHN1Z2dlc3Rpb25zIGZvciB0aGlzIHBhdGNoIHRvDQo+ID4gYWRkcmVzcyBhYm92ZSBjb21tZW50
cz8gT3Igc2hvdWxkIEkganVzdCBuZWVkIHRvIG1vZGlmeSB0aGUgY29tbWl0IGxvZw0KPiA+IHRv
IGNvbnRhaW4gc29tZSBvZiBvdXIgYWJvdmUgZGlzY3Vzc2lvbnM/DQo+IA0KPiBFeHRlbmRpbmcg
dGhlIGRlc2NyaXB0aW9uIGlzIG15IHByaW1hcnkgcmVxdWVzdCwgb3IgZWxzZSB3ZSBtYXkgZW5k
IHVwDQo+IGhhdmluZyB0aGUgc2FtZSBkaXNjdXNzaW9uIGV2ZXJ5IHRpbWUgeW91IHN1Ym1pdCBh
IG5ldyB2ZXJzaW9uLiBBcyB0bw0KPiBpbXByb3ZpbmcgdGhlIHNpdHVhdGlvbiBzdWNoIHRoYXQg
cHJlZmVyYWJseSBwZXItYXJjaCBjdXN0b21pemF0aW9uDQo+IHdvdWxkbid0IGJlIG5lY2Vzc2Fy
eSAtIHRoYXQncyBwZXJoYXBzIGJldHRlciB0byBiZSB0aG91Z2h0IGFib3V0IGJ5DQo+IEFybSBm
b2xrcy4gT3RvaCwgYXMgc2FpZCwgYW4geDg2IGJ1aWxkIHdpdGggQ09ORklHX1BWPW4gY291bGQg
cHJvYmFibHkNCj4gbGV2ZXJhZ2UgdGhlIG5ldyBob29rIHRvIGFjdHVhbGx5IG5vdCB0cmlnZ2Vy
IHJlc2VydmF0aW9uLg0KPiANCg0KT2ssIEkgd2lsbCB0cnkgdG8gZXh0ZW5kIHRoZSBkZXNjcmlw
dGlvbiB0byBhdm9pZCB0aGUgc2FtZSBkaXNjdXNzaW9uDQppbiBuZXh0IHZlcnNpb24uDQoNCj4g
SmFuDQoNCg==

