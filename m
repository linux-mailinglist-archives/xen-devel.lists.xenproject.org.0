Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213C4E3BBB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 10:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293346.498321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWaoS-00056P-Jq; Tue, 22 Mar 2022 09:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293346.498321; Tue, 22 Mar 2022 09:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWaoS-00053j-GV; Tue, 22 Mar 2022 09:28:24 +0000
Received: by outflank-mailman (input) for mailman id 293346;
 Tue, 22 Mar 2022 09:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+x7=UB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nWaoQ-00053b-KL
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 09:28:22 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe09::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a148d06-a9c2-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 10:28:21 +0100 (CET)
Received: from AM6PR10CA0093.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::34)
 by AM0PR08MB4212.eurprd08.prod.outlook.com (2603:10a6:208:ff::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 09:28:18 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::5) by AM6PR10CA0093.outlook.office365.com
 (2603:10a6:209:8c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Tue, 22 Mar 2022 09:28:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.18 via Frontend Transport; Tue, 22 Mar 2022 09:28:17 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 22 Mar 2022 09:28:17 +0000
Received: from 6f83aef3e7cb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57025C2C-CF7D-45E8-9197-5E22BF343C89.1; 
 Tue, 22 Mar 2022 09:28:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f83aef3e7cb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Mar 2022 09:28:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6241.eurprd08.prod.outlook.com (2603:10a6:20b:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 09:28:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 09:28:09 +0000
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
X-Inumbo-ID: 6a148d06-a9c2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4Ed22QyPFVFW9dzBUoCNppqa0LRw0wPhkWhS2Th3NY=;
 b=2jE1M6FlS69q3LLqLNWlKMINJ6w/6OpzlMe66kXuIeZPL2e88K+od+WWHBOgah2kqko+/hrMGSRjxzOWN7qiBxwIq8U8HKYOvosGbE2C4rZUJSXVWaZ00ShigJOmVgZAmFiwHaWaU19hduMoGwaJVh8bF4D6I8J8AZqm/He/em8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00a96d2ed1b20036
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhhEOIYaMDuekYV/yinU/KwQsfZwIStNK+0rWgcRLnMEurkTouRtKBevAJHjz5QzQOGVVz40ewxT3bvndsuf3D9m3R0rIaituNmZZo5RGtG7YFyue6oG/ezPhL+D9QG2GVES8c/vHd84s2XO5upNCs4S/DPBWWUUwzij5AdfVlnGD1f6wAXDpnVglbqM+63YRBMD0g0C0mBG1IEvyISIw/dc8EoZvRlBGrKOzSvsSQD0fSVEO9wTUwyPebNbVTSc5o0p0M1qBTS+aEHHbLhTaSnG/H/LUO26OEBXoXC1voLjZcTNGOUHSWPck7Wac2lRnv2YHG/uIEgeE+qEEnKwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4Ed22QyPFVFW9dzBUoCNppqa0LRw0wPhkWhS2Th3NY=;
 b=aPnOtHTqUezGN5nz+r8zCdHnX4ZA0XGxnwqUW4myO2eBJILInuejWJ13TPoWakqx5PPvOr3q/DF93F8tJ9BTslmsBQnmWY4bMphbZQ/RcYqxSw2pcAhpgk0JHkqBAEeWHVa3TkO5EMlhxDlmAm8fK9lAwJl4Gn4sa02rMkajEf+PoGLZypkxbfMN80SZC2cE497NX8C2mdWoeMQKGelSVuwnFXCzNJaR8MTJaKk1tbbP2K0p+oU0Axe66HMEsBFC4sAM8Bc4dyOzvLhJIjT4itJQXajj3tf/cM6ggrT6f29o2zKgbbMstMictYEvuJVnURThBn/LM4ok7JE29xFocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4Ed22QyPFVFW9dzBUoCNppqa0LRw0wPhkWhS2Th3NY=;
 b=2jE1M6FlS69q3LLqLNWlKMINJ6w/6OpzlMe66kXuIeZPL2e88K+od+WWHBOgah2kqko+/hrMGSRjxzOWN7qiBxwIq8U8HKYOvosGbE2C4rZUJSXVWaZ00ShigJOmVgZAmFiwHaWaU19hduMoGwaJVh8bF4D6I8J8AZqm/He/em8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYOtyBwlLK7ts4vEKxgpEPsRlgQ6zFUCoAgASzLwCAAAp/AIAADB+AgAAHFICAAPi1AIAAA2QAgAAIDACAAANfAA==
Date: Tue, 22 Mar 2022 09:28:09 +0000
Message-ID: <30030024-B7E7-47C2-BB14-F87238D56CD2@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
 <05E14D52-831A-438F-9F90-99F590A5A15F@arm.com>
 <108443e0-c7d7-af6d-2183-b1bd48b0f288@xen.org>
 <9ABBD292-A77F-4CDC-B096-546516114D42@arm.com>
 <1EAD6570-B893-4759-BA71-A1F9535E374F@arm.com>
 <d26ea92e-6d20-e487-87ea-249f698ca752@xen.org>
In-Reply-To: <d26ea92e-6d20-e487-87ea-249f698ca752@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1e9c1e90-cd5a-44db-465e-08da0be64c44
x-ms-traffictypediagnostic:
	AM9PR08MB6241:EE_|AM5EUR03FT063:EE_|AM0PR08MB4212:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB42126121C7660B0B321DC8D29D179@AM0PR08MB4212.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g3fGZIxfFhdSm9Od6Ymstr36J4iIWi4M6Ok5sTaMwJ4DA+VDdwBA7kT8Oii0YLzRu7n6TAebcYGemjCI9KKvyE1oOmmMae5YH1n1CBB9Bdha35KdIc0NuHtT1fuvVMJ8Wbux68cH7Wa27Sd4gYelqYHkYxQIecsKJ5C9YvA3qkvUQRv73MD9NALeQz32AqbU9Acm2/Tm/WCPAIJbQJYtMJ4rfupzoInTajxuwsdMeEui6+RtcYC4E7mSoRGQj28q4POYPrhidfPJl0p8Hvu1dJqWS5ApZnfgfEH761PdKH8caEEKlIOEvrXp2Aj/YQYkF/Dm4wHVe7UGkgGjRGFxHv/w3a8JZyxho+mg3E38GyC2sb/GZ1w9BxoszgYuxaZVHk2FFsXRkNZ2DlVaYwcuo2KY6cUDI3BYtQIkyltEpBubF8CmaZfL5n5C2nvvDafOJGhZhE47Ure8QtxfDe/aQVclxfiYQizcVc9VHkEaW3BiVWOGCaIIO3OU99z4e2C/6SD63RliqkvlMlD21obhjenKlW6vbz4PLGXeh4k6iUVxp8lrWIoPGyKHz0RObjyAH2haRa1dYyGrVs4WSGY5XWa5G49SMHOzgm7OKAUy9l+g3s2RhmLkfLYWsjfE2GVOVkVesOysoRne/rriuABCdRPLEWaOTyiXFLEO867W5ErC/+fGTjb5mXCxS6kZm6cKWC3W5ZALoXJc5zJcm3Ayn8pddQYTJbCibuyIwmxEeMIa1ePD9xvW+rTe6mjuBBYa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6512007)(2906002)(7416002)(5660300002)(316002)(38070700005)(38100700002)(54906003)(71200400001)(6916009)(8676002)(4326008)(33656002)(91956017)(66946007)(76116006)(66476007)(66556008)(2616005)(66446008)(86362001)(64756008)(83380400001)(26005)(508600001)(122000001)(8936002)(53546011)(6506007)(6486002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <455531134D3B5C45A0EA41E05F7A9D1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6241
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	778a2a56-ba33-4332-c61c-08da0be64770
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ENLK7HCg1VpR9Qm9iIqau5zIJ3jpFsWN14ByUNcgd74PoontYK97WHj22XlYikKYfQa4uGeqZUQXfcsOKWDKOSpr7cbuzLeAXBGbAxmHcDM5/h+wHImaqSG4nl2TwV0blU4fQEAZVEkBdaNc/7Rw7sXSGyaMtya4D0br8lfRCeTfzzMMGkKwijQ0BifwPTB8mJvtjECz4TPpd177Bl1lb1c7ruO6YvB8iH9LysdA+HFuTuOOPxe6oCzAjHe5bXYhzPXFHzDsCTYXDfsXUGvhXKdwVLaWwOtNpFvVtgV4r/HMhhrcjqVU+7ul9+5OEUoz6e77/z1DaUPVC3MB0Wm3sRhsA869TzOMjJ4iy8DQ6MvmcRYsUfiHt3Q+oXuBDnmt4VdR6kuvyUGEOFRXcTma4+DQpLOJjNayhJVUg+ULsOmct0XV3hePrmTDCndkAFI7LaMEVGYhIOlBfJB/VHHKbH/bzGT9ofRvcNZmPBrpurbvJOsjtrn0Lr4EDg4SkCz63WAqBFcp4MkWUdydsbUDuOR3lPb6uGaa2u+ulPKp4kEG9g1I0UVh60DhNAk1UsaTXqV8eY1Mjsi8Xtei5SEJGC1XK6Oab8+tiMGwS6CmqXfoG2TqFhD6Jyt8QDL1GqvGCXYECZ8zXOkRCclYP2ehXfUm89h6HQfWxyK7U6DPULYRd1hxyWq3hlM9EYFQsqvg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(107886003)(356005)(81166007)(2616005)(26005)(186003)(8936002)(6512007)(82310400004)(53546011)(36860700001)(83380400001)(336012)(47076005)(5660300002)(36756003)(40460700003)(86362001)(33656002)(508600001)(2906002)(6486002)(6506007)(70586007)(4326008)(6862004)(8676002)(70206006)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 09:28:17.5698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9c1e90-cd5a-44db-465e-08da0be64c44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4212

SGkgSnVsaWVuLA0KDQo+IE9uIDIyIE1hciAyMDIyLCBhdCAxMDoxNiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDIyLzAzLzIwMjIgMDg6
NDcsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+Pj4gT24gMjIgTWFy
IDIwMjIsIGF0IDA5OjM1LCBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5j
b20+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEp1bGllbiwNCj4+PiANCj4+Pj4gT24gMjEgTWFyIDIw
MjIsIGF0IDE4OjQ0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4g
DQo+Pj4+IEhpIEJlcnRyYW5kLA0KPj4+PiANCj4+Pj4gT24gMjEvMDMvMjAyMiAxNzoxOSwgQmVy
dHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiBPbiAyMSBNYXIgMjAyMiwgYXQgMTc6MzYsIEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+PiBTbyBJIGRvbuKAmXQg
a25vdyB3aHkgb24geDg2IHdlIG11c3QgaGF2ZSBjcHUwIGluIGNwdXBvb2wwLCBtYXliZSB4ODYg
bWFpbnRhaW5lciBoYXZlIG1vcmUga25vd2xlZGdlIGFib3V0IHRoYXQgYW5kDQo+Pj4+Pj4+IEkg
Y2FuIHB1dCBhIGNvbW1lbnQgaGVyZS4NCj4+Pj4+PiANCj4+Pj4+PiBPbiBBcm0sIHdlIGFyZSBu
b3QgeWV0IHN1cHBvcnRpbmcgYWxsIHRoZSBDUFUgZmVhdHVyZXMgdGhhdCB4ODYgc3VwcG9ydHMg
KGUuZy4gQ1BVIGhvdHBsdWcsIHN1c3BlbmQvcmVzdW1lLi4uKS4gU28gSSBhIGFtIGJpdCBjb25j
ZXJuZWQgdGhhdCB0aGUgcmVzdHJpY3Rpb24gaXMganVzdCBub3QgdGhlcmUgeWV0IChvciBwb3Nz
aWJseSBoaWRkZW4pLg0KPj4+Pj4+IA0KPj4+Pj4+IFRoZXJlZm9yZSwgYmVmb3JlIGxpZnRpbmcg
dGhlIHJlc3RyaWN0aW9uIG9uIEFybSAoYW5kIG90aGVyIGFyY2gpLCBJIHdvdWxkIGxpa2UgdXMg
dG8gdW5kZXJzdGFuZCB3aHkgaXQgaXMgbmVjZXNzYXJ5IG9uIHg4Ni4NCj4+Pj4+PiANCj4+Pj4+
PiBXZSBtYXkgbm90IGhhdmUgdGhlIGFuc3dlciBxdWlja2x5LCBzbyBpcyBpdCBnb2luZyB0byBi
ZSBhIHByb2JsZW0gdG8ga2VlcCB0aGUgcmVzdHJpY3Rpb24gb24gQXJtPw0KPj4+Pj4gSSBhbSBv
ayB0byBrZWVwIHRoZSBsaW1pdGF0aW9uIHRvIGhhdmUgZG9tMCBhbHdheXMgcnVubmluZyBvbiBj
cHUwLg0KPj4+Pj4gT25seSBsaW1pdGF0aW9uIEkgY2FuIHNlZSBpcyB0aGF0IG9uIGEgYmlnIGxp
dHRsZSBzeXN0ZW0sIGRvbTAgbmVlZHMgdG8gc3RheSBvbiB0aGUgdHlwZSBvZiBjb3JlIG9mIHRo
ZSBmaXJzdCBib290ZWQgY29yZS4NCj4+Pj4gDQo+Pj4+IFdoZXJlIGRvZXMgdGhpcyBsaW1pdGF0
aW9uIGNvbWUgZnJvbT8NCj4+PiANCj4+PiBJZiBkb20wIG11c3QgcnVuIG9uIGNvcmUwIGFuZCBj
b3JlMCBpcyBMaXR0bGUgdGhlbiB5b3UgY2Fubm90IGJ1aWxkIGEgc3lzdGVtIHdoZXJlIGRvbTAg
aXMgcnVubmluZyBvbiBiaWcgY29yZXMuDQo+Pj4gSWYgdGhlIGxpbWl0YXRpb24gaXMgbm90IHRo
ZXJlLCB5b3UgY2FuIGJ1aWxkIHN1Y2ggYSBjb25maWd1cmF0aW9uIHdpdGhvdXQgYW55IGRlcGVu
ZGVuY3kgdG8gdGhlIGJvb3QgY29yZSB0eXBlLg0KPj4gVGhpcyBtaWdodCBub3QgYmUgY29tcGxl
dGVseSBjbGVhciBzbyBsZXQgbWUgcmVwaHJhc2U6DQo+PiBJbiB0aGUgY3VycmVudCBzeXN0ZW06
DQo+PiAtIGRvbTAgbXVzdCBydW4gb24gY3B1cG9vbC0wDQo+IA0KPiBJIGRvbid0IHRoaW5rIHdl
IG5lZWQgdGhpcyByZXN0cmljdGlvbi4gSW4gZmFjdCwgd2l0aCB0aGlzIHNlcmllcyBpdCB3aWxs
IGJlY29tZSBtb3JlIGEgcHJvYmxlbSBiZWNhdXNlIHRoZSBjcHVwb29sIElEIHdpbGwgYmFzZWQg
b24gaG93IHdlIHBhcnNlIHRoZSBEZXZpY2UtVHJlZS4NCj4gDQo+IFNvIGZvciBkb20wLCB3ZSBu
ZWVkIHRvIHNwZWNpZnkgZXhwbGljaXRlbHkgdGhlIGNwdXBvb2wgdG8gYmUgdXNlZC4NCj4gDQo+
PiAtIGNwdXBvb2wtMCBtdXN0IGNvbnRhaW4gdGhlIGJvb3QgY29yZQ0KPj4gLSBjb25zZXF1ZW5j
ZTogZG9tMCBtdXN0IHJ1biBvbiB0aGUgYm9vdCBjb3JlDQo+PiBJZiBib290IGNvcmUgaXMgbGl0
dGxlLCB5b3UgY2Fubm90IGJ1aWxkIGFzIHN5c3RlbSB3aGVyZSBkb20wIHJ1bnMgb25seSBvbiB0
aGUgYmlnIGNvcmVzLg0KPj4gUmVtb3ZpbmcgdGhlIHNlY29uZCBsaW1pdGF0aW9uICh3aGljaCBp
cyBub3QgcmVxdWlyZWQgb24gYXJtKSBpcyBtYWtpbmcgaXQgcG9zc2libGUuDQo+IA0KPiBJTUhP
IHJlbW92aW5nIHRoZSBzZWNvbmQgcmVzdHJpY3Rpb24gaXMgYSBsb3QgbW9yZSByaXNreSB0aGFu
IHJlbW92aW5nIHRoZSBmaXJzdCBvbmUuDQoNClNvIGtlZXBpbmcgYm9vdCBjb3JlIGluIGNwdXBv
b2wtMCBidXQgYWxsb3cgRG9tLTAgdG8gYmUgaW4gYW55IHBvb2wuDQpJbnRlcmVzdGluZywgd2Ug
d2lsbCBjaGVjayB0aGF0Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

