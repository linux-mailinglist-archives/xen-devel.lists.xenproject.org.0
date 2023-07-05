Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F5747FE7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 10:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558845.873287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGy4Q-0005FK-0U; Wed, 05 Jul 2023 08:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558845.873287; Wed, 05 Jul 2023 08:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGy4P-0005Cn-Td; Wed, 05 Jul 2023 08:41:05 +0000
Received: by outflank-mailman (input) for mailman id 558845;
 Wed, 05 Jul 2023 08:41:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVcp=CX=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qGy4N-0005Ch-RV
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 08:41:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe02::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abc28965-1b0f-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 10:41:02 +0200 (CEST)
Received: from AM0PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:208:fa::24)
 by DB8PR08MB5468.eurprd08.prod.outlook.com (2603:10a6:10:11a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 08:40:58 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:fa:cafe::3a) by AM0PR06CA0083.outlook.office365.com
 (2603:10a6:208:fa::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 08:40:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 08:40:57 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Wed, 05 Jul 2023 08:40:57 +0000
Received: from f464aa013064.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0088142-3B17-4CC5-8821-AEB2AEC215C5.1; 
 Wed, 05 Jul 2023 08:40:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f464aa013064.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 08:40:50 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by DB9PR08MB9826.eurprd08.prod.outlook.com (2603:10a6:10:45d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 08:40:49 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 08:40:49 +0000
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
X-Inumbo-ID: abc28965-1b0f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47wYujmxUbwb3Q4zhgp3DtFcdHgmy7H65HQAdh2HAng=;
 b=Q2qSvwvPZ6Qq9RBkFo02EqRm6Hfa1Qumc5K/pGsa8F3gPKplyb6p8KzxOCG6piX4kZqtT0UTXHxNf+1hqdqkKNIvxlnFemVEaMpg3Bl/Hs1yh1WLddTjM7ZfjO6cEDBvGWR/fAmqp6yqG6Tmoxwf3+qxR/ngsloSUE+F8217MOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 439904bc458a6403
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPMIYLAGmrb5/4Y5REZjnSJTbGhJjLeDPavSkGvaCKDDrhZaiFB32EC/4C5C83msv/wH0yegggQ5nphXFYBUrYRY7bbLGhI9pHZkMwjwYdyc2OOzXxdDrnObe8q1SFM8YMxTvfH+/aeDXSKvnP/7UpNZP7sMgOZRDedvGQR4lDCBYPt5H1rvVBAf9dqa3qv1QUSrsUcNfACDQj5OYM6PHCQ4Dspkia8CKdNzktEolUCj4e7NpO00t9LTYltsZ9q5R9fnSkmh/fInBVGTRuHa6XZK3EvwIMzra8VHNiSj+o8qQIQb7bgWP9wnofWMRpuvZdkW5IEYVLfCFd1LH8cWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47wYujmxUbwb3Q4zhgp3DtFcdHgmy7H65HQAdh2HAng=;
 b=TbAbx5A67tr82HvZzQdrw37Pt767EBi25afUXJAwqWSjD2sFhZVADgHcP55jnW4v3/58YFFq/ymHA1OIf9BHPYzhJ6k7z8AJ0rgGS572jTtePiP1MdLEFUoqUPfe5gvpyAGGS+X/54z2ZnCCeG94PwHQFYjNfS+iR8mOan/Ld2/NtNjXkzeQ1HnMVnBfEym/dDgTS2XTMnOvFIbOyDkCPViFTwS82q2xBKcUkYO5JRLTW2+8YxVo2elknGmOAOnt/c838qpxcMWDDDNwrTQNZ37NQlv0pae/PtJNPrLjKURA+pSSoeF+yAcGklBytfNlzZdK7cUCUnnYOErUqLWotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47wYujmxUbwb3Q4zhgp3DtFcdHgmy7H65HQAdh2HAng=;
 b=Q2qSvwvPZ6Qq9RBkFo02EqRm6Hfa1Qumc5K/pGsa8F3gPKplyb6p8KzxOCG6piX4kZqtT0UTXHxNf+1hqdqkKNIvxlnFemVEaMpg3Bl/Hs1yh1WLddTjM7ZfjO6cEDBvGWR/fAmqp6yqG6Tmoxwf3+qxR/ngsloSUE+F8217MOg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Thread-Topic: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Thread-Index: AQHZqnF+MEQOQBJ9JkqCgXsEWfzVu6+h3a0AgAfsJYCAARnyAA==
Date: Wed, 5 Jul 2023 08:40:49 +0000
Message-ID: <B53B7ADE-56F0-45D1-992B-BCC9B29C82AB@arm.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <8a8d5ed47f24791d3927345fafed07023a8b0b76.1688032865.git.nicola.vetrini@bugseng.com>
 <55390224-89CC-44E9-95B1-BBA491BBFEF3@arm.com>
 <3a192d6a-4a4d-b798-c205-ebc0a2302c50@suse.com>
In-Reply-To: <3a192d6a-4a4d-b798-c205-ebc0a2302c50@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM9PR08MB7165:EE_|DB9PR08MB9826:EE_|AM7EUR03FT047:EE_|DB8PR08MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: 654d83db-5133-4336-6f73-08db7d338de3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8Bnho6c4oKNadBgRJ1SYUm6sXvV8lYBT/ZsDNJ6Tfz24CVab/UbDMAg/OAUtdMhcm/hceEZSe14q405CfIQyUMC5mzFIo/QiBp5kCH0CWgOU/RFNiilhTzVmrr849N/GU9dXJ5R1/NPegDAxNxhuHPFFCi3fG3pd0HSvbaId/Ryjf3ySqdG63kvuRc108bHSbgPivOyvXMPeE/V1aQOzBrKmgJkPxgJ/Lu8AcGXmeRmgGjy/BzPbLck2Ieel1NIBcnqWWFSnIFgrfenBnZpsREvpBvqvYYIohUqai0ZuRYwQuNc0NrqxrGygUrkxJgSyClnbBDSAtedMJpoxuxMLRGuoD7rgXi/PyCvonIk8P24a1mTQwwhMHVKS5QNXRNC8wt9XKdjXnikFmQnVSP6lL45s/3w8HldMncQduLUVly1LsqLljI4Ggt/gp93pWcTffWg6xiCzK/pQkQA3pD73oFnD+9cuGdnYB5DEyUlVzxpaMQ9rCFhmQTTKM3GRcLgnrHGaJYu4bY2Xrk+C0U24zlBnARMhhilphy9sBmo4cJ75pe+rSnqp13/0QBc/slMRgqpV7Dx4zEFqsGuqYDAsyA3/a9RUXqSZtc47EfHsYGtz2iPDeRXRAXJz8iQR4yV+1A5M+xr9nXj3YU+pqh56xQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(41300700001)(478600001)(6512007)(38070700005)(54906003)(86362001)(38100700002)(122000001)(6486002)(71200400001)(91956017)(4326008)(316002)(66446008)(83380400001)(6916009)(33656002)(66476007)(64756008)(66556008)(36756003)(76116006)(66946007)(2906002)(2616005)(186003)(6506007)(26005)(8676002)(8936002)(5660300002)(53546011)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <908282B890F28742A521DD70F1948C71@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9826
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9127a41-951c-4569-b7d2-08db7d338886
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/WL/m9xDrwMb/anVh4lMjIMpELECZpFX28R1zAK41PYuTaGtDrJzrFK+V8Vh040J+3MLGeiLKm1+KL8/iNKq1n2OBk5YwiO4eONZxH89/difVwfYb7dY0LI4Lgr+J7GKx6Wrl0+v5Ep4/2Go1tnF7PmTRIJPLtZUNWJpZVkwjDymursToVgpLfCSNoEwRgXgsxCobumsAXoS5CVH0FIiMFC/eTKRgo6PFjAqR1PtQk03GoJW24FtL2M4JAmsi019NU+2lRYWXb+cust23SnybqEndNuGVjBAE5kf4RCgxc1FpJxF4jgF9o8hg56WI9+HGKTluN/YKQHoJMUkYYmT9jlbW91FmpHeFG3ImYeRA315tvjdo9GHY/xafejByw0It4oLq8OhwCJWa/leZoxTzkg7y5QBm0agofnpWLDv5+Cg+I+bNjwDSZKFDh5AgZ5oc/Q0L3x5TkR1xw3IrMj95fSLeZVs5+B2hACc3Z9C7LFU4PYY7eVs7bE+yvtkPr7Vb7ucTswaWOo0sO26oMc4DPOoU0xjA0hJHpntXRqW6OLoNw7zPEvHRRG73MX/F8FVf7YnqPibqJaFlH6xIRXMMeHrMzC9/ZdNDU6aO4hBAT0i4uB7rEw3SMn4YJNcnUngPMJX/gSSDCdoH31DNLI1loelt3lTxGq7zG8qbZwHgZLDJq+8cZKy7OFqUwi/xML51+TSSGjMZy4fayo+b6YGBueoj24CPiTCf8YzXAKtP9vl97G8DRnCA+aigUK9joRl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(6486002)(478600001)(70586007)(54906003)(2616005)(83380400001)(36860700001)(47076005)(336012)(33656002)(36756003)(86362001)(40480700001)(2906002)(82310400005)(53546011)(186003)(6506007)(26005)(70206006)(107886003)(6512007)(81166007)(356005)(82740400003)(40460700003)(316002)(4326008)(41300700001)(8936002)(8676002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 08:40:57.9728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 654d83db-5133-4336-6f73-08db7d338de3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5468

SGksDQoNCj4gT24gNCBKdWwgMjAyMywgYXQgNDo1MSBwbSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI5LjA2LjIwMjMgMTY6NTIsIEx1Y2EgRmFuY2Vs
bHUgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIDI5IEp1biAyMDIzLCBhdCAxMTowNiwgTmljb2xh
IFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPiB3cm90ZToNCj4+PiANCj4+PiBJ
biB0aGUgZmlsZSBgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYycgdGhlcmUg
YXJlIGEgZmV3IG9jY3VycmVuY2VzDQo+PiANCj4+IGhlcmUgeW91IHVzZSBhIGRpZmZlcmVudCBj
aGFyYWN0ZXIgdG8gZW5jbG9zZSB0aGUgZmlsZSBwYXRoIChgIHZzIOKAmCkgbWF5IEkgc3VnZ2Vz
dCB0bw0KPj4gdXNlIG9ubHkgKOKAmCk/DQo+PiANCj4+PiBvZiBuZXN0ZWQgJy8vJyBjaGFyYWN0
ZXIgc2VxdWVuY2VzIGluc2lkZSBDLXN0eWxlIGNvbW1lbnQgYmxvY2tzLCB3aGljaCB2aW9sYXRl
DQo+Pj4gUnVsZSAzLjEuDQo+Pj4gDQo+Pj4gVGhlIHBhdGNoIGFpbXMgdG8gcmVzb2x2ZSB0aG9z
ZSBieSByZXBsYWNpbmcgdGhlIG5lc3RlZCBjb21tZW50cyB3aXRoDQo+Pj4gZXF1aXZhbGVudCBj
b25zdHJ1Y3RzIHRoYXQgZG8gbm90IHZpb2xhdGUgdGhlIHJ1bGUuDQo+Pj4gDQo+Pj4gU2lnbmVk
LW9mZi1ieTogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPg0KPj4g
DQo+PiBZb3UgYXJlIG1pc3NpbmcgdGhlIOKAnC0tLeKAnCBoZXJlLCBtZWFuaW5nIHRoYXQgdGhl
IGxpbmVzIGJlbG93IGFyZSBwYXJ0IG9mIHRoZQ0KPj4gY29tbWl0IG1lc3NhZ2UgYW5kIEnigJlt
IHN1cmUgeW91IGRvbuKAmXQgd2FudCB0aGF0Lg0KPj4gDQo+PiBBbHNvIGhlcmUsIG1heSBJIHN1
Z2dlc3QgdG8gdXNlIHRoaXMgY29tbWl0IHRpdGxlIGluc3RlYWQ/DQo+PiDigJx4ZW4vYXJtOiBz
bW11djM6IEZpeCB2aW9sYXRpb25zIG9mIE1JU1JBIEM6MjAxMiBSdWxlIDMuMeKAnQ0KPiANCj4g
SnVzdCB0byBtZW50aW9uIGl0OiBQZXJzb25hbGx5IEknbSBhdmVyc2UgdG8gc3VjaCBkb3VibGUg
c3ViamVjdCBwcmVmaXhlcy4NCj4gV2h5IHdvdWxkIChoZXJlKSAieGVuL3NtbXV2MzogIiBub3Qg
YmUgc3VmZmljaWVudCAoYW5kIGVudGlyZWx5IHVuYW1iaWd1b3VzKT8NCg0KV2l0aCB0aGUgY2hh
bmdlcyBzdWdnZXN0ZWQgYWJvdmUuDQoNCkFja2VkLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2lu
Z2hAYXJtLmNvbT4NCg0KUmVnYXJkcywNClJhaHVsDQoNCg0K

