Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A378F39B12C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 06:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136677.253306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp11A-0007tn-7z; Fri, 04 Jun 2021 04:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136677.253306; Fri, 04 Jun 2021 04:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp11A-0007rw-4d; Fri, 04 Jun 2021 04:01:08 +0000
Received: by outflank-mailman (input) for mailman id 136677;
 Fri, 04 Jun 2021 04:01:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CJS=K6=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lp118-0007rq-NF
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 04:01:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6494481e-744c-463d-a43e-1b7f34ddf92f;
 Fri, 04 Jun 2021 04:01:04 +0000 (UTC)
Received: from AM6PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:20b:2e::17)
 by AM4PR08MB2883.eurprd08.prod.outlook.com (2603:10a6:205:9::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Fri, 4 Jun
 2021 04:01:02 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::e2) by AM6PR05CA0004.outlook.office365.com
 (2603:10a6:20b:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Fri, 4 Jun 2021 04:01:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Fri, 4 Jun 2021 04:01:02 +0000
Received: ("Tessian outbound a5ae8c02e74f:v93");
 Fri, 04 Jun 2021 04:01:02 +0000
Received: from 889749a9838a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EE767B7C-5E8F-4308-A66A-B59D31796660.1; 
 Fri, 04 Jun 2021 04:00:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 889749a9838a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Jun 2021 04:00:55 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4752.eurprd08.prod.outlook.com (2603:10a6:802:a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 04:00:48 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4195.023; Fri, 4 Jun 2021
 04:00:47 +0000
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
X-Inumbo-ID: 6494481e-744c-463d-a43e-1b7f34ddf92f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkqWtVYJ30BWp+L9Leb4awSw7mxYMDTgQ18YuCPzsxA=;
 b=DAzVQqpCorNTspy/JT+wdU2OZaEvCZFqiNBjcqFl1FwSeQDFzc3L+NMPlORz1xC9GB3uoGfyv+aJf+H7G/kQ6BENX3Yxv2UdOXhP+Ursw2VC37UteOLCePGZW0PpS4fIuNs0beZp7JbZ1G9TktfcBHAEtZ/SjvQiC5M6zyOz5jA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRy3ZGUR3QoVgwGpp9ZBUw/2bud3qddgOO4tR/abwsrPbgQpW/ZIusU16Er6QkxJKfkieESpf1XV2v4FpygUP0UonL6lNfPTL9ErmLKYIFpgUJ5BQP80r5tFca8RjufaPmcM5SoBlW26LJUmqBTr4TJeplOlbqV6L0k9fZ+br6vpjcqyKk+CFjwfW+Son0IxOpBm9nvcmV3SLiRa2mv6YyIKSaENmAZKsYGT8W955zcA8+ecYG2GyuDeVtYB5z3aW7j2Jos1f8j6Io3DZtLVF/BFiRGn8Xdl1gnQpPVnwrDRoV1fKIGr5m1DrtKGNLNpE9BECinRIKo7rSkm2hD1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkqWtVYJ30BWp+L9Leb4awSw7mxYMDTgQ18YuCPzsxA=;
 b=jcbtWaH5QLxiik80+U5P45ijb3nvjM5wIBthuQXMk0QsOiuJi0XrWuUzOmKtL5n+/QWCQxTK92uY4mgpfSjBpDlVvKZZ7gBVyaLjyUONDEUbmViflb3GoxmP0IqR9MhZ2KyxbVKLIJEJDewkhXCtQ+MODMkN4L7f0j9fOS3RwA5NhlatAqHmo5QAIdGza7Dzv1xtVVZaiBH+sOG8ZA7a6po0TWVYjp/Mut46T2XQK5jPf3e6SQArO38xJcRRkZpPfv5IjbUApCtIeZ02CMWjRRhEBY4HbnPZXlolMqbvV76tw/g4yK2QdpLuYhTypS1k7uj0xpLUvSNIFhX2gFJ6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkqWtVYJ30BWp+L9Leb4awSw7mxYMDTgQ18YuCPzsxA=;
 b=DAzVQqpCorNTspy/JT+wdU2OZaEvCZFqiNBjcqFl1FwSeQDFzc3L+NMPlORz1xC9GB3uoGfyv+aJf+H7G/kQ6BENX3Yxv2UdOXhP+Ursw2VC37UteOLCePGZW0PpS4fIuNs0beZp7JbZ1G9TktfcBHAEtZ/SjvQiC5M6zyOz5jA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien.grall.oss@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, nd
	<nd@arm.com>
Subject: RE: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Topic: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Index:
 AQHXS6WvvFnJG9tHGECWPMZXor2qraro8JyAgAAPtYCAAiGdAIAAuwwggAA2KACAFH+QgIABhnKAgADPmoCAAAmNAIAAHmCAgAAx6vA=
Date: Fri, 4 Jun 2021 04:00:47 +0000
Message-ID:
 <VE1PR08MB52151410985CD8E5C577F797F73B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
 <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
 <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
 <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
 <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 701A0E4B7CD1864BABCED0B75633EBD3.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: faff3761-b166-4b1d-431c-08d9270d5e78
x-ms-traffictypediagnostic: VE1PR08MB4752:|AM4PR08MB2883:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2883DB0B7E87D3D78CE28D12F73B9@AM4PR08MB2883.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EM+LbMu5GUZuoDJwNu/S1QC9Oi60deNycHfggJa8AuoZ6+1xfXh5nEs177BoLD8MqzIPy14FJjgGJ1w/amLDXMPn90649q9O2CnPpnyWMeodA2PMiT0cNNWQR/dwLREGdeRrFX2iTDHlO+w75hu+kEoYamh5XSl0Nf6n80j1n9JsqzvYZNHi3ZHb7tlxE1lnbfEeSwFyk7vQ96DGXc3aw3xuYIoHB4ZLxk2u4g1vipeWGxJmjKWBxBOosSfTWZJqf/aejgVPfET4oxMJn+USapffM98pKAkT00QKby6gsOiXTqre9r9bsnuUJfJcdoJ73EXfTOAuC5fWYxxsPqaTBPqZ8tovudwN58Qsf478Dmdfmfu0Ue1HOGDB0TITUv+n81VZpfvhqAAcjuRkuSk/a4VZ7WQOzL4CIqYmIqsJswLmiLvnLaVKQLP/l9qCedGh3+nxeQatD2xpX9WnrNDKK2c09Ox91ccElRdF+nOJ80qvIf9V4eUzAno8uNgRAyBEY5yyarQ4XTClIzreJa005XaWBIO5I40jVo8PwXN7KYcaZx768YhzXzLIp4RLgLSZ5nLLQVvNA6nzt2JYlfuzR29amVzUAlDjUK3Tlqx8jZD/EjmkubAk1eTMlW9s6wL9MSjC/7BUlgTpm35CZwpURVM4aHDG3fK7n5MaXRa+F6BE+AqKRfvXDyKSNIkWX3A7N5fXgS8W/xaWPWJrueAYKnMBRckhmsXXlDZ9PWGUFd8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(66476007)(66556008)(86362001)(8936002)(9686003)(66946007)(110136005)(66446008)(966005)(54906003)(64756008)(52536014)(38100700002)(26005)(478600001)(55016002)(83380400001)(76116006)(2906002)(7696005)(6506007)(8676002)(5660300002)(186003)(122000001)(4326008)(316002)(33656002)(71200400001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?VjBRaGRhUEwzTHZFRTMvbmdBMzU1clUxRCsvWDdMODlCUVN3eVZ0ZHFLVUQ2?=
 =?utf-8?B?Y0RTWkovQ0RjaGJ4TkR3UE1OOEJiZEdIQWNWajdhTFJjRytBTHFMY1dqVnJp?=
 =?utf-8?B?eXR1YzNZTkYxOWt6R04yR0QweU5ScjZBakNvbE1EMkkwS1I5NXNFbTZ6OE1Z?=
 =?utf-8?B?MFVLT0FLV050NjJONDlSSyt3a2lNcFduTE1wOG1ZL3VCb2FRSVVLdkNlNi9x?=
 =?utf-8?B?MnUzdTNxMjZkM0p3dmQwckhUTmNUZU4xRGtiVUVES0VtbzdWdnRWYlVOQUdN?=
 =?utf-8?B?TVpYWUx1RXF3YnRqYmlmMUV0blljMnVtblVjbEFmdUFzUkR5RU1uYzhhZVRV?=
 =?utf-8?B?Rm1WSWM2RkxXUWtZWnNlVUNhNHN5N0x1RWU2T1E2aWxGcnZvVWs5S01KRFJP?=
 =?utf-8?B?ckNNdTN1T25iMjV0b3RDdVFmSGNWQTVvQ2pEUm53N0ZhVTg2YjU0RVM2d0Q1?=
 =?utf-8?B?SWFBTmIyZDcvQTBNQk1ieU5IV0V2YU9Zd3VlOGVPcEZDREduTDFkZk1zMmlj?=
 =?utf-8?B?TzFwTzlkMUdLenQ3Y0t4YXoxRXZ0RU5GVEhVRS9PSEhwOWF5VUF0eFJCVVpT?=
 =?utf-8?B?UmIwMjZyNUdkclgxN2RFcmRZall5WXB0a05ZOVpoVUNGRE1qT0NuYjI0RXI3?=
 =?utf-8?B?S1VCa3dmYklPVUMrNXZEZExIRmVkV3NBUGJ1MFFuNUR5SFViOERrenU5aDlj?=
 =?utf-8?B?VG11bTRLTERjZi93N1BydHI0UmRLb0VPdTB1TWNuV01ZdllRY1A3aUU2U2c3?=
 =?utf-8?B?WEdoeUtBbjUvZEJ6L0NEaU5ZOTZlUWFGQVZqRVdnek80blg4RDFHQWpkd2t3?=
 =?utf-8?B?UXVydFd3REd5WmlGQW1wbnlCMDhWYUZ0QmpoUmVtYW5vUGRxcXZBcU1Jb3U0?=
 =?utf-8?B?VHlPSkg3WTUxUGVWczI5UjlHNGdzZkx6QkQzdExEUWRTRWREZUFpMU43cVBL?=
 =?utf-8?B?RHIwVjBkZW9Qc3dZSnorMmUwT3dNR2FmQlNpK1VpZGFuWmJWVUYraUZQOStS?=
 =?utf-8?B?SVhPL1Y0RnE2OVBzamV1SXZsVlp0VHpWbjZmWXVLVm0wMGoxaHc0RnpMSmJ6?=
 =?utf-8?B?eUlQa2pzZStQZmNRYWdaNmFaUmx4dFZGQkxGclNZMW45TWlLNmFvc3hNQWFS?=
 =?utf-8?B?alVvaW4zTVBjdVNxZnVrdFZYdnZTenlOQjUwb1FFa083YnRtb1R0VEdxMUlj?=
 =?utf-8?B?YWVUa2lGVmRlYjROcnBGZWZrbmZkVGFacTVVajI0QlVKMFo2SFR5dXBsR2xJ?=
 =?utf-8?B?amc4OGsrOHRkMkZIdUwvcFcwTVBwN3hQdGhOTEFHdjJDV1pDVEhuczVCc0sv?=
 =?utf-8?B?S2RkeWZUbDMvcm9xY1hQNGtkblk1WEVvTjl4TjgzcW1DMU52MXA5N1Bwak91?=
 =?utf-8?B?cW9CN2dpMWVtVFd2TGNQajJPck9TY1p3OWhVajR3dkF4ZjVQRmU2NGVXOUNZ?=
 =?utf-8?B?UGZOL0VmM290ZlRNdTd5NVVOY2dLQzcyM291WkxXVEkxa1RmVTgvMU9tazVy?=
 =?utf-8?B?bXgyUjdGTTZsdHlxMzkxQXlaL1pzY1JxZ0FHdEswR3lhd2VkaVI1T0xaNzhV?=
 =?utf-8?B?MWhhOHhVeG9KSTFmUjRjSTBoRkpFRWJuc1ZoUkpQMEptaWRMZm95Q283UzhG?=
 =?utf-8?B?SGNGNlhoemdCVWtUMSs4RWNHT2NuR256ejVmNkN5V2RoNG5LOTBYZ1UyZytu?=
 =?utf-8?B?ZjBseEpkdU1YT201YjRYR3FZbVA4UE9uYVRmU3RIemp3MG51NVVXZkl5NjFT?=
 =?utf-8?Q?qulpxj3AVdKU8O71iZv00akS6CrOQXjHqcLwdb0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5af8aa1d-e8cc-4d63-89ea-08d9270d55e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TibYq7Se67dFD/Rpw6omLKww2BxwuFs5kXdNeGwQMbK4b9TPz6OstZGWfFhzshRDChYEBo/zlHHN4Xn5v8u4/BvQScCCv2ziaq29RsRim9RdxhBMC3E0NP08iJhEyWiwfhjLarmQ2IExikqFIjhytmExjekCxdUDhNCNv7V/X1s5sg4Qa20xkxGsgZ0hRaADrtr+IyW/ZNeuwhJ9eFoJoEnRK7ftHVJbidjXpuMkXYXgW2QSLmLjt7/kOt6F0jKtr/G8imxohvyaLEMZbp02KwsZo6qGAriPxFQ3ud/zYZEXLqE2hBPjPalLTIQgypnJd4po/59hsSWL6ULOktVeKncAEiDoZUfc6Mv6cRBIlxvZbjP+sgokUbfLUpCEjFveVxpUfNi5yqwTqN8SL28hYE3+qwinIgjPYJjIC3UL1061P+cixT8s+s+EH3LtWeFNTJvB1DX/nh63C4IANKlh54AwPNEUirnbOZ7hOq+KLHbqDBnv/U8NWCN4on1+mVX78t9Nt3+4mlbt1FSErUgEfTtrDjsalZGTx2uAymjvRazVPysfxjqCSAjfVdAoI/FFoKx3X4dsskyUAhXrcifKI3raLoNtPJ+3CNRoPu+rjbp8OfaLTAT+FnRfpAfd/smtxTuJgTxlcrP6h6XCfu6R8jcDrHa2QBgiEnuS4VYkzC8WhOEKC4nZreCCTMhzJvSOyD6ojMFsIaPVkJctoOLAwCOwPCxt8X10ih/hpQG4uX+U5nmwdUUDC0tFIszZaynDEDhYstfUr3xJSsDgcgwctlaoy0NWOpHg8rN9WYhAzOmtgt7DK+Vh7OBdBl1+OPtN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(346002)(396003)(46966006)(36840700001)(966005)(336012)(82740400003)(81166007)(186003)(83380400001)(8936002)(36860700001)(4326008)(8676002)(86362001)(110136005)(53546011)(70586007)(70206006)(26005)(47076005)(9686003)(55016002)(5660300002)(2906002)(356005)(33656002)(7696005)(6506007)(478600001)(52536014)(316002)(54906003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 04:01:02.1924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faff3761-b166-4b1d-431c-08d9270d5e78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2883

SGkgc3RlZmFubyBhbmQganVsaWVuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2Vu
dDogRnJpZGF5LCBKdW5lIDQsIDIwMjEgNzo1NiBBTQ0KPiBUbzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGwub3NzQGdtYWlsLmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IFBlbm55IFpoZW5nDQo+IDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IG5kDQo+
IDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAxLzEwXSB4ZW4vYXJtOiBpbnRy
b2R1Y2UgZG9tYWluIG9uIFN0YXRpYyBBbGxvY2F0aW9uDQo+IA0KPiBPbiBUaHUsIDMgSnVuIDIw
MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiBPbiBUaHUsIDMgSnVuIDIwMjEgYXQgMjI6MzMs
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gd3JvdGU6DQo+
ID4gPiBPbiBUaHUsIDMgSnVuIDIwMjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiA+ID4gT24g
MDIvMDYvMjAyMSAxMTowOSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gPiA+ID4gSSBjb3VsZCBu
b3QgdGhpbmsgYSB3YXkgdG8gZml4IGl0IHByb3Blcmx5IGluIGNvZGVzLCBkbyB5b3UgaGF2ZQ0K
PiA+ID4gPiA+IGFueSBzdWdnZXN0aW9uPyBPciB3ZSBqdXN0IHB1dCBhIHdhcm5pbmcgaW4gZG9j
L2NvbW1pdHMuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBjb3JyZWN0IGFwcHJvYWNoIGlzIHRvIGZp
bmQgdGhlIHBhcmVudCBvZiBzdGF0aWNtZW1kb21VMSAoaS5lLg0KPiA+ID4gPiByZXNlcnZlZC1t
ZW1vcnkpIGFuZCB1c2UgdGhlICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscyBmcm9tIHRo
ZXJlLg0KPiA+ID4NCj4gPiA+IEp1bGllbiBpcyByaWdodCBhYm91dCBob3cgdG8gcGFyc2UgdGhl
IHN0YXRpYy1tZW1vcnkuDQo+ID4gPg0KPiA+ID4gQnV0IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gb24g
dGhlIG5ldyBiaW5kaW5nLiBUaGUgL3Jlc2VydmVkLW1lbW9yeQ0KPiA+ID4gbm9kZSBpcyBhIHdl
aXJkIG5vZGU6IGl0IGlzIG9uZSBvZiB0aGUgdmVyeSBmZXcgbm9kZSAodGhlIG9ubHkgbm9kZQ0K
PiA+ID4gYXNpZGUgZnJvbQ0KPiA+ID4gL2Nob3Nlbikgd2hpY2ggaXMgYWJvdXQgc29mdHdhcmUg
Y29uZmlndXJhdGlvbnMgcmF0aGVyIHRoYW4gaGFyZHdhcmUNCj4gPiA+IGRlc2NyaXB0aW9uLg0K
PiA+ID4NCj4gPiA+IEZvciB0aGlzIHJlYXNvbiwgaW4gYSBkZXZpY2UgdHJlZSB3aXRoIG11bHRp
cGxlIGRvbWFpbnMNCj4gPiA+IC9yZXNlcnZlZC1tZW1vcnkgZG9lc24ndCBtYWtlIGEgbG90IG9m
IHNlbnNlOiBmb3Igd2hpY2ggZG9tYWluIGlzIHRoZQ0KPiBtZW1vcnkgcmVzZXJ2ZWQ/DQo+ID4N
Cj4gPiBJSE1PLCAvcmVzZXJ2ZWQtbWVtb3J5IHJlZmVycyB0byB0aGUgbWVtb3J5IHRoYXQgdGhl
IGh5cGVydmlzb3Igc2hvdWxkDQo+ID4gbm90IHRvdWNoLiBJdCBpcyBqdXN0IGEgY29pbmNpZGVu
Y2UgdGhhdCBtb3N0IG9mIHRoZSBkb21haW5zIGFyZSB0aGVuDQo+ID4gcGFzc2VkIHRocm91Z2gg
dG8gZG9tMC4NCj4gPg0KPiA+IFRoaXMgYWxzbyBtYXRjaGVzIHRoZSBmYWN0IHRoYXQgdGhlIEdJ
QywgL21lbW9yeSBpcyBjb25zdW1lZCBieSB0aGUNCj4gPiBoeXBlcnZpc29yIGRpcmVjdGx5IGFu
ZCBub3QgdGhlIGRvbWFpbi4uDQo+IA0KPiBJbiBzeXN0ZW0gZGV2aWNlIHRyZWUgb25lIG9mIHRo
ZSBrZXkgcHJpbmNpcGxlcyBpcyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuDQo+IGhhcmR3YXJlIGRl
c2NyaXB0aW9uIGFuZCBkb21haW5zIGNvbmZpZ3VyYXRpb24uIFRoZSBkb21haW5zIGNvbmZpZ3Vy
YXRpb24NCj4gaXMgdW5kZXIgL2RvbWFpbnMgKG9yaWdpbmFsbHkgaXQgd2FzIHVuZGVyIC9jaG9z
ZW4gdGhlbiB0aGUgRFQgbWFpbnRhaW5lcnMNCj4gcmVxdWVzdGVkIHRvIG1vdmUgaXQgdG8gaXRz
IG93biB0b3AtbGV2ZWwgbm9kZSksIHdoaWxlIGV2ZXJ5dGhpbmcgZWxzZSBpcyBmb3INCj4gaGFy
ZHdhcmUgZGVzY3JpcHRpb24uDQo+IA0KPiAvY2hvc2VuIGFuZCAvcmVzZXJ2ZWQtbWVtb3J5IGFy
ZSBleGNlcHRpb25zLiBUaGV5IGFyZSB0b3AtbGV2ZWwgbm9kZXMgYnV0DQo+IHRoZXkgYXJlIGZv
ciBzb2Z0d2FyZSBjb25maWd1cmF0aW9ucy4gSW4gc3lzdGVtIGRldmljZSB0cmVlIGNvbmZpZ3Vy
YXRpb25zIGdvDQo+IHVuZGVyIHRoZSBkb21haW4gbm9kZS4gVGhpcyBtYWtlcyBzZW5zZTogWGVu
LCBkb20wIGFuZCBkb21VIGNhbiBhbGwgaGF2ZQ0KPiBkaWZmZXJlbnQgcmVzZXJ2ZWQtbWVtb3J5
IGFuZCBjaG9zZW4gY29uZmlndXJhdGlvbnMuDQo+IA0KPiAvZG9tYWlucy9kb21VMS9yZXNlcnZl
ZC1tZW1vcnkgZ2l2ZXMgdXMgYSBjbGVhciB3YXkgdG8gZXhwcmVzcyByZXNlcnZlZC0NCj4gbWVt
b3J5IGNvbmZpZ3VyYXRpb25zIGZvciBkb21VMS4NCj4gDQo+IFdoaWNoIGxlYXZlcyB1cyB3aXRo
IC9yZXNlcnZlZC1tZW1vcnkuIFdobyBpcyB0aGF0IGZvcj8gSXQgaXMgZm9yIHRoZSBkZWZhdWx0
DQo+IGRvbWFpbi4NCj4gDQo+IFRoZSBkZWZhdWx0IGRvbWFpbiBpcyB0aGUgb25lIHJlY2Vpdmlu
ZyBhbGwgZGV2aWNlcyBieSBkZWZhdWx0LiBJbiBhIFhlbiBzZXR0aW5nLA0KPiBpdCBpcyBwcm9i
YWJseSBEb20wLiBJbiB0aGlzIGNhc2UsIHdlIGRvbid0IHdhbnQgdG8gYWRkIHJlc2VydmVkLW1l
bW9yeQ0KPiByZWdpb25zIGZvciBEb21VcyB0byBEb20wJ3MgbGlzdC4gRG9tMCdzIHJlc2VydmVk
LW1lbW9yeSBsaXN0IGlzIGZvciBpdHMgb3duDQo+IGRyaXZlcnMuIFdlIGNvdWxkIGFsc28gbWFr
ZSBhbiBhcmd1bWVudCB0aGF0IHRoZSBkZWZhdWx0IGRvbWFpbiBpcyBYZW4gaXRzZWxmLg0KPiBG
cm9tIGEgc3BlYyBwZXJzcGVjdGl2ZSwgdGhhdCB3b3VsZCBiZSBmaW5lIHRvby4gSW4gdGhpcyBj
YXNlLCAvcmVzZXJ2ZWQtDQo+IG1lbW9yeSBpcyBhIGxpc3Qgb2YgbWVtb3J5IHJlZ2lvbnMgcmVz
ZXJ2ZWQgZm9yIFhlbiBkcml2ZXJzLiAgRWl0aGVyIHdheSwgSSBkb24ndA0KPiB0aGluayBpcyBh
IGdyZWF0IGZpdCBmb3IgZG9tYWlucyBtZW1vcnkgYWxsb2NhdGlvbnMuDQo+IA0KPiANCj4gPiA+
IFRoaXMgd2FzIG9uZSBvZiB0aGUgZmlyc3QgcG9pbnRzIHJhaXNlZCBieSBSb2IgSGVycmluZyBp
biByZXZpZXdpbmcNCj4gPiA+IHN5c3RlbSBkZXZpY2UgdHJlZS4NCj4gPiA+DQo+ID4gPiBTbyB0
aGUgc29sdXRpb24gd2Ugd2VudCBmb3IgaXMgdGhlIGZvbGxvd2luZzogaWYgdGhlcmUgaXMgYSBk
ZWZhdWx0DQo+ID4gPiBkb21haW4gL3Jlc2VydmVkLW1lbW9yeSBhcHBsaWVzIHRvIHRoZSBkZWZh
dWx0IGRvbWFpbi4gT3RoZXJ3aXNlLA0KPiA+ID4gZWFjaCBkb21haW4gaXMgZ29pbmcgdG8gaGF2
ZSBpdHMgb3duIHJlc2VydmVkLW1lbW9yeS4gRXhhbXBsZToNCj4gPiA+DQo+ID4gPiAgICAgICAg
IGRvbVUxIHsNCj4gPiA+ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAieGVuLGRvbWFpbiI7DQo+
ID4gPiAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDE+Ow0KPiA+ID4gICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MHgxPjsNCj4gPiA+ICAgICAgICAgICAgIGNwdXMgPSA8Mj47DQo+
ID4gPg0KPiA+ID4gICAgICAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsNCj4gPiA+ICAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gPiA+ICAgICAgICAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwyPjsNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgICAgICAgc3RhdGljLW1lbW9y
eUAweDMwMDAwMDAwIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4
ZW4sc3RhdGljLW1lbW9yeS1kb21haW4iOw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwIDB4MzAwMDAwMDAgMHgwIDB4MjAwMDAwMDA+Ow0KPiA+ID4gICAgICAgICAgICAgICAg
IH07DQo+ID4gPiAgICAgICAgICAgICB9Ow0KPiA+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gVGhp
cyBzb3VuZHMgd3JvbmcgdG8gbWUgYmVjYXVzZSB0aGUgbWVtb3J5IGlzIHJlc2VydmVkIGZyb20g
dGhlDQo+ID4gaHlwZXJ2aXNvciBQb1Ygbm90IGZyb20gdGhlIGRvbWFpbi4gSU9XLCB3aGVuIEkg
cmVhZCB0aGlzLCBJIHRoaW5rIHRoZQ0KPiA+IG1lbW9yeSB3aWxsIGJlIHJlc2VydmVkIGluIHRo
ZSBkb21haW4uDQo+IA0KPiBJdCBpcyBkZWZpbml0ZWx5IHZlcnkgd3JvbmcgdG8gcGxhY2UgdGhl
IHN0YXRpYy1tZW1vcnkgYWxsb2NhdGlvbiB1bmRlcg0KPiAvY2hvc2VuL2RvbVUxL3Jlc2VydmVk
LW1lbW9yeS4gU29ycnkgaWYgSSBjYXVzZWQgY29uZnVzaW9uLiBJIG9ubHkgbWVhbnQgaXQNCj4g
YXMgYW4gZXhhbXBsZSBvZiBob3cgcmVzZXJ2ZWQtbWVtb3J5IChhY3R1YWwgcmVzZXJ2ZWQtbWVt
b3J5IGxpc3QgZHJpdmVyLQ0KPiBzcGVjaWZpYyBtZW1vcnkgcmFuZ2VzKSBpcyB1c2VkLg0KPiAN
Cj4gDQo+ID4gPg0KPiA+ID4gU28gSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIHVzZSByZXNlcnZl
ZC1tZW1vcnkgZm9yIHRoaXMsIGVpdGhlcg0KPiA+ID4gL3Jlc2VydmVkLW1lbW9yeSBvciAvY2hv
c2VuL2RvbVUxL3Jlc2VydmVkLW1lbW9yeS4gSW5zdGVhZCBpdCB3b3VsZA0KPiA+ID4gYmUgZ29v
ZCB0byBhbGlnbiBpdCB3aXRoIHN5c3RlbSBkZXZpY2UgdHJlZSBhbmQgZGVmaW5lIGl0IGFzIGEg
bmV3DQo+ID4gPiBwcm9wZXJ0eSB1bmRlciBkb21VMS4NCj4gPg0KPiA+IERvIHlvdSBoYXZlIGFu
eSBmb3JtYWwgZG9jdW1lbnRhdGlvbiBvZiB0aGUgc3lzdGVtIGRldmljZS10cmVlPw0KPiANCj4g
SXQgbGl2ZXMgaGVyZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2xvcHBl
ci90cmVlL21hc3Rlci9zcGVjaWZpY2F0aW9uDQo+IA0KPiBTdGFydCBmcm9tIHNwZWNpZmljYXRp
b24ubWQuIEl0IGlzIHRoZSBvbGRlc3QgcGFydCBvZiB0aGUgc3BlYywgc28gaXQgaXMgbm90IHll
dA0KPiB3cml0dGVuIHdpdGggYSBmb3JtYWwgc3BlY2lmaWNhdGlvbiBsYW5ndWFnZS4NCj4gDQo+
IEZZSSB0aGVyZSBhcmUgYSBudW1iZXIgb2YgdGhpbmdzIGluLWZsaWdodCBpbiByZWdhcmRzIHRv
IGRvbWFpbnMgdGhhdCB3ZQ0KPiBkaXNjdXNzZWQgaW4gdGhlIGxhc3QgY2FsbCBidXQgdGhleSBh
cmUgbm90IHlldCBzZXR0bGVkLCB0aHVzLCB0aGV5IGFyZSBub3QgeWV0DQo+IGNvbW1pdHRlZCAo
YWNjZXNzIGZsYWdzIGRlZmluaXRpb25zIGFuZCBoaWVyYXJjaGljYWwgZG9tYWlucykuIEhvd2V2
ZXIsIHRoZXkNCj4gZG9uJ3QgYWZmZWN0IGRvbWFpbnMgbWVtb3J5IGFsbG9jYXRpb25zIHNvIGZy
b20gdGhhdCBwZXJzcGVjdGl2ZSBub3RoaW5nIGhhcw0KPiBjaGFuZ2VkLg0KPiANCj4gDQo+ID4g
PiBJbiBzeXN0ZW0gZGV2aWNlIHRyZWUgd2Ugd291bGQgdXNlIGEgcHJvcGVydHkgY2FsbGVkICJt
ZW1vcnkiIHRvDQo+ID4gPiBzcGVjaWZ5IG9uZSBvciBtb3JlIHJhbmdlcywgZS5nLjoNCj4gPiA+
DQo+ID4gPiAgICAgZG9tVTEgew0KPiA+ID4gICAgICAgICBtZW1vcnkgPSA8MHgwIDB4NTAwMDAw
IDB4MCAweDdmYjAwMDAwPjsNCj4gPiA+DQo+ID4gPiBVbmZvcnR1bmF0ZWx5IGZvciB4ZW4sZG9t
YWlucyB3ZSBoYXZlIGFscmVhZHkgZGVmaW5lZCAibWVtb3J5IiB0bw0KPiA+ID4gc3BlY2lmeSBh
biBhbW91bnQsIHJhdGhlciB0aGFuIGEgcmFuZ2UuIFRoYXQncyB0b28gYmFkIGJlY2F1c2UgdGhl
DQo+ID4gPiBtb3N0IG5hdHVyYWwgd2F5IHRvIGRvIHRoaXMgd291bGQgYmU6DQo+ID4gPg0KPiA+
ID4gICAgIGRvbVUxIHsNCj4gPiA+ICAgICAgICAgc2l6ZSA9IDxhbW91bnQ+Ow0KPiA+ID4gICAg
ICAgICBtZW1vcnkgPSA8cmFuZ2VzPjsNCj4gPiA+DQo+ID4gPiBXaGVuIHdlJ2xsIGludHJvZHVj
ZSBuYXRpdmUgc3lzdGVtIGRldmljZSB0cmVlIHN1cHBvcnQgaW4gWGVuIHdlJ2xsDQo+ID4gPiBi
ZSBhYmxlIHRvIGRvIHRoYXQuIEZvciBub3csIHdlIG5lZWQgdG8gY29tZSB1cCB3aXRoIGEgZGlm
ZmVyZW50IHByb3BlcnR5Lg0KPiA+ID4gRm9yIGluc3RhbmNlOiAic3RhdGljLW1lbW9yeSIgKG90
aGVyIG5hbWVzIGFyZSB3ZWxjb21lIGlmIHlvdSBoYXZlIGENCj4gPiA+IGJldHRlciBzdWdnZXN0
aW9uKS4NCj4gPiA+DQo+ID4gPiBXZSB1c2UgYSBuZXcgcHJvcGVydHkgY2FsbGVkICJzdGF0aWMt
bWVtb3J5IiB0b2dldGhlciB3aXRoDQo+ID4gPiAjc3RhdGljLW1lbW9yeS1hZGRyZXNzLWNlbGxz
IGFuZCAjc3RhdGljLW1lbW9yeS1zaXplLWNlbGxzIHRvIGRlZmluZQ0KPiA+ID4gaG93IG1hbnkg
Y2VsbHMgdG8gdXNlIGZvciBhZGRyZXNzIGFuZCBzaXplLg0KPiA+ID4NCj4gPiA+IEV4YW1wbGU6
DQo+ID4gPg0KPiA+ID4gICAgIGRvbVUxIHsNCj4gPiA+ICAgICAgICAgI3N0YXRpYy1tZW1vcnkt
YWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gPiA+ICAgICAgICAgI3N0YXRpYy1tZW1vcnktc2l6ZS1j
ZWxscyA9IDwyPjsNCj4gPiA+ICAgICAgICAgc3RhdGljLW1lbW9yeSA9IDwweDAgMHg1MDAwMDAg
MHgwIDB4N2ZiMDAwMDA+Ow0KPiA+DQo+ID4gVGhpcyBpcyBwcmV0dHkgc2ltaWxhciB0byB3aGF0
IFBlbm55IHN1Z2dlc3RlZC4gQnV0IEkgZGlzbGlrZSBpdA0KPiA+IGJlY2F1c2Ugb2YgdGhlIGFt
b3VudCBvZiBjb2RlIHRoYXQgbmVlZHMgdG8gYmUgZHVwbGljYXRlZCB3aXRoIHRoZQ0KPiA+IHJl
c2VydmVkIG1lbW9yeS4NCj4gDQo+IFdoZXJlIGlzIHRoZSBjb2RlIGR1cGxpY2F0aW9uPyBJbiB0
aGUgcGFyc2luZyBpdHNlbGY/DQo+IA0KPiBJZiB0aGVyZSBpcyBjb2RlIGR1cGxpY2F0aW9uLCBj
YW4gd2UgZmluZCBhIHdheSB0byBzaGFyZSBzb21lIG9mIHRoZSBjb2RlIHRvDQo+IGF2b2lkIHRo
ZSBkdXBsaWNhdGlvbj8NCg0KQm90aCB5b3VyIG9waW5pb25zIGFyZSBzbyBjb252aW5jaW5nLi4u
IDovDQoNCkNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZzoNCkkgdGhpbmsgdGhlIGR1cGxpY2F0aW9u
IHdoaWNoIEp1bGllbiBtZWFucyBhcmUgaGVyZSwgU2VlIGNvbW1pdCANCmh0dHBzOi8vcGF0Y2hl
dy5vcmcvWGVuLzIwMjEwNTE4MDUyMTEzLjcyNTgwOC0xLXBlbm55LnpoZW5nQGFybS5jb20vMjAy
MTA1MTgwNTIxMTMuNzI1ODA4LTMtcGVubnkuemhlbmdAYXJtLmNvbS8NCkkgYWRkZWQgYSBhbm90
aGVyIHNpbWlsYXIgbG9vcCBpbiBkdF91bnJlc2VydmVkX3JlZ2lvbnMgdG8gdW5yZXNlcnZlIHN0
YXRpYyBtZW1vcnkuDQpGb3IgdGhpcyBwYXJ0LCBJIGNvdWxkIHRyeSB0byBleHRyYWN0IGNvbW1v
biBjb2Rlcy4NCg0KQnV0IGFub3RoZXIgcGFydCBJIHRoaW5rIGlzIGp1c3QgdGhpcyBjb21taXQs
IHdoZXJlIEkgYWRkZWQgYW5vdGhlciBjaGVjayBmb3Igc3RhdGljIG1lbW9yeQ0KaW4gZWFybHlf
c2Nhbl9ub2RlOg0KDQorICAgIGVsc2UgaWYgKCBkZXB0aCA9PSAyICYmIGZkdF9nZXRfcHJvcGVy
dHkoZmR0LCBub2RlLCAieGVuLHN0YXRpYy1tZW0iLCBOVUxMKSApDQorICAgICAgICBwcm9jZXNz
X3N0YXRpY19tZW1vcnkoZmR0LCBub2RlLCAieGVuLHN0YXRpYy1tZW0iLCBhZGRyZXNzX2NlbGxz
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfY2VsbHMsICZib290aW5mby5z
dGF0aWNfbWVtKTsNCg0KVEJILCBJIGRvbid0IGtub3cgaG93IHRvIGZpeCBoZXJlLi4uLg0KDQpJ
J3ZlIGFscmVhZHkgZmluaXNoZWQgUGF0Y2ggdjIsIHdlIGNvdWxkIGNvbnRpbnVlIGRpc2N1c3Np
bmcgb24gaG93IHRvIGRlZmluZSBpdCBpbg0KRGV2aWNlIHRyZWUgaGVyZSwgYW5kIGl0IHdpbGwg
YmUgaW5jbHVkZWQgaW4gUGF0Y2ggdjN+fn4g8J+YiQ0KDQpDaGVlcnMNClBlbm55IFpoZW5nDQoN
Cg==

