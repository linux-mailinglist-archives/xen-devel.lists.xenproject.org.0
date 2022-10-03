Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A835F303F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 14:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414875.659293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofKTC-0005a6-IN; Mon, 03 Oct 2022 12:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414875.659293; Mon, 03 Oct 2022 12:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofKTC-0005Xa-FE; Mon, 03 Oct 2022 12:22:50 +0000
Received: by outflank-mailman (input) for mailman id 414875;
 Mon, 03 Oct 2022 12:22:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bYUz=2E=citrix.com=prvs=2680ed0a5=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ofKTB-0005XU-EP
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 12:22:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1486ae77-4316-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 14:22:46 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2022 08:22:33 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BY5PR03MB5014.namprd03.prod.outlook.com (2603:10b6:a03:1e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 3 Oct
 2022 12:22:29 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc%7]) with mapi id 15.20.5676.030; Mon, 3 Oct 2022
 12:22:29 +0000
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
X-Inumbo-ID: 1486ae77-4316-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664799765;
  h=from:to:subject:date:message-id:mime-version;
  bh=HSHZmj61xvJNi5ELYPNW1YMrni+2a5ZAWKeGASPDiaQ=;
  b=g3AqjFIEk0LJtaWbEp1jem26fKbMBgWLvpegfZtMcPoApkLElvbXsO9z
   G3Sm/gIksaK2pQJ1aYgN28LhBZH7+CIZL+LCa/62fO3MDXcWUo8ZLmyXN
   nac982AcqNVureIOHeSZXn+6cX0FLOihfDcCgvrzvGk9RkOfNQL93kEil
   U=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 80969980
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
 jIYcd73jjyEhOyg3CM5Osw=
IronPort-HdrOrdr: A9a23:09VWCqnSofTPSKZwbKA+mk+sribpDfOvimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7Sc+9qADnhOdICOgqTP6ftWzd1FdAQ7sSibcKrweAJ8SczJ8U6U
 4DSdkYNDSYNzET4qjHCWKDYrUdKay8gcWVbJDlvhVQpG9RC51I3kNcMEK2A0d2TA5JCd4SD5
 yH/PdKoDKmZDA+ctm7LmNtZZmIm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYZ93
 TfmQCR3NTvjxj78G6R64bg1eUZpDLT8KoDOCVKsLlUFtzYsHfmWG2mYczAgNl6mpDs1L9gqq
 i1n/5pBbUJ15qWRBD/nfKl4Xic7B8+r3Dl0lOWmn3lvIjwQy87EdNIgcZDfgLe8FdIhqAJ7E
 rat1jpzaa/ICmw7hgV3eK4Ii1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdQHI0bFCz35Yg7GK
 02Zfusksp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIgUn2sG9pg6V55Yjt
 60RZhAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaILVHuBMg8SgHwQl7MkcUIDc2RCeI1JcEJ6e
 j8uXtjxBEPUlOrD9GS15tW9R2ISHmhXF3Wu7Bj26Q=
X-IronPort-AV: E=Sophos;i="5.93,365,1654574400"; 
   d="asc'?scan'208";a="80969980"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwgBGdAPwG7Zt83B+3wh4YYd2dWC8KihDStNRSApYUYLWCv4rg4v3QIIVF3OcAFyfplbMiJ8pJgHkO8fKNX1dGYI6FfBKHSUfVBt+hYBYPVZJvscCPwgO3YTvohnAeSXuQ1bwbtur5Q/L2I3L1/p0sY6yPvJQlSa3LlcFoub4Wo1xc34lHYHVCnPs/XgNiGkx+eYkVPXOy2be2fDlOqloaFtyuUhqY4dJFfsC4fgjzu9A+kIBUPjJZg44lNv9javljJf7IvITov+9CTItsDHeNNrkuClDs5j7/LJCK+qgciEMtNFONBJQIK8pAJFm3CHA0/MThoLD+2pSsr2b8sFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsVSkuwTG9V9qos4Ct05n15GcxBPPEPXMnZvF5Q1zww=;
 b=cIVgyjaMGok/wI5XuoJfJ2GLE9IQECun2XBdaiCI/QkfZ5U5HG0/zd4klQ3x2HI/9aWchAQmVFYwtdceU440664tt4+Juw22ySMZQQgdd3pOkFwRLxGC5UKmPpZmF6K2hTdYrwvbilEKfywV8MZf6OSNES/YEgOvrZ+ebrefvz44Ayu8gt9m4NjfDLMHdqsIRrW6rONK5NiXLreQoY+QWxpNJcS7LwHhoEcnPNPT6o65EvLHqMD3C8fsFF+/4JsN8H89K4NDYxn2tY3TsznKbaCqGen1BAOMMSCEFKStos6bkR6+RhMM9yo7ruqXU271oXVE0YiVG47N9JDWAN5oNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsVSkuwTG9V9qos4Ct05n15GcxBPPEPXMnZvF5Q1zww=;
 b=TkCWalCJao4jPRtwyICOme563fpR9MyoVF+fFugTwDNNGNa33Z/Xk0TTG9g5pB8Y05O7P7MoTwEzZ2dIHsGSET3kf0FWTWi5KGE8JeOr3SER7vKfLF41r2K5a0r9HEJpsQKACKW9RXNQ7DvY5DTjZkPc32zpCcf4kW2lv79bNI4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Zhiming
 Shen <zshen@exotanium.io>, Xenia Ragiadakou <burzalodowa@gmail.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: [ANNOUNCE] Call for agenda items for 6 October Community Call @ 1500
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 6 October Community Call @
 1500 UTC
Thread-Index: AQHY1yLNNm1KBLLYsk6cKKHNRLx+9g==
Date: Mon, 3 Oct 2022 12:22:29 +0000
Message-ID: <75450DE8-EE95-4ECB-B931-8C820D124EF3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|BY5PR03MB5014:EE_
x-ms-office365-filtering-correlation-id: d3735be4-f5b7-4a3f-ac96-08daa539f086
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0jdfHel0uSYPHJO4WxnaxplEwGe0u8zxhr3sJ1qyuUIXkNH3Stz6LiqCGFkjqP7/fsbMS+rmXRgYpECW+Lm2FetjPaoCyqxwmTutHN3wwd8BzzmDMrsN3irSYR6KNlAsj5GLSd32XXTaF0pgxODdxEqDGG8QcwCHejn1yyWfSCn1PEkhVrwKTwqhqJllq6FvyyLyA3DREtUQP9WxBnkVcDSwQ1+/4OBNerWE7rwIX2aptEqWR6HRSFqWVIHV7ibYoUXcxRpM+M3AYmoe2/TP0c/gGVS0yA4B9lRczXS+jLmh7PHT69vHoxiNLVA2RwRO8JPf5L6DFV4sDs13iLzQJ3999lzT7OhCvJvLENIy7tmjWyRMVVFuGndKmZhzpXo3db0++jLcygvoqAtjBrf4TXR3qbUK/z9U/8oYQWrNqlZeJ1Y/on59Ueb9MdBEdGsU73vjxFYzwuW1OcSdAl+QI1TW7vGUmYKtob1KMFILxeRLR0VvbXj/wb+4FVtdTpqk7VDqWHgiiHoXlvYavAZrsny5DD7zYXz0UahMtij/agVmob4a+voTUmea51NQPwbjvEHUkmXQMnk7rX687o0ovKB+nyMramM/YTeBf3Q5LfAKYWX04iTiUqnxabWzufe71qgj2FESiw8nFalJKE/NpFaptPXxu/s9WB59u5UjYAUe2baDuMygdqvx6Uqpwsb73c508bJwNJCXnQqpZ6Zz7Dy49XCH5LFkKATAey3KscYuS7cltwQH1fWKqXDNrhjfcMmIyxM9s1wrA9vwXSSA9Xqbx22Fm2kTyGuHoGxjeMBwQBTgtEzW66+gG7WYjhBIv6EyEND4S6HFqK+g2q81GarMdxtgp5xUb0mbEfITmxpP9U4SEcWnzxI26GBoYmpkumBV/OnmIrvJyLWryyszJWbXYG4SB2+ps7UT7bAb0QU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(451199015)(478600001)(36756003)(33656002)(110136005)(86362001)(38070700005)(122000001)(921005)(99936003)(7406005)(7416002)(186003)(83380400001)(38100700002)(2616005)(82960400001)(66946007)(26005)(2906002)(41300700001)(71200400001)(5660300002)(966005)(316002)(76116006)(66446008)(6486002)(91956017)(6506007)(8676002)(66476007)(64756008)(66556008)(8936002)(6512007)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1VyZjFQYm1UcUpsUzkzazRsYU5qTjNxQzl0RENoRDhnZTdVOUxFWUpqN2xl?=
 =?utf-8?B?ZWpMQy9zaEpnZkdaeVdQN2pSMG5aWmMySi9Uay9sMlhJSzUwNWgrcjBSQXR4?=
 =?utf-8?B?enRWRTN6aDAvdjdsbGxMU2t2dWM1UlhldW1FaEtqbngyclZGVXBCL0syV1kz?=
 =?utf-8?B?ODRacWRhcHdMdWNRUGN3WFhlQ1FmNUtZdEZ0cTA1M1BsL2RCbFJTc1U2Q3VW?=
 =?utf-8?B?Z2d0MDQvaUEweWZLRi91bkEwTitaRTdvclFOdHBMN296eUVrUnIrWHFSQWVm?=
 =?utf-8?B?NWl5bHQ4QUJpK3k3b1IzNFB1WU0yc1ZZMjJKMXUrMWk0b0h2c2tYekptZDZ1?=
 =?utf-8?B?U2UwUUlBZ1FHczdaeEdPeDlmbXZBQ3FoN1dFU3FmRkhLYlN6S0Q5TjQ5SDlP?=
 =?utf-8?B?WXhPeFdPcG5OcG83SW1yOE1SbnA2STZtSkRKZHVNQWlnbXFkczRPL1poRU05?=
 =?utf-8?B?aERsTGIrT2dZRDAyd012WUdpRGczODh0ZElBcnVzQU9jdFU0cDMwRWFrZjJJ?=
 =?utf-8?B?OVpIVlJPbEZjQ3BMZGx2Q1V5VUEwdVQ0NFl0cmVrcStCTGZrL2xRYm5DYmNl?=
 =?utf-8?B?MG45ZjZZTXpZMUdITzd1YmdDSzA5Q3BEYkFvNHBmZUk3WUVDL0Z4RC9wQkYx?=
 =?utf-8?B?T281c3BOTXdCbStVTmhtNVE4K1JhdHd1b241Q0YrMDJpOFhJT2N1NklIdzRL?=
 =?utf-8?B?OGdZS0VWSFFOU1A5SzF3WkxaWlErVEhLLzhkODVvU0RtQWlzTXBDdjJMVVpU?=
 =?utf-8?B?c2ZkcnF6UFQyNm1jWm1sVHFxK2lQTk9xNUNsWTZGbk9VUFY0dnlxRHZqaGZr?=
 =?utf-8?B?UHdnR0lzNnRmaDlETW9mbkNHcXVyME9pRzBPc2ExbUtBSmZjTytWa1ZoNndt?=
 =?utf-8?B?MGd0YTFpZnJjbkdJbDFFR1FJcVMyWjRjY3NpZHhVVjNTMExKN1A5cWNucXZn?=
 =?utf-8?B?bDJBYlFXL2kyQ2VydFR1eXRKVklrbVZycHQxQ0NqU3VRVGNHYnlvTjNtZXE2?=
 =?utf-8?B?U2NGS2FoWHZXdEJWZ2FrZzlkaDQwaFNtbEl3UG9jTFp6OXFRUExIYmVpdVQx?=
 =?utf-8?B?ZmpzU0hUcWxwb09VeHRncmJhN2sweS9ENk1qejVyaEFjMEF6NVR2TmNkaXJM?=
 =?utf-8?B?ckhCTllsV3Z6b3RvMEtkV2IzWHdJWEdjNC9hNy9MLy9tTEs5MlViWmtvQ1JO?=
 =?utf-8?B?U3lVMDlJUXBOaHg4eFRCamwrZVpvbTF5SGV6cWVVZlNlK3ovQnN5SFBuWS95?=
 =?utf-8?B?aGJ1ejZCN2VETDNZSVA5VFRObmlHTDZFNGw5NFR3ZjNjcVBIM1lweGp3MDJB?=
 =?utf-8?B?L3A1ZkxNNEhBclZXUnR5VzdxejJpaGlkUkYrV2RWRk4xbXAzTEN6Z3RRMkYw?=
 =?utf-8?B?S2lFeDNSRWhZcEVFZlEzRmRZdk1BYTEyY3VKS2ZJOHZoTDVVVXRMMlRoemh4?=
 =?utf-8?B?T3RxR1JwRzdvWC9NZ0ljUzlZT09sQkVIazdzbzUzWWhmQmtvcHV0VEpJVnF2?=
 =?utf-8?B?R1lzK214YW1YcFF6U0tBOXRDOHN3dmIrakNxRktkZDRnbUo0S3hKRnJJMUVF?=
 =?utf-8?B?eUliZW00Skk5NEpJZ0VxVjB1YWJOTHlLWGFycGlWbmtaSzMzVjA3RDFYc2w0?=
 =?utf-8?B?VU5vb1Y5K2xmektvMFZkb0R6djhaMlA4SmtWMlNBVWZyRE1KYzQxQ2FPam81?=
 =?utf-8?B?Mll3MnlKMklwZm16UkI2NE1oSlNPVG54TXBORHZsL2JKUjYwRHRuVEkwNWho?=
 =?utf-8?B?WEpHMVFXdXo5MHZFSXhWNGlsMFJNcGg0MWVpcUJnakMrcXEzS29sVmg4Z3ZF?=
 =?utf-8?B?K0RsUjhhU1dZUGlHUk1vRjdtcWhCRHFGVXpqcENnZFVmNDRJNmxmbmdtV2R3?=
 =?utf-8?B?MXpaQ3J1YTkrNUJwOUdiOEg1T1BiQ0xmZjMxYmxpUGFWVkU0YzVBVjFlck1P?=
 =?utf-8?B?QlVsb0ZJU01SMy9iMFYvRlBaTnFNbXZtVDJjcVlBY0R2TnJETUNzbFQyU3VP?=
 =?utf-8?B?T3B3UHI3ck1OVmhYemQ4aVIydHdZSVl1ZUxKUkt5VHhOTUpNNnpOd3V5WlM0?=
 =?utf-8?B?UkszYnRhSDZSZGYzSFdDd2hqM20xUWhpS1NPbmRYL2NBb3pmZUpRRURIeXRk?=
 =?utf-8?B?anVBVEVSSEszZnJSQUFKb0VhVDNKbU8zckptV2pjeXVNcmQwUFQwUHN2VlI3?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_66FC531F-93A2-4753-99A0-B45DF9E58451";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3735be4-f5b7-4a3f-ac96-08daa539f086
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 12:22:29.3109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uM2/h3So+lEfp0KVcqvfnUGAybdvC/6U0pKMeOxXPLf/k9uIXY4IqxFTs2sYAB9fq4R275+NBWy9jBpNnURTKfO71YqyA9Evsb4cZ1vMxQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5014

--Apple-Mail=_66FC531F-93A2-4753-99A0-B45DF9E58451
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/aNcW2L+HFp6WK9eJRssbsPLu/ and you =
can edit to add items.  Alternatively, you can reply to this mail =
directly.

Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a =
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the =
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate =
time to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the =
sign-up-sheet at =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George



=3D=3D Dial-in Information =3D=3D
## Meeting time
15:00 - 16:00 UTC
Further International meeting times: =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D10&day=3D6&hour=3D15&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall


--Apple-Mail=_66FC531F-93A2-4753-99A0-B45DF9E58451
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmM61AQACgkQshXHp8eE
G+2VhggAn0QmNBOVGrSM3SoildIqbyw2Z9173EfJBX+TXYE6Rl7hbITq02wY2GpR
dyc8NJDklNjcgNLK+BWhYedbCXOP1RX+wR4Q68RD0B1NQBFrsHU6OPSmD39drGe6
SIz9hcqmUmbiAGGSwzfKLIp/mHa3J4PHIARADksdc6SxGZW+uxyDxewW4MKRQigt
CrkF3usnojMUeQxYtAuHeedXTFVd4y6pc5ifW1eIYo/qYG8TskZ1bFkW4LuN+TEW
2bdNaL6qSqUkpWwlLyqenl9eRju3WpfBXuzy+5J/YuTXUZJnizHvMjbyHLvLB9Jv
A0A8dbiCzNeZlY/FC7451JqECX08sg==
=un5v
-----END PGP SIGNATURE-----

--Apple-Mail=_66FC531F-93A2-4753-99A0-B45DF9E58451--

