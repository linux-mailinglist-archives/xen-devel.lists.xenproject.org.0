Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286043F2A22
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 12:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169401.309439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH1nk-0000wp-Ce; Fri, 20 Aug 2021 10:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169401.309439; Fri, 20 Aug 2021 10:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH1nk-0000uI-8k; Fri, 20 Aug 2021 10:31:04 +0000
Received: by outflank-mailman (input) for mailman id 169401;
 Fri, 20 Aug 2021 10:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+ZW=NL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mH1nj-0000qW-0H
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 10:31:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.68]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8be3d8e-f9ef-46b1-9675-b4bb761cb216;
 Fri, 20 Aug 2021 10:31:00 +0000 (UTC)
Received: from AS8PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:20b:312::25)
 by VI1PR08MB3581.eurprd08.prod.outlook.com (2603:10a6:803:79::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 10:30:56 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::15) by AS8PR04CA0050.outlook.office365.com
 (2603:10a6:20b:312::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 10:30:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 10:30:56 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Fri, 20 Aug 2021 10:30:55 +0000
Received: from dcffbae2affa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53BA4A8F-F372-4BA1-80CF-6DBCA17380B4.1; 
 Fri, 20 Aug 2021 10:30:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcffbae2affa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 10:30:48 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 10:30:46 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 10:30:46 +0000
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
X-Inumbo-ID: d8be3d8e-f9ef-46b1-9675-b4bb761cb216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N07I+lCryiHHLdPJ8XqqcqyWhzPEBfN8VjfBPIH743A=;
 b=7Ys2yZY89o8kRRp+806+GbceIXcEPBPHck0YKE53biKPXTTC+zeLb/DE/87UOUpVn4IC6pQAXlATOgtcpAufi7dLQvwyDQHawCRcPRTbIG/CfuYvs5la1tJh9q0oOrdpLLy+NceuhQLdVeELAgeldTR8oPycnILojT94FhbsZ9c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54de302854658eae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZntkcrF03z3rVxPt2HyASkXep2+Efl8ZLSsAMqf58sPHJxL6Z7FSVQiZg+GIStUoTI6+QpIZP9RAtiK/PU70+xFxBXQTtC+bwZVgoZvkhyaCyjNAuWFFK8Gai/YdbVUjb5yiNC8EUW0usiD0edBb63R+N3QQxiqOUCbCyLemxwB71jbGY93ly4ex47bLCCvz/+7jU2qVCPxddb73m6AGhHUTPSk8NtORZvkQxCYBNmWe7L1CZQjGCItNitOoKNjHKa4tR+E/SY0pcitTPdy1TVA8ImoAYwcepWNF3oQQ5FNoFhkja20U51rryLG4CNMJ3ItA4E9FT8qln/LGZWrAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N07I+lCryiHHLdPJ8XqqcqyWhzPEBfN8VjfBPIH743A=;
 b=kkBCMX8FCdwwojAoaal8CBiQ2MW6OVRugcNKk2/4g2S/exxqMWA3b26VKORihI7WnekyPbvdLxNKvMHWa+U2HTF2FeTf+xbMtAzUv7Lhr2SF8ciBURdQeaeK6RaZnn30ATQqjrnUpLgeH4WbvI3K05YysFtHzlo26xpNmq2fNI4rxoRahtJ02PdCnaxrnOyxijkgCyNhK1HgnI2LyK98SUEHNn0H40lCtvt+Vb12G0yhohcYnFlCOvrdm2RYfpP8hDXlMAY3V0BfL+4MoPkZzcuPSSNlgAFd9nF01ASqCueCE3gJaZddOSqRY3JnrXq9TNhpa2BA7QhXMeVhhPsnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N07I+lCryiHHLdPJ8XqqcqyWhzPEBfN8VjfBPIH743A=;
 b=7Ys2yZY89o8kRRp+806+GbceIXcEPBPHck0YKE53biKPXTTC+zeLb/DE/87UOUpVn4IC6pQAXlATOgtcpAufi7dLQvwyDQHawCRcPRTbIG/CfuYvs5la1tJh9q0oOrdpLLy+NceuhQLdVeELAgeldTR8oPycnILojT94FhbsZ9c=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
Thread-Topic: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
Thread-Index: AQHXlPJ69O5DKvBqZU6v8IxjA4iLvqt6wXOAgAFxhoA=
Date: Fri, 20 Aug 2021 10:30:46 +0000
Message-ID: <7F8FC9A8-5580-4517-BF8C-640BCE778D02@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
 <a0d06e37-ec02-9968-01d7-907176c7c9b3@xen.org>
In-Reply-To: <a0d06e37-ec02-9968-01d7-907176c7c9b3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 93c5bc94-5080-4ac3-26e5-08d963c59816
x-ms-traffictypediagnostic: AM7PR08MB5528:|VI1PR08MB3581:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB35813F9419982BEC9AC28E3DFCC19@VI1PR08MB3581.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1uKbblRRLYilHtcprU+3xBKUaFbh8PDxkzF/CnqX8Eelz2e5W4pYCdDkld8DSA4lv0gWe+q4qUZOtNhBomuEfhv8EnXF+DV1b2loHpbZv28cCsuZog1ZG1THiKo97C/gsre77IDP2F6TBYyhflrQamZbjVrRH1EsOTmfoygZwjhXL7WvXGPyRvtAHWMyysvOmveWxZcXlDdmBiLFGvmTcCsd3sxDogWQoZGDErpuCqOQ/PCTI8p8I6YxT15/H58fICC2Nj4IKmBuXoz4D+brvtoeH0KKAnkoAlLtelDv5Sn8d0aWhIcd4SV8MO/n/zj6JqgTNyjDGzdEVfSa8l547Qcv+v2j1Qi9TZUYPvQAne3pDcATzPsO5Pl7lYMSMaF1/92gAC0IB1wkINlN91abcBmYfO9T4JXGsLWl5l9jlW41GzRn7AK+bsY3HiemtaNdxMWLxPxKfaPMHjUmZONnl7yKMJX3gj3NG4Gjccw9RJ3Lj7ceGg79Yutx7CZvTqqFMelPMwwfqaQ/xat/0l9EcEgn5kevz46H8b2xsCyADT6dBzoB4I5xAaiKoHEqG76GdZkIwYwntksXl4w9nFDSM9QjSRKJpVLNHUXVVbg4MiZNFpI5+ZPJB3QZ20SAzg1F4tAAMUd/N0DZXBT6xirD1DmZxfdy5qAGwxBZ5sKLxXwt2D8fdo3JIRXmtnOtEmQVIMCPs6KpVuK8eVcW6Txbk3xlg2wkZfE/bwanNj/3hG9fwdqTcSA9imVJVchS6/+CIpoNCi9CBBN4MgoT2rxbbn/p+UOsvFdJJhWyc8GbwWWxQnkNKH0eCvKpYefX0qsQHF98HXrGU2u97dorGYca3g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(8676002)(2616005)(6512007)(316002)(478600001)(186003)(54906003)(66556008)(66946007)(66476007)(66446008)(91956017)(2906002)(76116006)(64756008)(6486002)(5660300002)(6916009)(4326008)(53546011)(6506007)(8936002)(26005)(86362001)(33656002)(71200400001)(38070700005)(38100700002)(36756003)(122000001)(83380400001)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejM5bzlVTCs1RDh6Y05kRCsxK3BUM0g3RGlqbENUb1FUTXdveTdkRkk0YkxP?=
 =?utf-8?B?SVJzbkNuR0JvbmloK2pqVEd0eDdyT0dVSkRDNVphRk11QnFIbEZKaEZ1UXhv?=
 =?utf-8?B?dE1Ja2wwQ1JGeEVRMlVuVUwwcittZ0txYWsrR09PQ1JQbGtXeG9jMk1qRTUv?=
 =?utf-8?B?VFRwWC9MdkJxdi9rV05ubjJWVXhETW1Ea2lmNmVXNXJlZjJ6NmRWeDFTWVZM?=
 =?utf-8?B?Rno1MGZqZkN0eEw5d1dDMjFNNEVaUGNzVFM4RGRkNldGai9KQzltaEFXNUp3?=
 =?utf-8?B?a0NnQ0Zva3NiN0ZVNW5uZGxiTFpabEdzMG5JZHBRNmNTOUVyc1hqTll5bWY1?=
 =?utf-8?B?TkpPREg4bVdpeFpGWUlpSFBhWVBJdnhMM1FjL0prOG04YmpZMWdzdFRNN0w5?=
 =?utf-8?B?SWczRUt3SUozM3I0TTNaSy9uYk9EQ09JekIvTHBkT1E0cXNPejZYOVR4TTRl?=
 =?utf-8?B?M2xVZGVaSmsvOHBEUUpnWDkxZW5RNjlDVFlSSzhQdlNJQ3FQdmIzUHgwYit4?=
 =?utf-8?B?aDEzY0kvTE1TbmJQQkRkTWsyakdXSVJGeFpxdGFJbFRyQkRDeDdSdWp6WC9R?=
 =?utf-8?B?VVRmS0ZITGgzWEFmaDN6UjF6eTdlcmRzT3ZpL2toQXU5M0Z2SVV6RkxNQU1r?=
 =?utf-8?B?bzlsRVNlcVhHMlNQd21aWmdjemtXQkhpTkttN3djcWJFYWtQY0xTa1BYN3hN?=
 =?utf-8?B?VTNFZFpFZ2NDUGRXcXdSQWZtSTU2MDhXc1hBa1NvbStMdXVoZWxRU0NOZDAw?=
 =?utf-8?B?ekFibU5Fay84SHNXL3hCcWZqN1lJK25OaTZPUFE4WW1RWERhTHUzNlFySkIw?=
 =?utf-8?B?a3lwTy9rSGpHVktoZk9GVEQvWUx0NFd1NndZU1Fockt2elVFSG1RZmErekJy?=
 =?utf-8?B?QUlHVGF1ZThybnU1eUlWNWFPVlU0N3RSaDVHTm9DQW9VWlFua2RucVFBNjBy?=
 =?utf-8?B?b1F4djFPYTRhVTNXRFNvVm9RUHpWekQyb3FaNjNRQW5KQWY0emhjaWxEdEFu?=
 =?utf-8?B?UEl6T3VrN1VqRjcxV0JYMTJFcWhyb2RxQ2p3UXVacm5IY3ZwU3lOVHhybkc3?=
 =?utf-8?B?emc5MWwvVThSWEZZMWMySkdWeDJLSjMxaHNKS2hhN0YrSSszbU1hSng5Nk5L?=
 =?utf-8?B?bHhTRTlGd1lKVXF6NVZGMUJJTWg0MVh5bzlLeWNkRGt4OE1MUGtlMy9UdGp5?=
 =?utf-8?B?cWp3VnVzUnJ5STRZYVhrWnlyNDBWSVlsaUpsSWdnUVpCbzU5Z3hJVTFxTXFC?=
 =?utf-8?B?NkN6eUpVRnhVZFhNTWw0MkltSmhSbHBOMkhna0ppbW1lSmgwUk8yN2NUZU4x?=
 =?utf-8?B?V3loQUkvTGc3TDZjYjZmZ3VObmdSeFZmMjFyd1ZVMlExKysrejFGSzZySHBB?=
 =?utf-8?B?SytFaGhDK01GN2R4cTFEdVc3Z0FUK0IvVHp2Tkxjd1k0eDcvejZiUXVZZDcy?=
 =?utf-8?B?OXEyVm5kdjhiRGs0dVYwZ1Y0ZjYvd2hzV1BXTHFLVTNxSmJFbWdPdFhlL3VT?=
 =?utf-8?B?cTl4aCs0eWpUTzdETEFEVzkrU0t5UVJHYWNTcGZ3UFRJbENWQmgyNHA5WjY0?=
 =?utf-8?B?TjF2bDJ0amJEVU1YcmJkMFpvMFhSQXcyZDFYWithMzJjMW42NnFtbjFPUGpB?=
 =?utf-8?B?aC95WUJqZE53UU9mek9NQjg0cDUrUng0d1BWWElaWmx4NUl6TXNyanc4WkVS?=
 =?utf-8?B?am1BR3cwdFZLWWxmelR4OHNyWHNiSEdNWjY1UG80ay9BSEJqME9WRU43dHZn?=
 =?utf-8?Q?uYJm4L5FlM2EiQPx0a9F9fFeEKwHv/SyQHaHXbZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77C7A4AC33CCA741BAB4AADE7C7D0675@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f43e29a-9d36-4133-7694-08d963c5925e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IH4Rt8EYpq897D39IUuCSXZYeta45g2h3RJ2KMJ/rnFA1TgoQ/mpypyi4U5ss/4H/jr/8VA+rdmMN8ou0VQ9lHuyRnWSEOFbA+iaECQvW6z4iEqStJtIY1eZJONd/vriF2bceolTHzVE7vH732aoxKUz0G0E2lp5ZkzMZDYC9NqDnKSS1TBQXjYfpCvKGtSfPcpVRy0AEjy7ghjp+wtgA2aEzjIUVYcIvnfy8QAetVsbiSu6/qC5DpaOqj3mBmsZZxPqR6PGh4wmfOOSBTXbmYE+oF6eTJ4MTmmxuEpQaj+78yOAorEtpc46XzboNW35yCWuOOxz7iMN1m73er9rmvWttzKxRiABgZwTD1chUcf1h91atLqLOuMTx75JybsI1Hm4ZSYAeQasxksnpbw9OyYJLBGCK2vW+yD750Oer3VbkYINgSUi0XoEBs1o9z8qJX8tu7+SU1BAEgGtSMwFKP6fRH0N3g8iO57hvEYM+rB8dRusHABPfxWMFhXLvX4D7MFd9/5AarFODFvyzq1uiOnQRDlmzMigSeSRtnS5zPfv11kM9JuAR0TRms1Nqi+c3O+Is6oSgU+t32uEkQ0f/pJz/bDjLAgyBO92wHTfH9+W0xHx+lWP8wYYuRo1vKnIy67s42RJFRqlIX7RINFB4XqBAeQKTepRA1mUh1Qma/jEReyxYZUb0TOhrBEP6fDltdyRTOfChyswZFOu4iPyut4tLZ7r2C1O2JWulGIXK2lxNKLbihvc30UhmwvXl4UL2LK1Vonu4TSvN5CNGV0OEM8XETwg6vLIDxBzR4Q16YAqDPLgNVNMP0NkJmO7Uv1y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(36840700001)(46966006)(47076005)(26005)(82740400003)(70206006)(107886003)(6506007)(5660300002)(81166007)(6862004)(2616005)(36860700001)(8936002)(33656002)(86362001)(70586007)(4326008)(82310400003)(8676002)(54906003)(186003)(36756003)(356005)(6486002)(6512007)(336012)(316002)(2906002)(83380400001)(478600001)(53546011)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 10:30:56.0211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c5bc94-5080-4ac3-26e5-08d963c59816
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3581

SGkgSnVsaWVuLA0KDQo+IE9uIDE5IEF1ZyAyMDIxLCBhdCAxOjI4IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMTkvMDgv
MjAyMSAxMzowMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBDb21waWxhdGlvbiBlcnJvciBpcyBv
YnNlcnZlZCB3aGVuIEhBU19QQ0kgaXMgZW5hYmxlZCBmb3IgQVJNDQo+PiBhcmNoaXRlY3R1cmUu
DQo+IA0KPiBUbyBiZSBwZWRhbnRpYywgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZSBpcyBu
b3QgYSBjb21waWxhdGlvbiBlcnJvciBidXQgdGhlIGZhY3QgdGhhdCB0aGUgUENJIG1hbmRhdGVz
IGhlbHBlcnMgdGhhdCBkb2Vzbid0IHlldCBleGlzdCBvbiBBcm0uIFNvLi4uDQo+IA0KPj4gQWRk
IGRlZmluaXRpb24gZm9yIGFyY2hfaW9tbXVfdXNlX3Blcm1pdHRlZCgpIGFuZA0KPj4gYXJjaF9w
Y2lfY2xlYW5fcGlycXMoKS5JbXBsZW1lbnQgZHVtbXkgZnVuY3Rpb25zIGZvciBwY2lfY29uZl9y
ZWFkKigpIHRvDQo+PiBmaXggY29tcGlsYXRpb24gZXJyb3IuDQo+IA0KPiAuLi4gSSBhbSBub3Qg
cmVhbGx5IGluIGZhdm9yIG9mIGFkZGluZyBkdW1teSBpbXBsZW1lbnRhdGlvbiBoZXJlLiBJbnN0
ZWFkLCB0aGUgc2VyaWVzIHNob3VsZCBiZSByZS1vcmRlcmVkIHNvIHdlIGFkZCB0aGUgcGNpLWFj
Y2VzcyBoZWxwZXJzIGZpcnN0IGFuZCB0aGVuIGVuYWJsZSBIQVNfUENJIHRvd2FyZHMgdGhlIGVu
ZCBvZiB0aGUgc2VyaWVzLg0KDQpPay4gSSB3aWxsIHJlbW92ZSB0aGUgZHVtbXkgZnVuY3Rpb24g
aW1wbGVtZW50YXRpb24gZnJvbSB0aGlzIHBhdGNoIGFuZCB3aWxsIGVuYWJsZSB0aGUgSEFTX1BD
SSANCmFmdGVyIGFkZGluZyB0aGUgUENJIGFjY2VzcyBmdW5jdGlvbnMgcGF0Y2ggYW5kIG90aGVy
IGJpdHMuDQoNCj4gDQo+PiBwY2kuYzogSW4gZnVuY3Rpb24g4oCYZGVhc3NpZ25fZGV2aWNl4oCZ
Og0KPj4gcGNpLmM6ODQ5OjQ5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYcGNpX3RvX2RlduKAmTsNCj4+IGRpZCB5b3UgbWVhbiDigJhkdF90b19kZXbigJk/IFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPj4gICAgICAgICAgICAgcGNp
X3RvX2RldihwZGV2KSk7DQo+PiBwY2kuYzoxODogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcGNp
X2NvbmZfcmVhZDE24oCZDQo+PiBwY2kuYzo4ODA6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFy
Y2hfcGNpX2NsZWFuX3BpcnFz4oCZDQo+PiBwY2kuYzoxMzkyOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBhcmNoX2lvbW11X3VzZV9wZXJtaXR0ZWQnDQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBT
aW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9NYWtl
ZmlsZSAgICAgICAgICAgICAgIHwgIDEgKw0KPj4gIHhlbi9hcmNoL2FybS9wY2kvTWFrZWZpbGUg
ICAgICAgICAgIHwgIDIgKw0KPj4gIHhlbi9hcmNoL2FybS9wY2kvcGNpLWFjY2Vzcy5jICAgICAg
IHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICB4ZW4vYXJjaC9hcm0vcGNp
L3BjaS5jICAgICAgICAgICAgICB8IDMyICsrKysrKysrKysrKysrKw0KPj4gIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jIHwgIDUgKysrDQo+PiAgeGVuL2luY2x1ZGUvYXNtLWFy
bS9wY2kuaCAgICAgICAgICAgfCAzMyArKysrKysrKysrKysrKy0tDQo+PiAgNiBmaWxlcyBjaGFu
Z2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2FyY2gvYXJtL3BjaS9NYWtlZmlsZQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC9hcm0vcGNpL3BjaS1hY2Nlc3MuYw0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4v
YXJjaC9hcm0vcGNpL3BjaS5jDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL01ha2VmaWxl
IGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+PiBpbmRleCAzZDNiOTdiNWI0Li4wZTE0YTVlNWM4
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+PiArKysgYi94ZW4vYXJj
aC9hcm0vTWFrZWZpbGUNCj4+IEBAIC02LDYgKzYsNyBAQCBpZm5lcSAoJChDT05GSUdfTk9fUExB
VCkseSkNCj4+ICBvYmoteSArPSBwbGF0Zm9ybXMvDQo+PiAgZW5kaWYNCj4+ICBvYmotJChDT05G
SUdfVEVFKSArPSB0ZWUvDQo+PiArb2JqLSQoQ09ORklHX0hBU19QQ0kpICs9IHBjaS8NCj4+ICAg
IG9iai0kKENPTkZJR19IQVNfQUxURVJOQVRJVkUpICs9IGFsdGVybmF0aXZlLm8NCj4+ICBvYmot
eSArPSBib290ZmR0LmluaXQubw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvTWFr
ZWZpbGUgYi94ZW4vYXJjaC9hcm0vcGNpL01ha2VmaWxlDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uYTllZTBiOWI0NA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIveGVuL2FyY2gvYXJtL3BjaS9NYWtlZmlsZQ0KPj4gQEAgLTAsMCArMSwyIEBADQo+PiAr
b2JqLXkgKz0gcGNpLm8NCj4+ICtvYmoteSArPSBwY2ktYWNjZXNzLm8NCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vcGNpL3BjaS1hY2Nlc3MuYyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWFj
Y2Vzcy5jDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uYjkz
ODA0N2MwMw0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9wY2kt
YWNjZXNzLmMNCj4+IEBAIC0wLDAgKzEsNjEgQEANCj4+ICsvKg0KPj4gKyAqIENvcHlyaWdodCAo
QykgMjAyMSBBcm0gTHRkLg0KPj4gKyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4+ICsgKiBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24g
MiBhcw0KPj4gKyAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0K
Pj4gKyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+PiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3
aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YNCj4+ICsgKiBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlDQo+PiArICog
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCj4+ICsgKg0KPj4g
KyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlDQo+PiArICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNl
ZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+PiArICovDQo+PiArDQo+PiArI2lu
Y2x1ZGUgPHhlbi9wY2kuaD4NCj4+ICsNCj4+ICtzdGF0aWMgdWludDMyX3QgcGNpX2NvbmZpZ19y
ZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZW4pDQo+PiArew0KPj4gKyAgICByZXR1
cm4gfjBVOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBwY2lfY29uZmlnX3dyaXRlKHBj
aV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBsZW4sIHVpbnQzMl90IHZhbCkNCj4+ICt7DQo+PiArfQ0K
Pj4gKw0KPj4gKy8qDQo+PiArICogV3JhcHBlcnMgZm9yIGFsbCBQQ0kgY29uZmlndXJhdGlvbiBh
Y2Nlc3MgZnVuY3Rpb25zLg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNkZWZpbmUgUENJX09QX1dSSVRF
KHNpemUsIHR5cGUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+PiArICAgIHZvaWQgcGNpX2NvbmZfd3JpdGUjI3NpemUgKHBjaV9zYmRmX3Qgc2JkZix1bnNp
Z25lZCBpbnQgcmVnLCB0eXBlIHZhbCkgIFwNCj4+ICt7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4g
KyAgICBwY2lfY29uZmlnX3dyaXRlKHNiZGYsIHJlZywgc2l6ZSAvIDgsIHZhbCk7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcDQo+PiArfQ0KPj4gKw0KPj4gKyNkZWZpbmUgUENJX09QX1JF
QUQoc2l6ZSwgdHlwZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQo+PiArICAgIHR5cGUgcGNpX2NvbmZfcmVhZCMjc2l6ZSAocGNpX3NiZGZfdCBzYmRmLCB1
bnNpZ25lZCBpbnQgcmVnKSAgICAgICAgICAgIFwNCj4+ICt7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0K
Pj4gKyAgICByZXR1cm4gcGNpX2NvbmZpZ19yZWFkKHNiZGYsIHJlZywgc2l6ZSAvIDgpOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArfQ0KPj4gKw0KPj4gK1BDSV9PUF9SRUFEKDgs
IHU4KQ0KPj4gK1BDSV9PUF9SRUFEKDE2LCB1MTYpDQo+PiArUENJX09QX1JFQUQoMzIsIHUzMikN
Cj4+ICtQQ0lfT1BfV1JJVEUoOCwgdTgpDQo+PiArUENJX09QX1dSSVRFKDE2LCB1MTYpDQo+PiAr
UENJX09QX1dSSVRFKDMyLCB1MzIpDQo+PiArDQo+PiArLyoNCj4+ICsgKiBMb2NhbCB2YXJpYWJs
ZXM6DQo+PiArICogbW9kZTogQw0KPj4gKyAqIGMtZmlsZS1zdHlsZTogIkJTRCINCj4+ICsgKiBj
LWJhc2ljLW9mZnNldDogNA0KPj4gKyAqIHRhYi13aWR0aDogNA0KPj4gKyAqIGluZGVudC10YWJz
LW1vZGU6IG5pbA0KPj4gKyAqIEVuZDoNCj4+ICsgKi8NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vcGNpL3BjaS5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2kuYw0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLmRjNTVkMjM3NzgNCj4+IC0tLSAvZGV2L251
bGwNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLmMNCj4+IEBAIC0wLDAgKzEsMzIgQEAN
Cj4+ICsvKg0KPj4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBBcm0gTHRkLg0KPj4gKyAqDQo+PiAr
ICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnkNCj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcw0KPj4gKyAqIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0KPj4gKyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+PiArICog
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YNCj4+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UuICBTZWUgdGhlDQo+PiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4NCj4+ICsgKg0KPj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBh
IGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlDQo+PiArICogYWxvbmcgd2l0
aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uDQo+PiArICovDQo+PiArDQo+PiArI2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4+ICsNCj4+ICtp
bnQgYXJjaF9wY2lfY2xlYW5fcGlycXMoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAg
IHJldHVybiAwOw0KPj4gK30NCj4gDQo+IFBsZWFzZSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcg
d2h5IHRoaXMganVzdCByZXR1cm5zIDAuDQoNCkhlcmUgaXMgdGhlIGNvbW1lbnQgdGhhdCBJIHdp
bGwgYWRkIGluIG5leHQgdmVyc2lvbi4NCi8qDQogKiBSZXR1cm4gMCBhcyBvbiBBUk0gdGhlcmUg
aXMgbm8gcGNpIHBoeXNpY2FsIGlycXMgdGhhdCByZXF1aXJlZCBjbGVhbnVwLg0KICovIA0KDQo+
IA0KPj4gKw0KPj4gKy8qDQo+PiArICogTG9jYWwgdmFyaWFibGVzOg0KPj4gKyAqIG1vZGU6IEMN
Cj4+ICsgKiBjLWZpbGUtc3R5bGU6ICJCU0QiDQo+PiArICogYy1iYXNpYy1vZmZzZXQ6IDQNCj4+
ICsgKiB0YWItd2lkdGg6IDQNCj4+ICsgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwNCj4+ICsgKiBF
bmQ6DQo+PiArICovDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYw0KPj4gaW5kZXgg
ZGIzYjA3YTU3MS4uZmRlYzFjNTU0NyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9pb21tdS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
aW9tbXUuYw0KPj4gQEAgLTEzNSwzICsxMzUsOCBAQCB2b2lkIGFyY2hfaW9tbXVfZG9tYWluX2Rl
c3Ryb3koc3RydWN0IGRvbWFpbiAqZCkNCj4+ICB2b2lkIF9faHdkb21faW5pdCBhcmNoX2lvbW11
X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICB7DQo+PiAgfQ0KPj4gKw0KPj4gK2Jv
b2wgYXJjaF9pb21tdV91c2VfcGVybWl0dGVkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+PiAr
ew0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+ICt9DQo+IA0KPiBQbGVhc2UgYWRkIGEgY29tbWVu
dCBleHBsYWluaW5nIHdoeSByZXR1cm5pbmcgdHJ1ZSBpcyBhbHdheXMgZmluZS4NCg0KSGVyZSBp
cyB0aGUgY29tbWVudCB0aGF0IEkgd2lsbCBhZGQgaW4gbmV4dCB2ZXJzaW9uOg0KDQovKg0KICog
UmV0dXJuIHRydWUgYXMgaW9tbXUgdXNlIGlzIGFsd2F5cyBwZXJtaXR0ZWQgaWYgbWVtLXNoYXJp
bmcsIA0KICogbWVtLXBhZ2luZywgb3IgbG9nLWRpcnR5IGZ1bmN0aW9uYWxpdHkgaXMgbm90IGVu
YWJsZWQuDQogKi8gDQoNClJlZ2FyZHMsDQpSYWh1bA==

