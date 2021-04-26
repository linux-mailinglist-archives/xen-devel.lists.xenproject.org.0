Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48736B5F6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 17:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117747.223630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb3Lm-0000o0-5u; Mon, 26 Apr 2021 15:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117747.223630; Mon, 26 Apr 2021 15:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb3Lm-0000na-2W; Mon, 26 Apr 2021 15:40:42 +0000
Received: by outflank-mailman (input) for mailman id 117747;
 Mon, 26 Apr 2021 15:40:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vTY+=JX=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lb3Lk-0000nV-RC
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 15:40:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8129547-73f5-4f9f-a1f0-46c719333c8d;
 Mon, 26 Apr 2021 15:40:38 +0000 (UTC)
Received: from MR2P264CA0107.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::23)
 by AM6PR08MB4692.eurprd08.prod.outlook.com (2603:10a6:20b:d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 15:40:34 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::98) by MR2P264CA0107.outlook.office365.com
 (2603:10a6:500:33::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Mon, 26 Apr 2021 15:40:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 15:40:34 +0000
Received: ("Tessian outbound 82c2d58b350b:v90");
 Mon, 26 Apr 2021 15:40:33 +0000
Received: from 66d2042c478f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29852ADE-E7A8-44F8-A7D8-43225DA35995.1; 
 Mon, 26 Apr 2021 15:40:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66d2042c478f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Apr 2021 15:40:14 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3869.eurprd08.prod.outlook.com (2603:10a6:803:bf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 15:40:12 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 15:40:10 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P123CA0061.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Mon, 26 Apr 2021 15:40:09 +0000
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
X-Inumbo-ID: f8129547-73f5-4f9f-a1f0-46c719333c8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMIkCg9QqaEkIQuG694JzwGAJwB2d7CoeYJw3aDOIgE=;
 b=6x9FTgKucNgWzzg7/y0wragDHmY2hNTDEUOdxNzg/mHXB5B8os+96rfC4Pg4Efj2nw7WiD8Mv+LjEcInAQ26c/pwCEDFW2GJaEIQ97mtF5iflPkePo6kqGDYEgWEszbRc8k2+3JxCMe/NjlGd7KXbq+9YhGZt5VA6FEUXJy9gzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8741621415b47ab0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOzm2TSlSjx6sXM02v7yGoXntZs6sYpdvsSK5TBleIps3ULWI9xBDC1RkUBLU+I/VXfIxhEhoRi16897S24V5Ajf4iHG5FBeQy6vgBwoPJuuVagVFEHiSot0grel2s9B0mHeYQEgLupp3xg6viP6gGgE4mHu4W2yCS6rwVtewcbSiEKar+3/zA0td4OEAfGh863zsslRuJdrtn8YDZfpuxwNjgJViSboPz7pUhcVuU858y2LHN4q8wI1IK9pQPf+LW2n+vahdhT5SWI8DBa2of9vYMyEoufHP0NqE6gBvODVPuGcBeqqIbD1PkH2DeqqVh0A+P2EYgDenNFZN7TtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMIkCg9QqaEkIQuG694JzwGAJwB2d7CoeYJw3aDOIgE=;
 b=mP8l8FNeAAsdy09HLp1wSjbYQhnRFyAoPyS5vTouGY6oVSateCroF+/u8tPKZgs8S/hANhgjcJDHwUGvBmL0Vi5K8naWKG0nV8PZvVnTB2ZW2gtob3Nr6sVruJImtQ12/v3KRYkUXonzn1bkVYgDiAl3hSMvpT4pMet1mxL/ViMPkVjXBtaCaCVFtxiO88IrI60qYA96xG2/6s+ZYyw6nhPYVeKN5MTYLbzbgCBUOVUNrWvMUNpVEamnlt7MCu7EeHtFm9gaqJ0QzxipuXtSX1tasUOkgztcXovgkT57gBGyEIzJaZ1csndiYepnpFZYnMOE65gvVJ/rAFKnhvRn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMIkCg9QqaEkIQuG694JzwGAJwB2d7CoeYJw3aDOIgE=;
 b=6x9FTgKucNgWzzg7/y0wragDHmY2hNTDEUOdxNzg/mHXB5B8os+96rfC4Pg4Efj2nw7WiD8Mv+LjEcInAQ26c/pwCEDFW2GJaEIQ97mtF5iflPkePo6kqGDYEgWEszbRc8k2+3JxCMe/NjlGd7KXbq+9YhGZt5VA6FEUXJy9gzU=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <62112712-7ace-3cad-8bc5-b5656fdd42f8@suse.com>
Date: Mon, 26 Apr 2021 16:40:02 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <52B5BFEF-95C9-438D-81AF-60CE2570631C@arm.com>
References: <20210419091231.55684-1-luca.fancellu@arm.com>
 <20210419091231.55684-4-luca.fancellu@arm.com>
 <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
 <0F26E53E-0C0A-4596-AC88-F803BC7A0493@arm.com>
 <c6d80a92-b8e7-703a-e051-18dc845b242a@suse.com>
 <ADF98BE7-02CA-48C1-B0CF-E4C7B4C0E828@arm.com>
 <dbcf10ef-0d40-a687-d242-f01a01bca342@suse.com>
 <91B2399E-2E91-44A9-A5F2-C55F42F52F52@arm.com>
 <62112712-7ace-3cad-8bc5-b5656fdd42f8@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::25) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5223418d-ea12-4bc3-c271-08d908c9a1c6
X-MS-TrafficTypeDiagnostic: VI1PR08MB3869:|AM6PR08MB4692:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4692961DD3E36A47A2C45A4EE4429@AM6PR08MB4692.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y43Ku36VeMh5TFznO1qua6ZuRL9kU4AY/v4mhD8cywSOw5AIhwFFh8QPRAqVKSMLW5rEy55IHYlsTvAqxAn2fd3pp3VQQQM6ITD9AVQvFwiRh8WkjOjPyv9dSBL2t0ukQaL36T9jijnUl0Dltc2ZCO3GymmS99QEItRGa31TXiRrPD4qOuM8cu4elIzBzX3UJa8FP4RvD+I1aHlKtverf+liCgoue+E4ru3TL2YXJFAaRNZfVhP6SP5qTA/7BCUEn8NVMjJf0KlcuXfw8brhw1QAp4lKM4A0/Q/ldrXRufYbOPPJIpsxZjDe27fUDwKQBusCHsw8aRrW/DISIK13SRPzcaqFmLl/dT2fFRwKPOn8nKNvnRCn1MawO6BpC7PKVZgug0FDX55do1D9aD0HEcdFo1Mn1Dtd3NcTIhnkKwil5ODaFh5gXEEyPtxe6qH5xiXLbcxOcVkGyBsBCYCfAFJL16m/uJ5u1k2823lieyhzXM1gYX8rqjfdnAvE9Y++uBjGH05c6MUTw5ZV0ZM9hrwDs2VrSM8ttrDUKoGEAtl3mVNzqyoXT1CTC4Okzsk5eRqtF2/lAxaF3/lNBWK+GxsEqkdgy+zCVhaJcIZB147d2wrCjIYCltsmJkJ98hjusPMvD5cqEERDC1Z2aWu6iqda8DU6CSd3+ZbdYGdfHzJqGi/CTdoHkeAjl1tPx94EpUdMj1IIV5XCb+TPcZ8DNw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(7696005)(186003)(52116002)(316002)(33656002)(16526019)(38100700002)(86362001)(38350700002)(2906002)(5660300002)(26005)(53546011)(6486002)(4326008)(966005)(83380400001)(66946007)(8676002)(54906003)(6916009)(6666004)(8936002)(66476007)(66556008)(478600001)(44832011)(2616005)(36756003)(956004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?MmhuWHlRT0R4cjl6Wm03RWY0eE9ReUdSM0o3MnpwZDRXdTNPRjhXS0g3YnFO?=
 =?utf-8?B?SjZDRytoK21xRW9CT21waGR4R2dmMkVyNHNuR0h6anZlV2tnOVdxdG95RnIx?=
 =?utf-8?B?MWRxbkVYYjRmR2d0TWF0RkZ2WURuYTBnU2M1OS85enpJTk9pTmNhLzF5L2dq?=
 =?utf-8?B?blVtK0JvQ3ZydkE4R3lrR2VzaHpKRHFDYmo3NmxBZlJ6cjhtM1pLZGJGWURW?=
 =?utf-8?B?TmhzMGkzTHI5RkY0bnBDQjhERHRlTXlQSzN5RTREU1hxTVVNWURnekI5WDJt?=
 =?utf-8?B?dURlQ3BvR0ppZWZGd1ZTQy9ETFBGMXBLVHhCSWdSZkszY2JyRUswRWhiMXFy?=
 =?utf-8?B?WG4wblhRa3RKU2VoTDB6ZzdydDZCWVZrRU5xOTVUT3pyTHlFS2RvYjFtZVVn?=
 =?utf-8?B?Y2QrZFRSa2xReURsNWdNMk5ic2dwc0tGeEh3TmQrRDNqdnVOY1pNcTYyMW9U?=
 =?utf-8?B?N25FQjZybitFM1REUnQzQ3cxOWdyQzc2QmxPMUNucjB2QllkYnpNbVNUb3Q2?=
 =?utf-8?B?MzZPMzkycmQ3STRvdDlkc3NhWXRYWUFhR21KUFVzSlJhWklWZWFXZzdXMjBI?=
 =?utf-8?B?NnRJS0VZY1d0VXhOVGcwYVhtMkQ2UEVPd213QnBHbkNjbldaaUNscmdJK0pB?=
 =?utf-8?B?VkpMTHdkUlBrellyaFJsaUVzdWtoNjVySjVGTVlYYU1Ya0srRXBkNU9OWTFt?=
 =?utf-8?B?dTBzV1RJT25LRnhCUGplWWtMeTBvM2xobS8zc0FIQkhKaE1QQ3NZdHpDdGVl?=
 =?utf-8?B?R1JicUNoTEN0eEFRNUJXdGpZWHFkYnFmTHR4N1ZJdStsUHNnMGhhdnZFRzg2?=
 =?utf-8?B?RDF5TDRXWnJacjAvQzVUdzJYOVdXRDI2S283aUJTOC84TXVKcGFTUHdnQ0pF?=
 =?utf-8?B?RWZIYUtjd2lHb2xhZGZqMWd2UlFBZmlTOEl1WGRDZ0F2U2huZzZCMjk2Umpa?=
 =?utf-8?B?eFNjMkhvY1AyOVB1N0xKUDlrK2VNYUVZNVVjc0JRcWFzTVpsUEQyVE95RUtE?=
 =?utf-8?B?d09nM2Y3d05PekdzVlV0WExrVjZUWTZTT2J2bEFFNXVVQUVhbjVheGpIYXhD?=
 =?utf-8?B?Z0Y3QjRianVna0F1ejhCSlBuSjYwdnY0V3YyelNiUG5FTWVHL2IxZnFaZ2Ry?=
 =?utf-8?B?cFIyTXhzRVdhWFcwcjU0ZnJxV244bUFYU1VHOFBZM1pLanhsMFgxREx4bVZ3?=
 =?utf-8?B?M3ZycG9sZnJmWXdyenQwNDExWng2NkppNHFoRzlqMzF3REF4VGw0bW8zUkZD?=
 =?utf-8?B?UDBDUzREM1dwdGlGcDBlOEtGZHJtTnI0TDdMZFFuWXp1NFViY0RZRGlZTS92?=
 =?utf-8?B?K1VVWDVvUThINHZvdHkrTDhXOERkU1JUQnhiL2gyc0JrMnlVSnN3RGQybWh3?=
 =?utf-8?B?SHdnS1FMd3UxYkxJb0IwYkJpUGh0RW9LYW41R3FvNmtORHJSWkFraHlzNGRu?=
 =?utf-8?B?eDBLaGY5KzVFTGk1bTdwKzJvSUltQk5YVnd6YkxWWEl2blpRbHRQc0NaVGRj?=
 =?utf-8?B?RGNKN1BwWHVqSW85YnRTRXcyZEJnS1dXT1ZtZDZvNWZFUjhiUUhLNUVlQ3Bv?=
 =?utf-8?B?U21XV0FxbFZEWkk0QXZ2K0VZZWVHMEdRamJBeEZ3cVk1eVN5WWU2UmIwSGZh?=
 =?utf-8?B?VHJjNnNSL2VZMjZibmVlWVZ1ZEIrVjh2ejZ4NjhoWEptNjdiSy9sWUZ4N3Fu?=
 =?utf-8?B?clk4YTBlN1I0Uk9FNW9mdzVTK1J4eFJacTVldWtLMzZjRERGTkxIZFB2c0h6?=
 =?utf-8?Q?nT0EHP4MBEBHpXolMnzHXiGZaukmD7hfUa6wfrX?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3869
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d408822a-4432-4470-b0a0-08d908c99352
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KuSLe/3AiiGv/2iwthnlTPAz4Y9bqJj141Tfk+uKTw5cr3WR8BrrTk30KaPUasNIlDOabD7ajBQFXzN9LL//a01OZADq87dJV/6Hyqwae0xZJEDNi2f4YKE5AOFop6l85LPcbZ7zEv+VQQeNjAtJlETSI3FgiF0vZItnn0ulc2R4NsfHYh+o56LjSE/1OvqUfx0qdk4uVRfUF9DJw2h2wF5ESBFQOyTcKoTVX/8KRSRuNlpzVR+x8F26boojZ+vZMmp/KMmpAnuLQs5jh+g5KOrXyIs7oiultlk94CCWfrYIdDzlFicqStVx0XutGpVNqNs1NF5vI+xVE8UIOosbZ0IwD0fgj28VkIdQPjUjp/7dTMSS2gjfdTHd0Drh10Bf1GRv5drDkhE/F3gYPlPnY4wXPKskzrjol5cPeGFrd5R9zjvb6rWjAJdC3tsdh7ZVpi1+GG6z6t5R1rekbtBrCBE396qaJFc7uVFJZkn1cXnf8aTWnD6SRCfhkVk+GBIZH76cWJJfKPSMcT8eKqyIKjDzN6DHCeqbBxT7i2Jyo9o2bsldeTXW8HGFzohAl+T2qkkr3hlNOs2+VkQBStzXVaa8LhUcKugguE6Yjk+jEmxeXpe5C1PPqDFDAfOusN/8kKf0iCx0fz9DMH48y8giHUOYLLTOkOcEuSqFE53R1zflO3jGJf7oHvJ++AQKhyW72A2S9PT16/EN6JT6UdrcRgxJ+PLAtGAuy0NpGZZzXkM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(966005)(70586007)(81166007)(5660300002)(2616005)(336012)(26005)(83380400001)(82740400003)(47076005)(54906003)(70206006)(316002)(356005)(33656002)(2906002)(478600001)(6862004)(956004)(53546011)(7696005)(82310400003)(34020700004)(44832011)(6486002)(8936002)(86362001)(36756003)(8676002)(186003)(4326008)(36860700001)(6666004)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 15:40:34.3543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5223418d-ea12-4bc3-c271-08d908c9a1c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4692



> On 22 Apr 2021, at 09:06, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.04.2021 09:39, Luca Fancellu wrote:
>>> On 20 Apr 2021, at 11:27, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 20.04.2021 11:42, Luca Fancellu wrote:
>>>>> On 20 Apr 2021, at 10:14, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 20.04.2021 10:46, Luca Fancellu wrote:
>>>>>>> On 19 Apr 2021, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 19.04.2021 11:12, Luca Fancellu wrote:
>>>>>>>> - */
>>>>>>>> -
>>>>>>>> -/*
>>>>>>>> - * Reference to a grant entry in a specified domain's grant table=
.
>>>>>>>> - */
>>>>>>>> -typedef uint32_t grant_ref_t;
>>>>>>>=20
>>>>>>> Why does this get moved ...
>>>>>>>=20
>>>>>>>> -
>>>>>>>> -/*
>>>>>>>> + *
>>>>>>>> * A grant table comprises a packed array of grant entries in one o=
r more
>>>>>>>> * page frames shared between Xen and a guest.
>>>>>>>> + *
>>>>>>>> * [XEN]: This field is written by Xen and read by the sharing gues=
t.
>>>>>>>> + *
>>>>>>>> * [GST]: This field is written by the guest and read by Xen.
>>>>>>>> + *
>>>>>>>> + * @addtogroup grant_table Grant Tables
>>>>>>>> + * @{
>>>>>>>> */
>>>>>>>>=20
>>>>>>>> -/*
>>>>>>>> - * Version 1 of the grant table entry structure is maintained pur=
ely
>>>>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>>>>> +/**
>>>>>>>> + * Reference to a grant entry in a specified domain's grant table=
.
>>>>>>>> */
>>>>>>>> +typedef uint32_t grant_ref_t;
>>>>>>>=20
>>>>>>> ... here, past a comment unrelated to it?
>>>>>>=20
>>>>>> The comment =E2=80=9CVersion 1 of the grant table entry [=E2=80=A6]=
=E2=80=9D was moved on top of the struct grant_entry_v1, in this way
>>>>>> Doxygen associate the comment to that structure.
>>>>>>=20
>>>>>> The comment =E2=80=9CReference to a grant entry in a specified domai=
n's grant table.=E2=80=9D Is moved on top of typedef uint32_t grant_ref_t
>>>>>> for the same reason above
>>>>>=20
>>>>> But it's the other comment ("A grant table comprises ...") that I
>>>>> was asking about.
>>>>=20
>>>> I thought it was part of the brief about grant tables, am I wrong? For=
 that reason I moved it.
>>>=20
>>> Well, the comment talks about grant table entries (the layout of which
>>> gets defined immediately below, as visible in the original patch), not
>>> grant references.
>>=20
>> Hi Jan,
>>=20
>> Of course this can be reverted back if it is wrong.=20
>>=20
>> I=E2=80=99ve prepared a page with the output of all my commits (some of =
them are not yet in the ML),
>> so anyone can have a look on what is the output and how can sphinx+doxyg=
en improve
>> the quality of the documentation.
>>=20
>> Here:=20
>>=20
>> https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/arm64.html
>=20
> The doc looks fine in this regard, but the C header should remain
> properly ordered as well.

Hi Jan,

I=E2=80=99ve pushed outside the v3 addressing your comment

>=20
>>>>>>>> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>>>>>>>>   * In that case, the frame field has the same semantics as the
>>>>>>>>   * field of the same name in the V1 entry structure.
>>>>>>>>   */
>>>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>>>  struct {
>>>>>>>>      grant_entry_header_t hdr;
>>>>>>>>      uint32_t pad0;
>>>>>>>>      uint64_t frame;
>>>>>>>>  } full_page;
>>>>>>>> +    /** @endcond */
>>>>>>>>=20
>>>>>>>>  /*
>>>>>>>>   * If the grant type is GTF_grant_access and GTF_sub_page is set,
>>>>>>>>   * @domid is allowed to access bytes [@page_off,@page_off+@length=
)
>>>>>>>>   * in frame @frame.
>>>>>>>>   */
>>>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>>>  struct {
>>>>>>>>      grant_entry_header_t hdr;
>>>>>>>>      uint16_t page_off;
>>>>>>>>      uint16_t length;
>>>>>>>>      uint64_t frame;
>>>>>>>>  } sub_page;
>>>>>>>> +    /** @endcond */
>>>>>>>>=20
>>>>>>>>  /*
>>>>>>>>   * If the grant is GTF_transitive, @domid is allowed to use the
>>>>>>>> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>>>>>>>>   * The current version of Xen does not allow transitive grants
>>>>>>>>   * to be mapped.
>>>>>>>>   */
>>>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>>>  struct {
>>>>>>>>      grant_entry_header_t hdr;
>>>>>>>>      domid_t trans_domid;
>>>>>>>>      uint16_t pad0;
>>>>>>>>      grant_ref_t gref;
>>>>>>>>  } transitive;
>>>>>>>> +    /** @endcond */
>>>>>>>=20
>>>>>>> While already better than the introduction of strange struct tags,
>>>>>>> I'm still not convinced we want this extra clutter (sorry). Plus -
>>>>>>> don't these additions mean the sub-structures then won't be
>>>>>>> represented in the generated doc, rendering it (partly) useless?
>>>>>>=20
>>>>>> Are you suggesting to remove the structure from docs?
>>>>>=20
>>>>> Just yet I'm not suggesting anything here - I was merely guessing at
>>>>> the effect of "@cond" and the associated "skip ..." to mean that this
>>>>> construct makes doxygen skip the enclosed section. If that's not the
>>>>> effect, then maybe the comment wants rewording? (And then - what does
>>>>> @cond mean?)
>>>>=20
>>>> Yes you were right, in the documentation the structure grant_entry_v2 =
won=E2=80=99t display the
>>>> anonymous union.
>>>=20
>>> In which case I'm now completely unclear about your prior question.
>>=20
>> We have to choose just if the struct is useful even if it=E2=80=99s part=
ially documented or if
>> it=E2=80=99s better to hide it completely from the docs since it can=E2=
=80=99t be fully documented.
>=20
> I've never suggested to hide it completely (aiui doing so would
> mean widening the scope of the @cond, i.e. there would still be
> extra clutter). Instead I was trying to suggest to make sure the
> struct gets fully documented despite the absence of struct tags.

In the v3 I preprocess the header to give a name to the anonymous struct so=
 that it appears in the
docs without touching the header.

Cheers,
Luca

>=20
> Jan


