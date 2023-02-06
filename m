Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D215D68C0D0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490532.759276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2wf-0007Co-Cl; Mon, 06 Feb 2023 14:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490532.759276; Mon, 06 Feb 2023 14:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2wf-0007Af-9D; Mon, 06 Feb 2023 14:58:13 +0000
Received: by outflank-mailman (input) for mailman id 490532;
 Mon, 06 Feb 2023 14:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzyl=6C=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pP2wd-0007AJ-2H
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:58:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab4a0a26-a62e-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 15:58:09 +0100 (CET)
Received: from AS9PR05CA0136.eurprd05.prod.outlook.com (2603:10a6:20b:497::6)
 by PAWPR08MB9447.eurprd08.prod.outlook.com (2603:10a6:102:2e5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Mon, 6 Feb
 2023 14:58:06 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:497:cafe::4d) by AS9PR05CA0136.outlook.office365.com
 (2603:10a6:20b:497::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 14:58:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.27 via Frontend Transport; Mon, 6 Feb 2023 14:58:06 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Mon, 06 Feb 2023 14:58:06 +0000
Received: from fa32cfcbdc9f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4AD85048-35F4-4B11-868E-F5F9E8A30301.1; 
 Mon, 06 Feb 2023 14:58:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa32cfcbdc9f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Feb 2023 14:58:00 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB5PR08MB10063.eurprd08.prod.outlook.com (2603:10a6:10:48a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:57:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 14:57:57 +0000
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
X-Inumbo-ID: ab4a0a26-a62e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na2eRzEXYv0U2eIJkYzdDK5WRObRa3XeWd8bVJTDIMA=;
 b=R02fcEr95Pu/UVZfAtka4DMpthvKAeFCmwpjcNIoDGzO1rhUNRcruovdASi1cgNsThYV9Un3nWA2SapeGzZPo8dR8K4WbLqz4dQv21GA3bmkYI45MQOOkqNjGYWqwMj7vaW14Z8TJ4KreBjfCvREUk0onfTfi0pJ3QTA7TXUDDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdbf87687f7417bc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjpSyn6CawGOgbUgKU3QPmZ/hL/A4qOStRrrW9LeRIGWKB4M7hJ5SCkQelBiJSfdWPNJudHAC9FnmCXbEDY024mExvILEYiD76JAU+wiPEPgNrF5ShEwXrLRUz4HuNb/xaqyBUp0NU6SrScM4hd9nFFQCaT7tKEF2GobNkFBDpob4Z7d58i1cof7U3L9C4Zg64uRMqIzWa0EexxIgAyLgdvQoB5MW5iRzp9B1gGA89DD8KvS510CiSE+zwUiieAjDverzuspF3cShFccuu8zG97eHgTsaAflx/RgF3uT3XHuaTU9c5rnr8+X4QKVRcA32/QJtH0iZlY7tUYZUmS+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na2eRzEXYv0U2eIJkYzdDK5WRObRa3XeWd8bVJTDIMA=;
 b=OyZw2znp62mlbaUEfrn+w7ELINxOzJUT8tM+olc7yKV3MyElDSpSLUbfBhDQSuzB0c1c5VF3bOkkFgGCQ5Dg74FFBjY1riNaXjZLWBNy0AH7jt7CE3DH6q+qicYbik0VStWdYo0ZyWy3lwlvSKV8lOhkXvwSNQV5Y79/mX+/GGd2Is8BbgiuOgj9yy1dApfk2WU9XTMdG+jOtWz3YEZDpQsUJf4Oujv2kqX3RD7+xBXt+k9oKy651yg88Z2N85ogB6M5m0g5vPWGPCanAno7MFCh2DWxPeDbslVRsX5qPiHh01GvlOgZxaU3MczNDR9XpFLPKn1KKreFAviJnP2koA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na2eRzEXYv0U2eIJkYzdDK5WRObRa3XeWd8bVJTDIMA=;
 b=R02fcEr95Pu/UVZfAtka4DMpthvKAeFCmwpjcNIoDGzO1rhUNRcruovdASi1cgNsThYV9Un3nWA2SapeGzZPo8dR8K4WbLqz4dQv21GA3bmkYI45MQOOkqNjGYWqwMj7vaW14Z8TJ4KreBjfCvREUk0onfTfi0pJ3QTA7TXUDDk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Thread-Topic: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Thread-Index: AQHZOAMhFrHFBGWgpEqoPT1xaNlgs67B/28AgAABlgCAAAWwAA==
Date: Mon, 6 Feb 2023 14:57:55 +0000
Message-ID: <1E5F9B6E-9745-4536-A420-FCECB3A9FEDA@arm.com>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
 <4388B281-EAEB-456D-8759-6DE055755735@arm.com>
 <e95bdcc5-7567-dc79-10c1-281ce7f3226e@amd.com>
In-Reply-To: <e95bdcc5-7567-dc79-10c1-281ce7f3226e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB5PR08MB10063:EE_|AM7EUR03FT062:EE_|PAWPR08MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 900834fd-458a-45c1-154d-08db08528e19
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xqrwNYLvHzlXKKkk4yf620/RqXHhyintStcxs/PFyrKo9k91/03GtIMfFXrNp1svm90YI5QxsQAWJY/BYhoitWEnfyQ7FVWQJVlBXBcJs1K9OfYRS18AaUXnXlSLrLvYbbcvZlOfIsg3D1CewPkz/Qzh4+lqq2ZX4uyhG1yhf7BpIYAzpFXoI1ICvt460BqeAiVmwJtt02/PfuQUiSb9IhGGQRIML8VwJikSK6Iv43s2DUBuEXhq3kyR/kHT1Qar7g9GRssEawj3KjGvqo5lbGRR0TDT5+dPCJl5s0kq1KiMwlnl3WtGEykZjiZcHbS/Wp5QUS+5sjVB3TgRYONI+6SGd2Vxx4gMn6YGxsjPm+pH7Dxjo1XAhiRFQUaniildVUzvtGEn02nS8jutMQIOYNfSXeOd1lLA711krOTv2gV609fApDgnXYYN71bfs7vN8ohFFZeSCYQU9n1JoK76I56XsBkoduwYR/oRY/vQlAO/z5JVsibpV0AOMRkFP0dPwUsf+XB9ej7hFdKgUqEj5FwlRj2k5p9aTUVsmCP4ArzBTChW5fnPdNC5/+IKHnhVG7vaXXjLRoePiMxTg7g6zMGLzZP0weKopV+6eONhcGxLsb/h8bHWZ/gUtYEJQ3Ur/abZYw2JawxlpkmVOTvef6T6Du/ZkQm5V9ZQ78TDCbKT70jxbbC2NzGeXQk96oRRIRJLGg3TXx9+rlf7vDd5AI01/vWBnOmy5ULDCdAc1TXrLjqNo81iH5kDK5cSn/A6jcM9vWgJu/6h2REEFC0Q+A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199018)(86362001)(2906002)(122000001)(33656002)(5660300002)(38070700005)(38100700002)(41300700001)(316002)(54906003)(8936002)(66476007)(8676002)(66556008)(4326008)(76116006)(66946007)(64756008)(6916009)(66446008)(6486002)(83380400001)(966005)(478600001)(91956017)(53546011)(6512007)(6506007)(186003)(71200400001)(26005)(36756003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E19DC1D30EB3747AEDE3353BD5B7924@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10063
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	589e3cd8-24bc-4d79-3e0b-08db0852875a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mPXtnga5WXbtncEEG1A72w7vAoxvPtaXl3rzrHR44c96ZF0ILGTkow1uAexsGhQVHmSgyKKs3lERWsV2ElRMqt3aDTON9XmqYfc6Bvj17zY6ghFOGPeFIJpMBLLzlaoX+3GqoAD4M6i3gFItIvWkORAdIR3pI8CvdO8hFDkCN/4gEGu4zVmPt99v5ylZ6MngWO6v4qbEledXpen4YjrScqN8Mss0Rr+nrITQ+02Z338I4LorX8GvyTnn0fSI5A48vqNY3rAfNGGZT1ep3yhKshZfj3czOElvWNPUL8NJtvt+vFEoiID50tJIYRHh4Ndqe/ZN6jIXDzgFwQkAuKwjCuHtYXv7UwAnI42D6MBvm3MdhLTsSVvJbaU/6jdEUkndnm9BPfLSPG1QaxujYf4gX0BLU25m3TpVOcyLUWGdVK2rRsSCpTiJllDwvmHx6N2FFSCVpwEW6tBXuGq85mqtP7HaK8Dg7hII1cKrGuAX9KD18IYy2Q6qEoT623mfoHt+TH/jZk8aKkJOeTtMao3qJlTwZWPra2mlFbKsBk0Fo1O+QbcIxPubr4saHe/+3k2PriqypLAmVHip1X3UuqanEke7EyDhn9M1SI2nHxHLz38VLV+Kw/pSLpc7MygW09owF/8eGVwB4LFvvtdZI6vV+pgEvWEVX4jJL/uAIzMjbiy0lh9vxbhZ/+bEYKTuBQywSF9ouNt1Ch0dBhh7pfUmH69LTLqbpIedWAt4aW2/QLM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199018)(40470700004)(46966006)(36840700001)(54906003)(966005)(478600001)(26005)(6486002)(6512007)(186003)(2616005)(336012)(53546011)(6506007)(70206006)(36756003)(316002)(2906002)(4326008)(8676002)(6862004)(40460700003)(83380400001)(41300700001)(356005)(8936002)(33656002)(82740400003)(82310400005)(40480700001)(81166007)(47076005)(70586007)(36860700001)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:58:06.6624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 900834fd-458a-45c1-154d-08db08528e19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9447

DQoNCj4gT24gNiBGZWIgMjAyMywgYXQgMTQ6MzcsIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDA2LzAyLzIwMjMgMTU6
MzEsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4gSGkgWGVuaWEsDQo+PiANCj4+
PiBPbiAzIEZlYiAyMDIzLCBhdCAxOTowOSwgWGVuaWEgUmFnaWFkYWtvdSA8YnVyemFsb2Rvd2FA
Z21haWwuY29tPiB3cm90ZToNCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBYZW5pYSBSYWdpYWRh
a291IDxidXJ6YWxvZG93YUBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+Pj4gDQo+Pj4gQ2hhbmdlcyBp
biB2MzoNCj4+PiAtIHRoZSBmaXhlcyBhcmUgYmFzZWQgc29sZWx5IHRvIEVjbGFpciBmaW5kaW5n
cyAodGhlIHRvb2wgaGFzIGJlZW4NCj4+PiAgIGFkanVzdGVkIHRvIHJlcG9ydCBvbmx5IHRob3Nl
IHZpb2xhdGlvbnMgdGhhdCBjYW4gcmVzdWx0IHRvIGEgYnVnKQ0KPj4+IC0gcmVmbGVjdCB0aGlz
IGluIHRoZSBjb21taXQgdGl0bGUNCj4+PiANCj4+PiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3Ry
ZWUuaCB8IDE0ICsrKysrKystLS0tLS0tDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkNCj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL2RldmljZV90cmVlLmggYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaA0KPj4+IGlu
ZGV4IGEyODkzN2QxMmFlOC4uNzgzOWExOTllMzExIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9kZXZpY2VfdHJlZS5oDQo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RldmljZV90
cmVlLmgNCj4+PiBAQCAtMzcsMTEgKzM3LDExIEBAIHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggew0K
Pj4+ICAgIGNvbnN0IHZvaWQgKmRhdGE7DQo+Pj4gfTsNCj4+PiANCj4+PiAtI2RlZmluZSBfX0RU
X01BVENIX1BBVEgocCkgICAgICAgICAgICAgIC5wYXRoID0gcA0KPj4+IC0jZGVmaW5lIF9fRFRf
TUFUQ0hfVFlQRSh0eXApICAgICAgICAgICAgLnR5cGUgPSB0eXANCj4+PiAtI2RlZmluZSBfX0RU
X01BVENIX0NPTVBBVElCTEUoY29tcGF0KSAgIC5jb21wYXRpYmxlID0gY29tcGF0DQo+Pj4gKyNk
ZWZpbmUgX19EVF9NQVRDSF9QQVRIKHApICAgICAgICAgICAgICAucGF0aCA9IChwKQ0KPj4+ICsj
ZGVmaW5lIF9fRFRfTUFUQ0hfVFlQRSh0eXApICAgICAgICAgICAgLnR5cGUgPSAodHlwKQ0KPj4+
ICsjZGVmaW5lIF9fRFRfTUFUQ0hfQ09NUEFUSUJMRShjb21wYXQpICAgLmNvbXBhdGlibGUgPSAo
Y29tcGF0KQ0KPj4+ICNkZWZpbmUgX19EVF9NQVRDSF9OT1RfQVZBSUxBQkxFKCkgICAgICAubm90
X2F2YWlsYWJsZSA9IDENCj4+PiAtI2RlZmluZSBfX0RUX01BVENIX1BST1AocCkgICAgICAgICAg
ICAgIC5wcm9wID0gcA0KPj4+ICsjZGVmaW5lIF9fRFRfTUFUQ0hfUFJPUChwKSAgICAgICAgICAg
ICAgLnByb3AgPSAocCkNCj4+PiANCj4+PiAjZGVmaW5lIERUX01BVENIX1BBVEgocCkgICAgICAg
ICAgICAgICAgeyBfX0RUX01BVENIX1BBVEgocCkgfQ0KPj4+ICNkZWZpbmUgRFRfTUFUQ0hfVFlQ
RSh0eXApICAgICAgICAgICAgICB7IF9fRFRfTUFUQ0hfVFlQRSh0eXApIH0NCj4+PiBAQCAtMjI2
LDEzICsyMjYsMTMgQEAgZHRfZmluZF9pbnRlcnJ1cHRfY29udHJvbGxlcihjb25zdCBzdHJ1Y3Qg
ZHRfZGV2aWNlX21hdGNoICptYXRjaGVzKTsNCj4+PiAjZGVmaW5lIERUX1JPT1RfTk9ERV9TSVpF
X0NFTExTX0RFRkFVTFQgMQ0KPj4+IA0KPj4+ICNkZWZpbmUgZHRfZm9yX2VhY2hfcHJvcGVydHlf
bm9kZShkbiwgcHApICAgICAgICAgICAgICAgICAgIFwNCj4+PiAtICAgIGZvciAoIHBwID0gZG4t
PnByb3BlcnRpZXM7IHBwICE9IE5VTEw7IHBwID0gcHAtPm5leHQgKQ0KPj4+ICsgICAgZm9yICgg
cHAgPSAoZG4pLT5wcm9wZXJ0aWVzOyAocHApICE9IE5VTEw7IHBwID0gKHBwKS0+bmV4dCApDQo+
Pj4gDQo+Pj4gI2RlZmluZSBkdF9mb3JfZWFjaF9kZXZpY2Vfbm9kZShkdCwgZG4pICAgICAgICAg
ICAgICAgICAgICAgXA0KPj4+IC0gICAgZm9yICggZG4gPSBkdDsgZG4gIT0gTlVMTDsgZG4gPSBk
bi0+YWxsbmV4dCApDQo+Pj4gKyAgICBmb3IgKCBkbiA9IGR0OyAoZG4pICE9IE5VTEw7IGRuID0g
KGRuKS0+YWxsbmV4dCApDQo+Pj4gDQo+Pj4gI2RlZmluZSBkdF9mb3JfZWFjaF9jaGlsZF9ub2Rl
KGR0LCBkbikgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+IC0gICAgZm9yICggZG4gPSBkdC0+
Y2hpbGQ7IGRuICE9IE5VTEw7IGRuID0gZG4tPnNpYmxpbmcgKQ0KPj4+ICsgICAgZm9yICggZG4g
PSAoZHQpLT5jaGlsZDsgKGRuKSAhPSBOVUxMOyBkbiA9IChkbiktPnNpYmxpbmcgKQ0KPj4+IA0K
Pj4+IC8qIEhlbHBlciB0byByZWFkIGEgYmlnIG51bWJlcjsgc2l6ZSBpcyBpbiBjZWxscyAobm90
IGJ5dGVzKSAqLw0KPj4+IHN0YXRpYyBpbmxpbmUgdTY0IGR0X3JlYWRfbnVtYmVyKGNvbnN0IF9f
YmUzMiAqY2VsbCwgaW50IHNpemUpDQo+Pj4gLS0NCj4+PiAyLjM3LjINCj4+PiANCj4+PiANCj4+
IA0KPj4gV2hpbGUgdGhlIGNoYW5nZXMgbG9va3Mgc2Vuc2libGUgdG8gbWUsIEnigJl2ZSBoYWQg
YSBsb29rIGluIGVjbGFpciBidXQgSSB3YXMgdW5hYmxlIHRvIGZpbmQgdGhlIGZpbmRpbmdzLA0K
Pj4gaGVyZSB3aGF0IGZpbmRpbmdzIEkgaGF2ZSBpbiB0aGUgbGF0ZXN0IHJlcG9ydDoNCj4+IGh0
dHBzOi8vZWNsYWlyaXQuY29tOjg0NDMvam9iL1hFTi9UYXJnZXQ9QVJNNjQsYWdlbnQ9ZG9ja2Vy
MS9sYXN0QnVpbGQvZWNsYWlyL3BhY2thZ2VOYW1lLjgzMjIwNDYyMC9maWxlTmFtZS4xODExNjc1
ODA2Lw0KPiANCj4gRWNsYWlyIGRvZXMgbm90IHJlcG9ydCB2aW9sYXRpb25zIGF0IHRoZSBkZWZp
bml0aW9uIGJ1dCByYXRoZXIgYXQgdGhlIHVzZS4NCj4gQ2hlY2sgZG9tYWluX2J1aWxkLmMgZm9y
IGV4YW1wbGUgdG8gc2VlIHRoZSByZXBvcnRzIGZvciAyMC43IHJlbGF0ZWQgdG8gdGhlc2UgbWFj
cm9zLg0KDQpXb3cgeWVzIHRoYXTigJlzIHJpZ2h0LCBhIGJpdCBhbm5veWluZyB0byBsaW5rIHRo
ZSBpc3N1ZXMhIFdobyBrbm93cyBpZiB0aGVyZSBpcyBhIG1vZGUgdG8gbWFrZSBpdCBwb2ludCBv
dXQgdGhlIHZpb2xhdGlvbiBhdCB0aGUgZGVmaW5pdGlvbg0KbGlrZSBjcHBjaGVjay4NCg0KSeKA
mWxsIHJldmlldyB0aGlzIHBhdGNoIGxhdGVyIHRoaXMgd2VlayBpZiBJIG1hbmFnZSB0byBmaW5k
IHRoZSB0aW1lDQoNCj4gDQo+IH5NaWNoYWwNCg0K

