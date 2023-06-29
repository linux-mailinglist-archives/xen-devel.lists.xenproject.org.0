Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2E742914
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556899.869764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtCs-000676-1O; Thu, 29 Jun 2023 15:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556899.869764; Thu, 29 Jun 2023 15:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtCr-00064s-UH; Thu, 29 Jun 2023 15:05:13 +0000
Received: by outflank-mailman (input) for mailman id 556899;
 Thu, 29 Jun 2023 15:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOj0=CR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qEtCp-00064k-Og
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:05:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b937ab-168e-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:05:09 +0200 (CEST)
Received: from DB3PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:8:1::20) by
 DB9PR08MB8484.eurprd08.prod.outlook.com (2603:10a6:10:3d4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.19; Thu, 29 Jun 2023 15:05:06 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::7f) by DB3PR06CA0007.outlook.office365.com
 (2603:10a6:8:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 15:05:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.20 via Frontend Transport; Thu, 29 Jun 2023 15:05:06 +0000
Received: ("Tessian outbound 7c913606c6e6:v142");
 Thu, 29 Jun 2023 15:05:06 +0000
Received: from 823da915644f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 668D3553-CC17-4175-BCBA-EB0E9CEA787B.1; 
 Thu, 29 Jun 2023 15:04:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 823da915644f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 15:04:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 15:04:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 15:04:51 +0000
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
X-Inumbo-ID: 56b937ab-168e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyCym8qebWLBE0VHeGSJrzaW4U7Q52zCDB4su6wR5DQ=;
 b=ti4mvXVj7Qjwb/gNKN7LfiVFDqpfF/AGz7tGKNFJTdBgcGoSsAHZ9+b2c19jieO6+9pSrBMrE7ry6E9GbcjJ6mafYGkCNqRHsgJINSJGABHwU6Ncp6wTvo84Xaxu48phfXd8lHHrgo1A+dK6kG11Dp1k0GmT9JhrIsqqN/mmJ40=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb92cb0a438c3068
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKsBHdrFig7/X1FbggqoS1Olkli5k0MpI+dN+/MndMtb4WQ3hLZLohUMSOA2Pfub0jK4uaw4B1YAYC4HJHsvBEs8IcngBuTFqhgRE7veqyJpunoVem7EE3ri2qrr+AkdJsDpS7uuPxZ2+QhIvyO9wen7oou0p6xTcUjE/OK+mEq/fn5Arhd55/CQFhNrP3zWoanaa+v/bmCtrk1RrBJezd+q25nN5CAuQ2e93xPGcP6Q0c7idcIZh0DbuMSvGpzkQHRx3FHlnleZQdvcswvHlB2HNc4GdHyCjxh07JspR/5EIar3bNJw3mLwqUkabLlT1oX+CPd8V3Uy8mfKm///aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyCym8qebWLBE0VHeGSJrzaW4U7Q52zCDB4su6wR5DQ=;
 b=Nx9OnPCusulPz2R9AK+E9ZCTHTGwWN4pnNpsWj92VyGX2E4BzgmvRAcI+ANZWYnZUmS3y9SXmXV0tkYfR9wGWwEUEtGn8rKpdl5gBKqDdbzhTOH4eQh/QcAYfweN7LC90lUWzaQaiaaLnwapCMlwy10VzragJDVlLOx+1/0OMZQEJuGhHzCFvT1xyq+gR+Aa8khLJEVZXyx0HbiUAqm9Y4NpUVHW1QjUkLAPCC1dsEna9boS/0B4Y5uE9wrdk62a/7lTem/IFTzz0TGyDEMjYhVL295l0uC7lMe5/T9v8Koelu1KYdhSDYcxl4mn+akVxmPELFpWn5AR4d3mQcDcig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyCym8qebWLBE0VHeGSJrzaW4U7Q52zCDB4su6wR5DQ=;
 b=ti4mvXVj7Qjwb/gNKN7LfiVFDqpfF/AGz7tGKNFJTdBgcGoSsAHZ9+b2c19jieO6+9pSrBMrE7ry6E9GbcjJ6mafYGkCNqRHsgJINSJGABHwU6Ncp6wTvo84Xaxu48phfXd8lHHrgo1A+dK6kG11Dp1k0GmT9JhrIsqqN/mmJ40=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Thread-Topic: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Thread-Index: AQHZqnGGeSRo6D9TDkKPQE/VGyIB1K+h4SyA
Date: Thu, 29 Jun 2023 15:04:51 +0000
Message-ID: <771A1A80-0FC6-4D20-84FE-DA0A2DCFF14B@arm.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VE1PR08MB5696:EE_|DBAEUR03FT057:EE_|DB9PR08MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7d84a1-5470-4549-70a1-08db78b23951
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qcM0QEYv0rrODXiqaNPVtyk/6OBjfpnsDEBBksUmKEcf2/VWAIEjzt/mVfbbEGRZj8Pkb7sDO7M7BkBZmLBiTkPskbvzfv3zpiqqmZvHHW/Vm4vpSQ3TJTnUSwQRJG0oIzhGNq2Acob5EwV+LyMSbajaYXgYWhzyiLUlW52AS4hQXbH1AGbneaLrHxV8JAQnPxpi8BE9D72jRdaovj5rV7q9uQwqGF1DElL+8kgXN8EQKdy2vvuH69PyvMPvZeV7zLIwfOGTUDrs+u119GNI85cirpiXYDbxQKR460oAk6VN4nstFHo6CyiN5Lp5fWUnWL4WCGWs9ySzLrMvkEuXDbqClGnE/v876Pog3RAIbgcro0arsyO17JC9gIbxsWzhuF2JwAWoxVjRpEI4jElifvk4Sc2Nl7Enf1W9IWYRQIoMDF85TGUDNQnqNorcpEEALbxSLI43q8j3/+APlbug411RN2rQ6vShx+Ujp8KlV11cljYoku7oTUel2by1x8t7xJdx1/7AfbVfW1dHnaz1+CdI1zRTjTbwubv/oOYxaloASZC+T27hlGeAOe0jEWDdyV8ycfJXnL4/0LyAIzguj3RBgr60QnrLNFC0f2XjKPw7ym9T09Txi+lhsed/KjzxkHJO55sEWLMNTzmnmUkpOA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(316002)(8676002)(66946007)(64756008)(66476007)(76116006)(6512007)(6506007)(66446008)(186003)(4326008)(53546011)(26005)(6916009)(8936002)(6486002)(54906003)(71200400001)(41300700001)(66556008)(91956017)(5660300002)(7416002)(2906002)(2616005)(478600001)(38070700005)(38100700002)(122000001)(33656002)(86362001)(36756003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4498A3FE74C7EA4B9C0A71F69B3DBAAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5696
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31cc7cf3-85be-4a08-2274-08db78b23058
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EOYWdVc1pjtHCSEOCbCQRkNKQQv1X8rquckzinvy4vDAZz4ogib6PfeLJWYgiAc19zzLIFRIiRMUft+osUXncq7+rqThxnmPrkuWh/auSiFf5ey5hiT5tUvAxUhMJOb9AdML4rjHirO3RyK5J+fFZhG6MbubZ7UjhK5vIwdcvztW4Z8oJ7IWzYK4Tdsg38E8b4h+++GmHbyciil8sXpL1cL0oTcTSjwucOaNYFJcsubZTUkqz1DAKh1dszzeAkKa7TKpBaM0NofH90qvGWWRTPqlhyUCu1+6SGMRDB6A30qPHjXmaUgl9j06tPzZxKSYeHul6T+UHD+VzdLDUz4RajXyW1qMPtS0Nae9v+VarkjRj+qazgW5YfbzD3NwzHGvmH6FreZ1gIEiay7ouFwT3pZpeb2qYWyYDtU0L9F99LU2yuYR2gmlp7RNvSL/xsqNxD0uofez5LhLE6uQI4JfuvUp9H+sm2jodn1mHSxx1ieAUpUSOMwxZj52InBEoEW8CHr8+7VRvruZ51teir8bSrthh2a99SbjDBef+eqioLg90jzY5mxHuBv9Ju+h/DntRQEVY/Oh0tsST1ilGXkZvxIc9BTG7OtO48MyqG3TW1LSln91Kf/2yq068nUK+5j9dPN9lk+PyKU0YHqXzL61tEOMdS4QKj5EsDnW0wwBjunGX6pI4Qiew/Zqe62A5kR+ipifEQ2nvseoLvPOG757tmsmUU1Z0cLmIiN1cuXb4HfSgJFHF3v0ghP7ZXZ9XxNE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(478600001)(6486002)(53546011)(6506007)(6512007)(186003)(26005)(40460700003)(2616005)(54906003)(6862004)(86362001)(2906002)(81166007)(356005)(83380400001)(336012)(40480700001)(4326008)(82310400005)(70206006)(70586007)(36860700001)(8676002)(33656002)(5660300002)(8936002)(316002)(47076005)(41300700001)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 15:05:06.4051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7d84a1-5470-4549-70a1-08db78b23951
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8484

DQoNCj4gT24gMjkgSnVuIDIwMjMsIGF0IDExOjA2LCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZl
dHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPiANCj4gSW4gdGhlIGZpbGVzIG1vZGlmaWVkIGJ5
IHRoaXMgcGF0Y2ggdGhlcmUgYXJlIGEgZmV3IG9jY3VycmVuY2VzIG9mIG5lc3RlZCAnLy8nDQo+
IGNoYXJhY3RlciBzZXF1ZW5jZXMgaW5zaWRlIEMtc3R5bGUgY29tbWVudCBibG9ja3MsIHdoaWNo
IHZpb2xhdGUgUnVsZSAzLjEuDQo+IFRoZSBwYXRjaCBhaW1zIHRvIHJlc29sdmUgdGhvc2UgYnkg
cmVtb3ZpbmcgdGhlIG5lc3RlZCBjb21tZW50cy4NCj4gDQo+IEluIHRoZSBmaWxlICd4ZW4vY29t
bW9uL3htYWxsb2NfdGxzZi5jJyB0aGUgY29tbWVudCBoYXMgYmVlbiByZXBsYWNlcyBieQ0KDQpU
eXBvOiBzL3JlcGxhY2VzL3JlcGxhY2VkLw0KDQo+IGFuIEFTU0VSVCwgdG8gZW5zdXJlIHRoYXQg
dGhlIGludmFyaWFudCBpbiB0aGUgY29tbWVudCBpcyBlbmZvcmNlZC4NCj4gDQo+IEluIHRoZSBm
aWxlICd4ZW4vaW5jbHVkZS94ZW4vYXRvbWljLmgnIHRoZSBuZXN0ZWQgY29tbWVudCBoYXMgYmVl
biByZW1vdmVkLA0KPiBzaW5jZSB0aGUgY29kZSBzYW1wbGUgaXMgYWxyZWFkeSBleHBsYWluZWQg
YnkgdGhlIHByZWNlZGluZyBjb21tZW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhIFZl
dHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPg0KDQpTYW1lIGFzIHBhdGNoIDIsIG1p
c3Npbmcg4oCcLS0tIg0KDQo+IENoYW5nZXM6DQo+IC0gUmVzZW5kaW5nIHRoZSBwYXRjaCB3aXRo
IHRoZSByaWdodCBtYWludGFpbmVycyBpbiBDQy4NCj4gQ2hhbmdlcyBpbiBWMjoNCj4gLSBTcGxp
dCB0aGUgcGF0Y2ggaW50byBhIHNlcmllcyBhbmQgcmV3b3JrZWQgdGhlIGZpeDsNCj4gLSBBcHBs
eSB0aGUgZml4IHRvIHRoZSBhcm0zMiBgZmx1c2h0bGIuaCcgZmlsZSwgZm9yIGNvbnNpc3RlbmN5
Lg0KPiBDaGFuZ2VzIGluIFYzOg0KPiAtIFJlcGxhY2VkIGNvbW1tZW50ZWQtb3V0ICdpZicgd2l0
aCBhbiBBU1NFUlQoICpmbCA+PSAwICkuDQo+IC0tLQ0KPiB4ZW4vY29tbW9uL3htYWxsb2NfdGxz
Zi5jIHwgNCArLS0tDQo+IHhlbi9pbmNsdWRlL3hlbi9hdG9taWMuaCAgfCAyICstDQo+IDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxz
Zi5jDQo+IGluZGV4IDc1YmRmMThjNGUuLjk1YWZmY2M1NzEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9j
b21tb24veG1hbGxvY190bHNmLmMNCj4gKysrIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYw0K
PiBAQCAtMTQwLDkgKzE0MCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBNQVBQSU5HX1NFQVJDSCh1
bnNpZ25lZCBsb25nICpyLCBpbnQgKmZsLCBpbnQgKnNsKQ0KPiAgICAgICAgICpmbCA9IGZsc2wo
KnIpIC0gMTsNCj4gICAgICAgICAqc2wgPSAoKnIgPj4gKCpmbCAtIE1BWF9MT0cyX1NMSSkpIC0g
TUFYX1NMSTsNCj4gICAgICAgICAqZmwgLT0gRkxJX09GRlNFVDsNCj4gLSAgICAgICAgLyppZiAo
KCpmbCAtPSBGTElfT0ZGU0VUKSA8IDApIC8vIEZMIHdpbGwgYmUgYWx3YXlzID4wIQ0KPiAtICAg
ICAgICAgKmZsID0gKnNsID0gMDsNCj4gLSAgICAgICAgICovDQo+ICsgICAgICAgIEFTU0VSVCgg
KmZsID49IDAgKTsNCg0KSeKAmXZlIGNoZWNrZWQgdGhlIGNvZGViYXNlIGZvciB1c2FnZSBvZiBB
U1NFUlQsIGJ1dCBJ4oCZdmUgbm90IHNlZW4gdXNlIG9mIGl0IHdpdGggc3BhY2VzDQpiZWZvcmUg
YW5kIGFmdGVyIHRoZSBjb25kaXRpb24gKGxpa2Ugb3VyIGlmIGNvbmRpdGlvbnMpIHNvIEkgdGhp
bmsgdGhleSBjYW4gYmUgZHJvcHBlZC4NCg0KPiAgICAgICAgICpyICY9IH50Ow0KPiAgICAgfQ0K
PiB9DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vYXRvbWljLmggYi94ZW4vaW5jbHVk
ZS94ZW4vYXRvbWljLmgNCj4gaW5kZXggNTI5MjEzZWJiYi4uZmE3NTBhMThhZSAxMDA2NDQNCj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL2F0b21pYy5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9h
dG9taWMuaA0KPiBAQCAtNzgsNyArNzgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX2F0b21pY19z
ZXQoYXRvbWljX3QgKnYsIGludCBpKTsNCj4gICogICAgICBpbnQgb2xkID0gYXRvbWljX3JlYWQo
JnYpOw0KPiAgKiAgICAgIGludCBuZXcgPSBvbGQgKyAxOw0KPiAgKiAgICAgIGlmICggbGlrZWx5
KG9sZCA9PSBhdG9taWNfY21weGNoZygmdiwgb2xkLCBuZXcpKSApDQo+IC0gKiAgICAgICAgICBi
cmVhazsgLy8gc3VjY2VzcyENCj4gKyAqICAgICAgICAgIGJyZWFrOw0KPiAgKiAgfQ0KPiAgKi8N
Cj4gc3RhdGljIGlubGluZSBpbnQgYXRvbWljX2NtcHhjaGcoYXRvbWljX3QgKnYsIGludCBvbGQs
IGludCBuZXcpOw0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCg0KV2l0aCB0aGUgY29tbWVudHMg
YWRkcmVzc2VkOg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJt
LmNvbT4NCg0KDQoNCg==

