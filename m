Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DDC76E9F1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576372.902425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYFe-0002KZ-UB; Thu, 03 Aug 2023 13:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576372.902425; Thu, 03 Aug 2023 13:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYFe-0002IO-QN; Thu, 03 Aug 2023 13:20:26 +0000
Received: by outflank-mailman (input) for mailman id 576372;
 Thu, 03 Aug 2023 13:20:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRYFd-0002II-KZ
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:20:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fd4d85f-3200-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 15:20:22 +0200 (CEST)
Received: from AM6PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:92::47)
 by PAXPR08MB6512.eurprd08.prod.outlook.com (2603:10a6:102:15a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 13:20:16 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::eb) by AM6PR04CA0034.outlook.office365.com
 (2603:10a6:20b:92::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 13:20:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 13:20:15 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Thu, 03 Aug 2023 13:20:15 +0000
Received: from 4d39f9a696b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE1F423C-DA71-4FB6-B999-463B7E1C9A84.1; 
 Thu, 03 Aug 2023 13:19:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d39f9a696b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 13:19:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5609.eurprd08.prod.outlook.com (2603:10a6:102:81::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 13:19:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 13:19:56 +0000
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
X-Inumbo-ID: 7fd4d85f-3200-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yko7sJmAsPPi1OmFjJV2UWT7nJR71uws+pnhFOs32cY=;
 b=qclv42IOfnYs3n1ali34BJ986r5SpkhaSAGhFryPNBL6bAYPQTz5otqA1EoIN1zajPyLNV+2Nz+VxEw/usCC41oWl+C3MbYu4tI48lQo+8LCzQ5gDfLqypUUR3sutNwD8oKnuIyIgSGnF1SAfWL3P4PoYN2MVHITu1PQLbcKuuA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 807d66da92d13ce1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYko0bpM/8JPO7Zo2xzS4CIuTuiNDzMRGIAX9yL9t3GyQDXQ7XaoTOVHhMFA0WmpwCsfwqAywJuUfmIBMhPXfY6pmpyZuMWZ0XP/dRFw5k1c6qBrENug83VMsjuhV/uMAwshdOU2S/kpZt3aBatkX9nt1iFQnaB405pDNCj3fN3cbNb4USjfDYpAyK7Au7DI9XEowDI2CAz8afhu6TkwnMH6k15exGosjz7ncTIfh8AYnGg+NeVxozV0CHvsgUud0O+qUpkI1Bw96O13lp7M1svHMufD85ukxd9w/jq31e2ArK+7xHmsAUXBgEjzHGFMtnONDOauXH/r38ERl2SAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yko7sJmAsPPi1OmFjJV2UWT7nJR71uws+pnhFOs32cY=;
 b=fIB7skvQuVMrADkKLzSsj5ZhveGNVBxgXZh4VFrRyDpKYu8z3yXqkfrGEzycNho32NwQLOMWl1h3NbZGpgz0k8xfSykrvyzH66a1QTTBjt0lv613qYx9JlFomzEAcpSY/5pY3FZjSRGtbOxeBWVqsxb4kBWKZURG2q0Sxl8pe85uCZ7ZELo9E4+ZOTJ8llQYOuUeiol+spwmg4YV6K6TDFnqEjL7ogLIx1X5PXUu/LiErj35fGUcRfPbNsWdxe5mzm0bcyQ3bXC7/2IKkgEvEAjent+ZY24cxhOI6gSBsCYuQcdhV0NLXAmDGA6bbXdw9kcL4Nr9g2HJlbC8YJgJvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yko7sJmAsPPi1OmFjJV2UWT7nJR71uws+pnhFOs32cY=;
 b=qclv42IOfnYs3n1ali34BJ986r5SpkhaSAGhFryPNBL6bAYPQTz5otqA1EoIN1zajPyLNV+2Nz+VxEw/usCC41oWl+C3MbYu4tI48lQo+8LCzQ5gDfLqypUUR3sutNwD8oKnuIyIgSGnF1SAfWL3P4PoYN2MVHITu1PQLbcKuuA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index: AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/YV3wAgAAz1YCAAAR1AA==
Date: Thu, 3 Aug 2023 13:19:56 +0000
Message-ID: <4F3C5624-A96E-4AB0-87B2-B5F67B8661E2@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <9320a2b7-18cd-2766-b115-300755d64932@xen.org>
 <B2EA567E-1E51-44CC-94D8-DC8C765EC4AB@arm.com>
In-Reply-To: <B2EA567E-1E51-44CC-94D8-DC8C765EC4AB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5609:EE_|AM7EUR03FT006:EE_|PAXPR08MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a0d8cd-e0f2-4672-7798-08db94246024
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IBbBU4tIX8myHPmT5cPD0CcekePGjPqEQJ8iP+bXwueP5tyY8QKF4ZeVzelOsgRg+rOrifLWSJK9qeSkiDzQZVct7bQqOpj9z+AZ5Os1yexr0Tgn20hyDqpOmmrH1mte5MMj6RYvF4ecPlT4YrNCxEQFQHodL51+hxj/wdMH1F6bKRb5g53efhdCk5bYQW28f6eyGIeXBWS3rGY9GB1/vFjA78yqPM9HouCwO0zfm7ctHGiYpHFlSy/+62Ap41jC1xTLFHIPAdLqLEi20TOo/BwDQ0GM6agbVEcYAe7lVuAizB4PNZoBSd6ConbomIAmMer6rRmydfK+zr4UKOb5Ieq2Ro4LJYz4YbYwDJ3uMUQyGnaZZA7cJ+dYs7gujsMtoCrB9sK5OyB112lK5Cf441BQLEPS6KdxTdIrwHAOfG/qRjhtDycTCv/6SbeVr3elZNSJUdHRoZENKSmjTDqGGqTPI/4WqSq2fHsUrHQsTBjAR5s9T4tZ7CxJgPllXZ8GYMSIzwJvFWQew/MDdRdrf4bDMR6NfHtSnzxUIWjBoPT1YIl85Nuni5CQZDVK7CstTEkDleojOOvzkaRPXKqUJU9q/iuKMN5hPfP5AHJL9evHlZKt4eh1XKY1tAoQ+dUO9F+DwYDinV98c4DMr2zsNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(316002)(76116006)(2906002)(91956017)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(6486002)(71200400001)(6512007)(54906003)(478600001)(38100700002)(122000001)(86362001)(33656002)(36756003)(38070700005)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E440CA75D497E4BA154F459819B38B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5609
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f3a274e-0b82-4730-88ba-08db942454de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VMeNzhD+XdzWNYvvI6YlGjt6YhCd5FsriRWhglz8b9iqYm/WUwouuxhIeAYAMmtlyBORkR0kfT7leAjhKSdlJOoDkDAJg01LoqdjUnah9HgjpUf2MHfqA6Hg1HD1K3gJss5s3rmvonjIHrheHDdh2pkqxY6oAK6YEgqWva2lgueazGOh90qAkyxly50J0QGNYaNoXfIMZoOcQBTWqxHOZ/KoQ+ZYToX+8W7R4gKVopHLeSQWtuhfe//CAfO0XphdoCSdIxRj7M/fgW5pMPvwcq0RHVHFJZUIKsVfoJJ3MGZZqyyIHoADs/pGobTqKSJgxER6lrKbqju8SlhfM6SKH86lCvYL0jmodv1w98dNUwsRJ1TdaMZaGc59fUlUYtJ9smvS14XcM0o3n7XEuV2h3uzOyGWXnM9eS6indhUuoIwjayJp1LyHfgCJpSey4xOU/3/u24UjASTE6kROUQ0/R9ol9eNudWGDGjYxiaXUhJZvnSShlJdwbAIsQfLMmt8C0V/yo9EwMQszm/rXpDz0GDf0vuWBBSPRrGXidgGvM77HdktX53W/N8jbbApFPwxw/waZmA4YVnEuqhGAyUCZIawJaWE7OlDyfE82v89ypgJhHOsWYJr7VhY1L410Q8dT25J4NsBVa2PvEFdcIhIE7i6RAIc5jwrL18hSXXT9DVErJj89KgRXUmbQTkGi+Df9M7ATUAMOvjYDwIl8ysKzt9NnoicYoxYTyVf5JfRcLGE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(107886003)(53546011)(6506007)(26005)(186003)(336012)(47076005)(36860700001)(316002)(2906002)(70586007)(70206006)(4326008)(5660300002)(6862004)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(40480700001)(356005)(81166007)(86362001)(33656002)(36756003)(82740400003)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 13:20:15.4699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a0d8cd-e0f2-4672-7798-08db94246024
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6512

DQoNCj4gT24gMyBBdWcgMjAyMywgYXQgMTQ6MDMsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2Vs
bHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKdWxpZW4sDQo+IA0KPj4+ICsNCj4+PiBjb25m
aWcgR0lDVjMNCj4+PiAgYm9vbCAiR0lDdjMgZHJpdmVyIg0KPj4+ICBkZXBlbmRzIG9uICFORVdf
VkdJQw0KPj4+IEBAIC05Miw2ICsxMDAsMTEgQEAgY29uZmlnIEhBU19JVFMNCj4+PiAgICAgICAg
IGJvb2wgIkdJQ3YzIElUUyBNU0kgY29udHJvbGxlciBzdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlm
IFVOU1VQUE9SVEVEDQo+Pj4gICAgICAgICBkZXBlbmRzIG9uIEdJQ1YzICYmICFORVdfVkdJQyAm
JiAhQVJNXzMyDQo+Pj4gK2NvbmZpZyBWR0lDVjINCj4+PiArIGJvb2wgInZHSUN2MiBpbnRlcmZh
Y2UgZm9yIGd1ZXN0cyINCj4+IA0KPj4gVGhpcyBkZXNjcmlwdGlvbiBpcyBhIGJpdCBtaXNsZWFk
aW5nIGFzIHRoZSB2R0lDdjIgd2lsbCBhbHNvIGJlIHVzZWQgZm9yIGRvbTAgaW4gdGhlIGNhc2Ug
b2YgdkdJQ3YyLg0KPj4gDQo+Pj4gKyBkZWZhdWx0IHkNCj4+IA0KPj4gUGxlYXNlIGFkZCBhIGxv
bmdlciBoZWxwLg0KPj4gDQo+Pj4gKyBkZXBlbmRzIG9uIChHSUNWMiB8fCBHSUNWMykgJiYgIU5F
V19WR0lDDQo+PiANCj4+IEluIHRoZSBuZWFyIGZ1dHVyZSwgSSBkb24ndCBleHBlY3QgYW55b25l
IHRvIGludHJvZHVjZSBhIG5ldyBub24tR0lDIG9mIGludGVycnVwdCBjb250cm9sbGVyIGZvciBB
cm0uIEJ1dCBJIHdvdWxkIGV4cGVjdCBuZXcgdmVyc2lvbiBvZiB0aGUgR0lDLiBTbyBJIHdvdWxk
IGRyb3AgKEdJQ1YyIHx8IEdJQ1YzKS4NCj4+IA0KPj4gQWxzbyB3aGVuICFORVdfVkdJQyBpcyBz
ZWxlY3RlZCwgdGhpcyB3aWxsIG1ha2UgVkdJQ1YyIHdpbGwgYmUgdW5zZWxlY3RlZC4gSSB3YXMg
YWN0dWFsbHkgZXhwZWN0aW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kIGdpdmVuIHRoYXQgbmV3IHZH
SUMgb25seSBvZmZlciB2MiBzdXBwb3J0Lg0KPj4gDQo+PiBUaGUgcmVzdCBvZiB0aGUgY2hhbmdl
cyBMR1RNLg0KPiANCj4gVGhhbmtzIGEgbG90IGZvciBoYXZpbmcgYSBsb29rIG9uIHRoaXMgcGF0
Y2gsIHlvdSBhcmUgcmlnaHQgdGhlIE5FV19WR0lDIGlzIG9mZmVyaW5nIG9ubHkgdjIgc3VwcG9y
dCBhdCB0aGUgbW9tZW50LCBkb2VzIHRoaXMgY2hhbmdlcyBjYXB0dXJlcyB5b3VyDQo+IENvbW1l
bnRzPw0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gv
YXJtL0tjb25maWcNCj4gaW5kZXggNWNkYmEwN2RmOTY0Li4xYzYwMGIzYjhkMDQgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmln
DQo+IEBAIC0xMTAsMTUgKzExMCwxOSBAQCBjb25maWcgSEFTX0lUUw0KPiAgICAgICAgIGRlcGVu
ZHMgb24gR0lDVjMgJiYgIU5FV19WR0lDICYmICFBUk1fMzINCj4gDQo+IGNvbmZpZyBWR0lDVjIN
Cj4gLSAgICAgICBib29sICJ2R0lDdjIgaW50ZXJmYWNlIGZvciBndWVzdHMiDQo+ICsgICAgICAg
Ym9vbCAidkdJQ3YyIGludGVyZmFjZSBmb3IgZG9tYWlucyINCj4gICAgICAgIGRlZmF1bHQgeQ0K
PiAtICAgICAgIGRlcGVuZHMgb24gKEdJQ1YyIHx8IEdJQ1YzKSAmJiAhTkVXX1ZHSUMNCj4gKyAg
ICAgICBoZWxwDQo+ICsgICAgICAgICBQcm92aWRlcyBhIHZpcnR1YWxpc2VkIGludGVyZmFjZSBm
b3IgdGhlIEdlbmVyaWMgSW50ZXJydXB0IENvbnRyb2xsZXIgdGhhdA0KPiArICAgICAgICAgY2Fu
IGJlIHVzZWQgYnkgWGVuJ3MgZG9tYWlucy4NCj4gKyAgICAgICAgIElmIHVuc3VyZSwgc2F5IFkN
Cj4gDQo+IGNvbmZpZyBIVk0NCj4gICAgICAgICBkZWZfYm9vbCB5DQo+IA0KPiBjb25maWcgTkVX
X1ZHSUMNCj4gICAgICAgIGJvb2wgIlVzZSBuZXcgVkdJQyBpbXBsZW1lbnRhdGlvbiINCj4gKyAg
ICAgICBzZWxlY3QgVkdJQ1YyDQoNClNvcnJ5LCBJIG1lYW50IHRvIHVzZSBoZXJlIOKAnHNlbGVj
dCBHSUNWMiINCg0KPiAgICAgICAgLS0taGVscC0tLQ0KPiANCj4gICAgICAgIFRoaXMgaXMgYW4g
YWx0ZXJuYXRpdmUgaW1wbGVtZW50YXRpb24gb2YgdGhlIEFSTSBHSUMgaW50ZXJydXB0DQo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS92Z2lj
L01ha2VmaWxlDQo+IGluZGV4IDgwNjgyNjk0OGUyMC4uNjBjYmY3ZjJmOTRhIDEwMDY0NA0KPiAt
LS0gYS94ZW4vYXJjaC9hcm0vdmdpYy9NYWtlZmlsZQ0KPiArKysgYi94ZW4vYXJjaC9hcm0vdmdp
Yy9NYWtlZmlsZQ0KPiBAQCAtMSw1ICsxLDUgQEANCj4gb2JqLXkgKz0gdmdpYy5vDQo+IC1vYmot
eSArPSB2Z2ljLXYyLm8NCj4gK29iai0kKENPTkZJR19WR0lDVjIpICs9IHZnaWMtdjIubw0KPiBv
YmoteSArPSB2Z2ljLW1taW8ubw0KPiAtb2JqLXkgKz0gdmdpYy1tbWlvLXYyLm8NCj4gK29iai0k
KENPTkZJR19WR0lDVjIpICs9IHZnaWMtbW1pby12Mi5vDQo+IG9iai15ICs9IHZnaWMtaW5pdC5v
DQo+IA0KPiANCj4gDQo+PiANCj4+IENoZWVycywNCj4+IA0KPj4gLS0gDQo+PiBKdWxpZW4gR3Jh
bGwNCg0KDQo=

