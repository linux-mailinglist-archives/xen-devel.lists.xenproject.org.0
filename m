Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F85654F7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 14:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360275.589616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8L1l-00029m-69; Mon, 04 Jul 2022 12:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360275.589616; Mon, 04 Jul 2022 12:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8L1l-00027I-2x; Mon, 04 Jul 2022 12:18:09 +0000
Received: by outflank-mailman (input) for mailman id 360275;
 Mon, 04 Jul 2022 12:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3vMG=XJ=citrix.com=prvs=1772db869=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o8L1j-00027C-GS
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 12:18:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59ded932-fb93-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 14:18:04 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 08:17:55 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SJ0PR03MB6873.namprd03.prod.outlook.com (2603:10b6:a03:438::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 12:17:53 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d%3]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:17:53 +0000
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
X-Inumbo-ID: 59ded932-fb93-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656937084;
  h=from:to:subject:date:message-id:mime-version;
  bh=2OHgIT5EOr7joMDp6S247G2c9MIE15EEPjjCabZTDv4=;
  b=gsWijfXs4aQ4LLK4rX4wUpoPmzhxBjM6DaMh202Kgezgv8pEyodH8hTF
   lHaiET5/C3nTqGF40dbXJZjtDmaD9KIWge4jomAvUJ+xwe6omidMo+aYW
   gAGVkESUoq4Gv2nOVB0evKsTw+wjr++VL0VFv3g7r6eRjKU+0gu7VklB3
   M=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 75028812
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:I6VptaDtH+uqforlHegvsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssQIb6Km90ci7MDrhHPtOjbX5Uo3SODUO1FHIEGgA1/qr/9SDIVyYygc178
 4JHMZD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5dv2/jNId0VHeqtg5wB2BkKwCUttXjRLApI/Cd
 61+tdHjyDIQwVcUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmj2AsEWT8n+8ZuzY
 GFqX202kyQiYD09vbu7R6T032Qoqqg9jJ3Pr3CtiHSEESutu/nXvUiZ1TIhkFMnAjm0idQrD
 CLmWZqAy070QKtQkil5RTqwAXuyzAo9jvrzkKZm2LqpYjjSCs9ENcpv/MsTvNIg3BQxu2U/Z
 g7rV5xjaAneC/ojWD4/ZzFRhtqnk27rT4rlvMSlWVWVc8bZKVKpYIS8UtJGNNYdRiKnrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23xdnWx/zUEf2MsD901wg64VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+tBmnEUXv3QRGvyJTcZdE60l722uHKCe8OlZ2XkbQzveUPsY
 WEVk9EvmgvfE+rAdGS3fRwg2HwfFk=
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="asc'?scan'208";a="75028812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4brYjPmNSIjUAa1aRh/VzBIrGJbiS8pXGx5HvWWP8UQRnSbdXGnno8igEw6TWawW5rAg4IajJ6+PCrHo5AcSFYRJpC2HCm7LfLNBl7K1VzJxO9NFjiIGM7lKhVUA6cD6ffRDMfowPrtKrjv7Ay8Brvt7JgOb7mD+Mllo6PwFApiJhG8OsX1oM+ChozKaIgJkRsqEe2DUbauqsRqTzxqLucYArH1lDXSEc3Wbm74+pFz5Y6RqJ7IyyrTZXpfczoeqQdNRLOmQV5ky6xxmdTEsfsvNaOPLIDzwMysCdKQUp58NbYjhI6SYW0fwuQsQGLpW1EDLfLRIWE5wHLahN9dWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGgNf3cEJI4umY9hOvdxmPiYwQu4XkC4TlcL10+VVic=;
 b=SI7ZJJI3+406JHPU6kMO4AGqCH7xY5Q1kQY10noD5h6mFQkGBvUc/NibHWF9gSID/jXDuHGfcwQO/uX/EnF3kw14kGKiV8109vVVWvIwKkSpIRYf42Os3u15tSXfOyIZNT3gwR8eDyOVnkLraP+djM8MT0vhB6j4XqAslr3mf6VXr38wZ3Bm0WpCM8cOLDjlGSUU3/BZfFxU4gqwUlms8L6Vh3Dcazq3Qr8TwxcEyJ8HQA0F46CiYClFttWRXZCfv3Rb9irfN+S8Q7bTS1K1VUPQ2wOwqLxGnB87KrVDZzBORvY0IStiFDKzK8gfXkkfzB6tDoLBWG1RUMgfR2oSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGgNf3cEJI4umY9hOvdxmPiYwQu4XkC4TlcL10+VVic=;
 b=M9L0AspkP1nYY2+k7uJl2RYfbbWlfuVNUEwVEtFz2GTXh7nhQJugENDzhRt1QFgU7HYK2iY6Ng0g/uQwPrvzqvxQlWlMCNMlHzyxGlpGa+pczYjR26NdfDiG42n56ZrZtqMzcUcbukUGAbTW31uLBpOtLJtXv/ldF/GvugiQ1Kk=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
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
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@arm.com>, Zhiming
 Shen <zshen@exotanium.io>
Subject: [ANNOUNCE] Call for agenda items for 7 July Community Call @ 1500 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 7 July Community Call @
 1500 UTC
Thread-Index: AQHYj6AVCd6Yowuo2kqP8Y/E7lhxgQ==
Date: Mon, 4 Jul 2022 12:17:52 +0000
Message-ID: <8ACFF8C7-9912-49ED-9FA4-EB46AC5928BF@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e831f9e6-e8c7-4996-ec99-08da5db7382f
x-ms-traffictypediagnostic: SJ0PR03MB6873:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
	=?us-ascii?Q?eAhlfZr/Qk8D+Iz2RA0VhS2URvzPHelw+xXxndZ0ZFvPj4JDeS8Ub6s0lhWE?=
 =?us-ascii?Q?q0EDL2bWwyJbzphhh+hkDFS1uUiPaqD9eL3YDmr79p35Br8+WYLLZ6hbt+Qi?=
 =?us-ascii?Q?ONhMSUXAzAekt8TwApEt3OwT5UDUrKnBt6QxbT0iAN0rIEFVmVajITU6QsU/?=
 =?us-ascii?Q?EFOGUPJ766RVvZh5wSS15LxGGivxUI43fspI4ANGeLHvphQkzYVAv56x1OPA?=
 =?us-ascii?Q?uUbUZullqgVoS36MhSpKVbvKjVvjMROgDkZxI0M6bPbaGAxi+VMY37J8CxNu?=
 =?us-ascii?Q?RQna+4Sx7i2ZUeokIMuP+YT9QdUOUKcp3CyVT/y201WniBZh1SbaNzBsi3Yz?=
 =?us-ascii?Q?t6oC1tZ8Tem60HoISFhBVqjkBJGGyNJXgsD9mkZGbXt//2ZRiK0ZhxfeYO23?=
 =?us-ascii?Q?jaxqTHWC3Zf9wHcXbpnBkPT77ROJw6KvXijos0Dskf6bUQZHGQGMbdNmCf/K?=
 =?us-ascii?Q?1cysA9BCWivk9W16vCQzdl3hC61KmLNrz7kLYYdMPe1ciKTh7YVXgMR5dECa?=
 =?us-ascii?Q?Vofh+jEcPW9yYgt5JdcTPVnza36+bm1Wz9rhdBK+F2k1Mjhl8J0lEDi3Myof?=
 =?us-ascii?Q?SDXOeKZqneQGUoVTKQwGUCKbhmzgVjlMfpELtM7Z0F97aAPMQS60KGZLDEch?=
 =?us-ascii?Q?echY5n1OKMccFoJxfAUXO6UInDHi9qeh0xiz4ftBuyE2Hfr9f3DURfx7sf7e?=
 =?us-ascii?Q?sQ9LjIvV4oTp3m4KqnB9+JZVwHCY3Oe/DPzX1Dck/bQrIlEa51Q+HlktK7W9?=
 =?us-ascii?Q?8VnapJoTNEYgGGYLfEW9fQCigKu6ABNePrx4kEWd8mmAgzPJboM+klNBJhtH?=
 =?us-ascii?Q?aHAj52f13W47y0TOu/SWCPoLN5XE16DrbwKHZs2wIcW+v6W3qS7GORT3LSXH?=
 =?us-ascii?Q?c/rJ2wGLT4y1SPJTj1LFNWS3NO9gWhAPty/WQzrDjaQviHjIWb9TQROF5nzh?=
 =?us-ascii?Q?xNkBUxUw0MQqEOW7qJ7s9w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(83380400001)(921005)(2616005)(33656002)(38100700002)(82960400001)(5660300002)(7406005)(36756003)(7416002)(2906002)(186003)(8936002)(86362001)(64756008)(26005)(66446008)(316002)(76116006)(966005)(6512007)(6486002)(478600001)(66946007)(38070700005)(122000001)(91956017)(41300700001)(8676002)(66556008)(6506007)(66476007)(99936003)(110136005)(71200400001)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVR2TmhJY1RYa2JEUCtEbis3WjFIOWFveTRMTmZEenhaRGhkTTE3R1NqWHNZ?=
 =?utf-8?B?OWtqV0ZNc2NRT3Nud3REWkhiR1FpUFZVekFjWG96MUZGWmc1MVVkeXlpeDdB?=
 =?utf-8?B?dmtYQXU1YjhibXh1LzAzanBaaW5Da25aQU04SlNhQ1JkVTkxUFlZK1dNWThu?=
 =?utf-8?B?ODhXMllKOG1jTkRJRUF5QmVKMjFkSmM2VHdlSHJJaEhWZlV1VVVQQndVbGk4?=
 =?utf-8?B?T1dZait3Q1FYY1JhaVBFY0dRcUtJYTFjbFpRWnRmcTFrZHh5Wi9kZ3JlZGw4?=
 =?utf-8?B?WnFYTG9ydGlPcENreHkzUVh5QjRUR0ttbzh6QXZId3lHN25Gc3lvQi84V2cz?=
 =?utf-8?B?VXRwWlptL0N1ZlRRWVV5WEZYUTl6YThwL0NNMnJlZ0RJcC9oaGZVSk5yWTIy?=
 =?utf-8?B?enduRFF3TGswREFna0x0UU5IYm9TbVVWa3VEbXVvbDVPL3NScWE4UFZVMnRo?=
 =?utf-8?B?dGdPem9pZ2hmM3ZvUC9MTDNDWk1ibjlwbWVNQVhHSzBjbFN5TUg4Q09QUlVL?=
 =?utf-8?B?Nis3dXVYT2UwR1VVNmUwWm5rVEp1K0lOazd2ckpZV0U3ZituMG5pYkJBSmlX?=
 =?utf-8?B?Y0dVZmlqcnVWbDJzSEM1ZnhnNGVJTmV2R3JHNWxmRGJaQWMrS3dObDZUYVR4?=
 =?utf-8?B?STNWZEIvSUwxWXJIUlpBakdNZXF5QVhuaVJKOXplcTg3Tjg4QWhUSFJjTkxy?=
 =?utf-8?B?VENnQWg5VHdYWHYxcS95dnNkY3pCcFpGNkwrTHhuSjRTOEdmWW5NaUVWZW1v?=
 =?utf-8?B?aG9KYXlQaitVSEZJNWt0bFFjcXdrYkVXbXVQb2g0YmhIU0w2cUQ2OWV5ejdy?=
 =?utf-8?B?Y2YwRTUvbkNibVAxbmV3cWJjUWtWbHRYaGxTbjIyWVl3QWZNU0k5empuTkVa?=
 =?utf-8?B?M0V4QlEwbE1zUy9zenppUkhaOEx2N2dyR2hWdDB3dDJucTJyQ2JJbWxDcjVV?=
 =?utf-8?B?N1VSbDRCcDZHR1N2Mjh0dWxhNG9qYzZESGJMaE5LeTI1eWZDV1ZrTzVIS0hz?=
 =?utf-8?B?b0dKM296cGRnVlMzRXQ5MzQrMVhaeUZQYk5nRzVmQUh6ald1MENONDEvUnF4?=
 =?utf-8?B?cTgyZXU4dWhXbS9FUTdReXpReEM5MGRtdDVYMFY5MklSMHNrQjVuYUlPNUcx?=
 =?utf-8?B?KzJJZjVhd3h5V3dyZlh5b3ZNb0RnOFFiZS9tbTVNeVgvT0wwUWc3ek1VbTRH?=
 =?utf-8?B?QTh6d01zNSthbHViUU96MlJSWkZpZUd3NzlCNFR2MkNtSHZkRFhyaUtiREJT?=
 =?utf-8?B?bDBWYkV1Zk1HYkV5eG5mcFJ0N2lzaXZjMFdzR1pTblVtY1YvaXRMODlNRlJJ?=
 =?utf-8?B?L3BJTGpuMXQ4WjNTVmlWVEhyTUJaS05IcXYweHNveloxOGFRWTVjb2ZtTzNN?=
 =?utf-8?B?N1hhNER6RjRYaU5hZGtYNW82d29hdTU5R1g5ZFNWemJXM01hQjI5b2x4K2Ix?=
 =?utf-8?B?RHpQLy80L0h4Zjd5MGRYKzFMRk5qUVVqS1JyeXhQdzR4bXk5em5RK213Qm5t?=
 =?utf-8?B?L2gweExueHk5SGVjOHdDMWVESjVQSXJEUjRtT2wrR3ZhYTdjS3JGNVFLcVph?=
 =?utf-8?B?c3hwNGt2dTlwWk1kMk9WaTdhZFZXNEJWenlzdHNZc2NoWlF5Q2x0YitaQzh3?=
 =?utf-8?B?a3lqNlVXcTUvRHdKYWJkOUpMK0VwYXYvQW1oT2JKcjdRUk1hdndSNUFiSG51?=
 =?utf-8?B?QVppTjFPM0JmN2xHSHNFV1ZmMTBMRFFaNk5ScEExVVIrUWY2eWlPOGJvb2lP?=
 =?utf-8?B?ZHAwNWE5M1pLSWdBNW1pVkVSRFNDdWZpOUs0SHZzYURmTHJiVTlTL25Mc2g1?=
 =?utf-8?B?L3lwSEwybCswRlMxQ2M4dnhYUXFNbENtYUlUb3pYWDVtSkE2R2RiSE9UYjZh?=
 =?utf-8?B?VWM1LzdkRTBTN2ttemlSamxtQ205d01saEpUUjZRTEUzK1pSdFZGR3RhQ2Zk?=
 =?utf-8?B?QmtHYkhXQlY0MU9IaVV4ODRubERQQTNvV1RsWVNRTWdUS2o3cCs1ZkgvZkZt?=
 =?utf-8?B?RklmWkdOS0F1SFl2SlR4VUFKSFdGRDVaSDIybzBzK1dITmFHYUJibktkMnR2?=
 =?utf-8?B?a25Ja1M4NkhwMzZ2ZDR4MGpRZENLeHlsbm8yYytZVGhtNTNOSEU2ZUo2Mmpp?=
 =?utf-8?B?djIxaCtjc0N4M1B5a2pzYnZwdldzc0p1RllPK0lxOGw5Q2h4ZWI2UXpXZnI2?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A1119F59-C042-4E4E-9367-5AD57D2B975E";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e831f9e6-e8c7-4996-ec99-08da5db7382f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 12:17:52.9253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5faQchYrynocZpYYeT6iPHevWKo0l++eq21FRmNDoxMv8TBBARDpAs2V3R7H5afiuSqXDBEuW2RiUut0JRhR/I22BNVqMJVlRYbvkGq+Gf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6873

--Apple-Mail=_A1119F59-C042-4E4E-9367-5AD57D2B975E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/HjXEnZCVP3C2Lk16USDiJegJ/ and you =
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
th=3D07&day=3D7&hour=3D15&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

--Apple-Mail=_A1119F59-C042-4E4E-9367-5AD57D2B975E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmLC2m8ACgkQshXHp8eE
G+1k4gf+NcsV7OEod4ocbprh9bk11+0uDWJTo+zKIbCWgPdVySaan5JrWeq4EgOY
BV/f2HTdt+f5zdPS4EG7mw8OJSvy3jUm4leJb7f3GN3RVU1nmQtuBAXwyF82KZuh
5OgRSmrUNiqiMGSCw0hxM0SF2ZDhqI2jSqZJmh3fW802KwOMJBFEhN2dLo3pNWI1
tlrGJv/QSihscPgHgMPCJdlSfNCX86zmmeQ8RlEjO0xOgsQs3/pgc5KiYHbYm38V
3Zu3RvTz2BK4Jk9QSN3MwlHYHJp/eHLerNj0HlL1GoTr2imjCX2mbuBhPZBUaPyO
31pYJc9mXhuWVixr46xoztep/jHn+Q==
=cr7R
-----END PGP SIGNATURE-----

--Apple-Mail=_A1119F59-C042-4E4E-9367-5AD57D2B975E--

