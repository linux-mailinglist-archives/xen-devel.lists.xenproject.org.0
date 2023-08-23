Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B97784E5A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 03:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588852.920473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYcsu-0002Nt-3X; Wed, 23 Aug 2023 01:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588852.920473; Wed, 23 Aug 2023 01:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYcst-0002Ly-VO; Wed, 23 Aug 2023 01:42:11 +0000
Received: by outflank-mailman (input) for mailman id 588852;
 Wed, 23 Aug 2023 01:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iGE6=EI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYcst-0002Ls-99
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 01:42:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe02::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43a073e5-4156-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 03:42:08 +0200 (CEST)
Received: from AS9PR06CA0201.eurprd06.prod.outlook.com (2603:10a6:20b:45d::19)
 by DB5PR08MB10234.eurprd08.prod.outlook.com (2603:10a6:10:4a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 01:42:01 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::48) by AS9PR06CA0201.outlook.office365.com
 (2603:10a6:20b:45d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Wed, 23 Aug 2023 01:42:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Wed, 23 Aug 2023 01:42:00 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Wed, 23 Aug 2023 01:42:00 +0000
Received: from b6bfc4a4b323.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 887A00BA-FC09-4D4B-8B09-B7CD03AB548D.1; 
 Wed, 23 Aug 2023 01:41:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6bfc4a4b323.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Aug 2023 01:41:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 01:41:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 01:41:51 +0000
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
X-Inumbo-ID: 43a073e5-4156-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+N+nKzBgAS5utOMHckaYI2DSxktHRan19Jlv1A2XEM=;
 b=hYIFzu/X2RmWri6lSbeJuQGITFTwCHi1uZGt4c96GDKXMk1k4wl0qqFc3sduGj/H1fxYmMy/u07Wav4/KI/FDODcBAsuDUuhqetc0zfKyUpT9N5Q6HgRkNX3sxPp7Murl0l8cTJWlNh09uql37+Da4fcA30kBoms9dX83iryv/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5a52d4831b6ce26
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF0NaH9RQ4RpaXtRtFWQtM09s3Q3CSOljaJB6mqosDp23yF8RxJDqHfCLjZYxXlBWVzcXGwkidtIim35w81F8CQNGkkBktp8Hh39gnSwxDvbKT/hctouRhm/BMXadSEK/bax4sjk22R/4y37sQe2x/xazOxGuo9SKJf4TRaV31OlEHXkWFmKaTziYBbqIYv7cah1ME8AODb/b00wYzz3Rw0IkJPiNh/rXJtO0n1Hot2wyvHUarSBjik6C41D467Xj0oRj7+u3io2BIEep7u93H/Yo4UiyfMX+brov9nAFBAno5ONpsaZjYg8HQIE8StLcMBCJwTh2IGQ/2hLdWnV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+N+nKzBgAS5utOMHckaYI2DSxktHRan19Jlv1A2XEM=;
 b=eff0iikyVLN/BQ0AVgDHizGQFsgg3r2ULuUQz6WmE+aMUSOEavXWNwaGD/AHYrLZIJVlu8YJiNugJ6T7WMez7WPpAeZx3YiLh5rS9RGZ54C2Z3dO0yCojjXoED6B6S2zuOs0QTx4gou0VWCQ9FJP/O6G3NZKjvt2+JRPTDBB9jNRHvT9yKwUTBrLERaoadNU9UFuN4bLNW9mPYiqBw+P92eRiB8JjypgpgwwKEkxOVDQDlCz2TebNZSRQdoQIDl2+AdGDMql4kjdNi1ImxgzRXRwBKHdc3SpZAU8lC+Mn6MNWEvCv764weG1UZ6PePyAbq7D1A/rdiPsuHPlrXzTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+N+nKzBgAS5utOMHckaYI2DSxktHRan19Jlv1A2XEM=;
 b=hYIFzu/X2RmWri6lSbeJuQGITFTwCHi1uZGt4c96GDKXMk1k4wl0qqFc3sduGj/H1fxYmMy/u07Wav4/KI/FDODcBAsuDUuhqetc0zfKyUpT9N5Q6HgRkNX3sxPp7Murl0l8cTJWlNh09uql37+Da4fcA30kBoms9dX83iryv/o=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 11/13] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Topic: [PATCH v5 11/13] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Index: AQHZzmeLeyiYpsCVck6zI0bQS/LJfq/2qHQAgACAqQA=
Date: Wed, 23 Aug 2023 01:41:51 +0000
Message-ID: <AD09B38F-EE24-4163-8443-B6A86550F24D@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-12-Henry.Wang@arm.com>
 <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
In-Reply-To: <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB5895:EE_|AM7EUR03FT036:EE_|DB5PR08MB10234:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad7808a-fdae-4c98-764b-08dba37a2518
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2/3H2UF/Oii2tMyszUfTeZJ6FXlrkGcRbJCGEn0ieRlwzAJVNVBTWnuOqrsjtVxWXZhpBWz+hnPhkw77r0CTeAr5qQa0PZ8/8MKSrtTOvbHlBqMzcIgJ0T9mwE3H86KGDIiiJGhmFBoeZXIn+2y1PI8qP+jbNX1ZJlPe1CrqZ01IMGyaQxvtkjo2ZsgKDphWSbwo/z9+20VmAlA/3hFKOIiX7hwPZTeoLFuF+O3q0urvuHkZQBeTZxVsMyFb8ggIn2Zmz6m5Qe58/kcfcSc0khI636h6kBag5Amz2Z5cYOGXsnhvCJ85C6T0797K61fel4Ahema6ERoz5p7Fxw3eS1Mn0Sk03Ah6+9ZHgPsmPN8mPu3IqbmSKZ+rYyLtAZEUeKnR7udsOWzJbHiSIKsVBu8NpE/Io9zLnFK3tb/L7HpeV8sOKcsxnDJQ79Rv7tKgqfFi0TGEPgtxL1DLN6J0tIuwPG5CVh/KcljJnXC1SVhsuVylh84DolMKW2A9YIG5Twibt5qEO2BmZf5/WIqLjasVqkDGDRO+vF8R0ZmqhPzCq3m/PVZQWiabvkRc2cqmGdrZXZC87JVYxBiDjuEsQMIhYfZXnap0vhSHHvVnK2yzzddcxRLE75pT/5H44zl8jfNZ0yvlh0368HyCGO5Gwg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(76116006)(54906003)(6916009)(66476007)(66556008)(66446008)(66946007)(6512007)(64756008)(316002)(66899024)(91956017)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(122000001)(71200400001)(38100700002)(38070700005)(6486002)(6506007)(53546011)(83380400001)(2906002)(86362001)(5660300002)(26005)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <812B2FA41321BC4F945EC09D35FAAB1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5895
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bdda8f23-5636-48f1-240e-08dba37a1f9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JhNLglgeON8AuLZvM6AgfEEQ0d2a5dq9kUHI/3eEG/RYptUzxllj8xu701VSanCME1Z/Jb5MnPGWqh+ngaWs/7SIWnrY2bPlsUmYr46Lq24SRpVX7A0FhvFecLUnEJpgOnDSe4FYaV5ESxWb6VSeYXgGBfPkjLlbvj0dBJfSGLOnHaeyBvjsV5rJ8GLLgOhPZv6d1s8E8m/WASGibElNGYQ+e3dydW+VlITWOKkWY2oJG39Ll5iPzOK5aOJaxGNIC0NmMpOKgsWjlX1gwS7LunkOVtoOgzzMMFS+LLB2JdkPm4nv3QavuA4BGQKwHEU9NHi96zA9rE0eVxEiYg4B2jBV+zTOFRLnq/JuEBvXgJbon3G56GT/QUyeb/VwbuX4wuyiMBs3lFSp3rB7GHV5q8JFX0ZG6BTi5kI55ExLlqfVA2pC4GWfXNUhD+Ii/+Sj9pi1SJJRH/hoXetKjWrER7SlpaABuF65QuxSlOu9avQ1KKTBxESK7akxw3z+/rDzmy9GOQ01Cakdh1nr4GbdiyV9JUFYQx98WDrLcik6dEbj3J2IKuL+TD0uscNIvXPxeLab3lsT1DZPxwwcwNu/BAl+vkj8vw0eLjAke1s3A2AprQC6FuYkbRsv/kADPNMPLg3TITSMqy74eMrK8wTucl9PpmQj7Jmg76gGAl0aHb7ffU1aeq+/87Lek/I072u1IUU24bAqORBtf1tCAyFSTRkCnDXJGsWwVtkLN7WCfVRjzyESyuPLq9sZh3EVkIdH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39850400004)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(8676002)(40460700003)(8936002)(4326008)(6862004)(66899024)(5660300002)(2616005)(82740400003)(86362001)(356005)(81166007)(36860700001)(336012)(6512007)(26005)(53546011)(6506007)(41300700001)(47076005)(83380400001)(478600001)(6486002)(70206006)(33656002)(316002)(54906003)(70586007)(40480700001)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 01:42:00.6129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad7808a-fdae-4c98-764b-08dba37a2518
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10234

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyAyMywgMjAyMywgYXQgMDI6MDEsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAxNC8wOC8y
MDIzIDA1OjI1LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gRnJvbTogUGVubnkgWmhlbmcgPHBlbm55
LnpoZW5nQGFybS5jb20+DQo+PiBDdXJyZW50IFAyTSBpbXBsZW1lbnRhdGlvbiBpcyBkZXNpZ25l
ZCBmb3IgTU1VIHN5c3RlbSBvbmx5Lg0KPj4gV2UgbW92ZSB0aGUgTU1VLXNwZWNpZmljIGNvZGVz
IGludG8gbW11L3AybS5jLCBhbmQgb25seSBrZWVwIGdlbmVyaWMNCj4+IGNvZGVzIGluIHAybS5j
LCBsaWtlIFZNSUQgYWxsb2NhdG9yLCBldGMuIFdlIGFsc28gbW92ZSBNTVUtc3BlY2lmaWMNCj4+
IGRlZmluaXRpb25zIGFuZCBkZWNsYXJhdGlvbnMgdG8gbW11L3AybS5oLCBzdWNoIGFzIHAybV90
bGJfZmx1c2hfc3luYygpLg0KPj4gQWxzbyBleHBvc2UgcHJldmlvdXNseSBzdGF0aWMgZnVuY3Rp
b25zIHAybV92bWlkX2FsbG9jYXRvcl9pbml0KCksDQo+PiBwMm1fYWxsb2Nfdm1pZCgpLCBfX3Ay
bV9zZXRfZW50cnkoKSBhbmQgc2V0dXBfdmlydF9wYWdpbmdfb25lKCkNCj4gDQo+IExvb2tpbmcg
YXQgdGhlIGNvZGUsIGl0IHNlZW1zbSB0aGF0IHlvdSBuZWVkIHRvIGtlZXAgZXhwb3NlIF9fcDJt
X3NldF9lbnRyeSgpIGJlY2F1c2Ugb2YgcDJtX3JlbGlucXVpc2hfbWFwcGluZygpLiBIb3dldmVy
LCBpdCBpcyBub3QgY2xlYXIgaG93IHRoaXMgY29kZSBpcyBzdXBwb3NlZCB0byB3b3JrIGZvciB0
aGUgTVBVLiBTbyBzaG91bGQgd2UgaW5zdGVhZCBmcm9tIHAybV9yZWxpbnF1aXNoX21hcHBpbmco
KSB0byBtbXUvcDJtLmM/DQoNClN1cmUsIEkgd2lsbCB0cnkgdGhhdC4NCg0KPiANCj4gT3RoZXIg
ZnVuY3Rpb25zIHdoaWNoIGRvZXNuJ3Qgc2VlbSB0byBtYWtlIHNlbnNlIGluIHAybS5jIGFyZToN
Cj4gICogcDJtX2NsZWFyX3Jvb3RfcGFnZXMoKTogQUZBSVUgdGhlcmUgaXMgbm8gY29uY2VwdCBv
ZiByb290IGluIHRoZSBNUFUuIFRoaXMgYWxzbyBtZWFucyB0aGF0IHdlIHBvc3NpYmx5IHdhbnQg
dG8gbW92ZSBvdXQgYW55dGhpbmcgc3BlY2lmaWMgdG8gdGhlIE1NVSBmcm9tICdzdHJ1Y3QgcDJt
Jy4gVGhpcyBjb3VsZCBiZSBkb25lIHNlcGFyYXRlbHkuDQo+ICAqIHAybV9mbHVzaF92bSgpOiBU
aGlzIGlzIGJ1aWx0IHdpdGggTU1VIGluIG1pbmQgYXMgd2UgY2FuIHVzZSB0aGUgcGFnZS10YWJs
ZSB0byB0cmFjayBhY2Nlc3MgcGFnZXMuIFlvdSBkb24ndCBoYXZlIHRoYXQgZmluZSBncmFudWxh
cml0eSBpbiB0aGUgTVBVLg0KDQpJIGFncmVlLCB3aWxsIGFsc28gbW92ZSB0aGVzZSB0byBtbXUv
IGluIHY2Lg0KDQo+IA0KPj4gZm9yIGZ1dGhlciBNUFUgdXNhZ2UuDQo+IA0KPiB0eXBvOiBmdXRo
ZXIvZnVydGhlci8NCg0KVGhhbmtzLCB3aWxsIGZpeC4NCg0KPiANCj4+IFdpdGggdGhlIGNvZGUg
bW92ZW1lbnQsIGdsb2JhbCB2YXJpYWJsZSBtYXhfdm1pZCBpcyB1c2VkIGluIG11bHRpcGxlDQo+
PiBmaWxlcyBpbnN0ZWFkIG9mIGEgc2luZ2xlIGZpbGUgKGFuZCB3aWxsIGJlIHVzZWQgaW4gTVBV
IFAyTQ0KPj4gaW1wbGVtZW50YXRpb24pLCBkZWNsYXJlIGl0IGluIHRoZSBoZWFkZXIgYW5kIHJl
bW92ZSB0aGUgInN0YXRpYyIgb2YNCj4+IHRoaXMgdmFyaWFibGUuDQo+PiBBZGQgI2lmZGVmIENP
TkZJR19IQVNfTU1VIHRvIHAybV93cml0ZV91bmxvY2soKSBzaW5jZSBmdXR1cmUgTVBVDQo+PiB3
b3JrIGRvZXMgbm90IG5lZWQgcDJtX3RsYl9mbHVzaF9zeW5jKCkuDQo+IA0KPiBBbmQgdGhlcmUg
YXJlIG5vIHNwZWNpZmljIGJhcnJpZXIgcmVxdWlyZWQ/IE92ZXJhbGwsIEkgYW0gbm90IHN1cmUg
SSBsaWtlIHRoZSAjaWZkZWYgcmF0aGVyIHRoYW4gcHJvdmlkaW5nIGEgc3R1YiBoZWxwZXIuDQoN
CkkgdGhpbmsgZm9yIE1QVSBzeXN0ZW1zIHdlIGRvbuKAmXQgbmVlZCB0byBmbHVzaCB0aGUgVExC
LCBoZW5jZSB0aGUgI2lmZGVmLiBEbyB5b3UgbWVhbiB3ZSBzaG91bGQNCnByb3ZpZGUgYSBzdHVi
IGhlbHBlciBvZiBwMm1fdGxiX2ZsdXNoX3N5bmMoKSBmb3IgTVBVPyBJZiBzbyBJIHRoaW5rIG1h
eWJlIHRoZSBuYW1pbmcgb2YgdGhpcyBzdHViDQpoZWxwZXIgaXMgbm90IHJlYWxseSBpZGVhbD8N
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSWYgdGhlIG90aGVyIGxpa2UgdGhlIGlk
ZWEgb2YgdGhlICNpZmRlZi4gSSB0aGluayBhIGNvbW1lbnQgb24gdG9wIHdvdWxkIGJlIG5lY2Vz
c2FyeSB0byBleHBsYWluIHdoeSB0aGVyZSBpcyBub3RoaW5nIHRvIGRvIGluIHRoZSBjb250ZXh0
IG9mIHRoZSBNUFUuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoN
Cg==

