Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D843155BAB4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 17:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356861.585185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qge-0003C9-4N; Mon, 27 Jun 2022 15:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356861.585185; Mon, 27 Jun 2022 15:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qgd-00037K-VH; Mon, 27 Jun 2022 15:30:03 +0000
Received: by outflank-mailman (input) for mailman id 356861;
 Mon, 27 Jun 2022 15:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0SW=XC=citrix.com=prvs=170a910b0=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1o5qgb-0002qH-TK
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 15:30:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe2a3901-f62d-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 17:29:55 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 11:29:56 -0400
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by DM6PR03MB4956.namprd03.prod.outlook.com (2603:10b6:5:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 15:29:55 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::8815:10ec:1816:ec3f]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::8815:10ec:1816:ec3f%6]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 15:29:55 +0000
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
X-Inumbo-ID: fe2a3901-f62d-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656343799;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=s2wPi/TeYboNn+cjx+EIVAVEvku3I53J2WHzMSAuXps=;
  b=dQhLqrw0e7nAkROzhyUJbMxXNLSq9wdNek3xOxswM79+k946X7rZvX1l
   lNkW2orHstuoDeDSBBMvNYsE+Ezh6AOzDH62xl19PqgiByZmbiWfCRzL4
   eJdklADMYMazN4SnRYhBdn1bPfnvISr5WLTY3R1cIRWMwqKOq38pfawUn
   4=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 74933334
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rMC77Kj/np0rh+jMJU3v88GyX161sREKZh0ujC45NGQN5FlHY01je
 htvXTyHOP+CZGrzKNF2PNjk8htQvpTXytIxTgpqrCE3Rikb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXVnS4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSwIZY39tsYXaSZdAQN1PfAFpJqEA2fq5KR/z2WeG5ft69NHKRhueKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehW9p7ixNNa+2i
 84xcz10d1LEahJCIEgeDJYWl+a0nHjvNTZfrTp5oIJovzmIl1cqjNABNvKJe/vRZIZ2hHyEm
 U7Y2WvHDwoeGYamnG/tHnWEw7WncTnAcIAdDrqj7dZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFafpQIVUddUF+w86SmOx7DS7gLfAXILJhZGbNElr8YwSSYdy
 k6Sn9jpCDpst5WYUXuYsLyTqFuaNS8TImsDIz0ERA0Ky975qYo3g1TESdMLOKSylNzuXzbr3
 yqNsjM9lp0Ul8cA06j99lfC6w9AvbDMRw8xowDIBGSs61ohYJb/PtTxr1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb6FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:IgcJpaH7A4TEEMSHpLqFWJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdpZJkh8erwW5VoMkmsjaKdhrNhdotKPTOW8FdASbsP0WKM+UyGJ8STzI9gPM
 RbAuJD4b/LfD5HZK/BiWHWferIq+P3kpxA8N2uq0uFOjsaDp2IgT0YNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5d7bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu1DhPi7ontprcenau5t+7f+3+4sow/LX+0SVjbFaKvy/VfYO0aSSARgR4Z
 3xSlwbTr9OAjvqDxuISF3WqkTdOX8VmgPfIVP0uwqfneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2K2oM3R3am8a/hRrDvBnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLSU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsA5cuYGKaZmQOsRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHkondJNvaC6Dg4KFC5q
 gpCmkoylLaU3ieePGmzdlM7g3HRnm7UHDk1txejqIJyoHBeA==
X-IronPort-AV: E=Sophos;i="5.92,226,1650945600"; 
   d="scan'208";a="74933334"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhrDtcYVhzRyCMtbMK9fVFCGoxWpAt5LQzDX7JRnFYzCy7LYtszyxH6owgsPkP9NA1SpeGP/JCn6wGLP7ySr48jUUUXwBQdvnsbwgg8v3L50KJbvX4C3Boyu7BLhCXX1ok8Eog62kPr3qAOXYkTv1N3Xe4sgJpWtwSDKACixuswkzjHLnrXL2pvN1+GgrmHaDNAZT0RzdcRTDTmfMX1MoxlStZpSBvVnhcws42ADPkryJXsdMsUTVA4dcZZXgcjU4Rwb7V+4Qu8mBdEYQF5Ul5yKoqq6H6ldduaU5m4fgtwvRgIiPTmjz+hsYMWPspCzEv+nxdGAkwmzKrTXTKrA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z7Wy4bj5krUpA7LosAUE0/1btvlK4cd9rZX5jjNJ4Y=;
 b=Cp80QgnGTpkd36JWFVnvEttjXsd7RlpczgOVQ0uShA6LPjtDK1Z7nwlYYbtibO046MYqgiZ3u4MOoipcXBNXZ2v+RN8M+jl/rd+U+TTxYZPG1WtYvK6zCGepr/KKZfotmCMMXySp3sWNpEBgExTyR65QIBtLSgJEDFLq2IUkSIle2dc1gUyZ0F3RsX/a7Qv15Wq/Wf7KWbiQfyZ4kwuTyZpR4wf3Dl9n7VDDzOiLZ3i66wCaW/gdhrFVu6JbVZItZrWcIR42WhDVjp4bJEcC6Gc2zVIXrCYKeIDW72d+L3/pgU4sqOh/Gqev2dlJbnENCHwy1bRdEelfkyjb7kwH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z7Wy4bj5krUpA7LosAUE0/1btvlK4cd9rZX5jjNJ4Y=;
 b=MEuOwdZ1ZbEVjqwvO9asepQGUiUpC4nGvD7xFjg3+vigrQPjvn8z3hBezCvsUp9uBP9PzLMO+50/BwBFjcMrf/ZuOfialQpupdCnTMmyUl/2uUVU3B72E9PuHs7IAlphrIj8dhOrS6gdEbGahTcBMgLPSl3PWs/a2doIlp8NYsA=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Dongli Zhang <dongli.zhang@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/manage: Use orderly_reboot() to reboot
Thread-Topic: [PATCH] xen/manage: Use orderly_reboot() to reboot
Thread-Index: AQHYijk2RX7/puuRFEiy7ev5zhwyTw==
Date: Mon, 27 Jun 2022 15:29:55 +0000
Message-ID:
 <PH0PR03MB6382AA82CA7C475532E6AFE6F0B99@PH0PR03MB6382.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04b2d3d1-c1b1-448a-b76d-08da5851e322
x-ms-traffictypediagnostic: DM6PR03MB4956:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hkOcL9Qyqp6RzRMnQvKrjVDcN+fR39QJYM/Rq8S4tPmoApJuM+7fgp4PoA22ZOihGxIO1seaBKd9J7TC3OfC7sZfNsbzAhppArWkPOf9jiJjynkClAyk3NJF/GUvAVy1LouBk3+UmPgQFmjq5e9Ashn6CnFKEDL2CF9zDg/V11wrYYOfNV5fe96aBWzfZwTEyLNwt855N7Eh5stRUxsi7SVd2erDWZUdM7Lq4hj+Mq40atcOmbWWBjjINx0pQ+D7tAZo6T16uU8lvRhhCcu7UCIWusP/eqQjPAVPrNRBFNrb0TXNpo4rjsaEdekST1O4+V1DoFtut0fgg3Z7TwsC72tz3MNSQOupzbwPox/LcpT7FEGDWXJGA+nwJmDb8Kl8pR4gvXVW5XoGpP3OxVU9MtoYQ4F2O2z+2nxVPNVQQHcpH6quC16ehgvPOWacQd/Nk9jNlc9ymDBt6PQ7qCYMYrSUlIWTjqlVhbLYTNfTIKjD/lk0FEhkN4OWXWq9fwowem7ZRmWig03FkEx7p9qEMxnJWfSSpdtn32Xlrfdq9U2sO9v8FDI+LLwpocHGstpI31xzKZW80XTuF92QJV3rwYgA862rWKQyYsUaJzhFBgcPAG+Bk0p+2FAd83DGglTxj7g0FhxrHAzmpgqrnPYTfWBxrbnx4hU4GOqyiAT1tIxvB+AL4Hn+axN9BxxBN5J91rXeBrBxzjeh91z5zAogr1SYZeLxK88B1O8vQex7+xtksdqHdxR9JvVF5jn3vLXDlCs5La9faa/Yv+g5dsNTZiKU4Pc6O1V49sWo6wnZVho=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(91956017)(9686003)(8676002)(64756008)(82960400001)(55016003)(4326008)(52536014)(5660300002)(66476007)(478600001)(66946007)(8936002)(66556008)(26005)(44832011)(76116006)(83380400001)(66446008)(71200400001)(122000001)(38070700005)(316002)(6506007)(33656002)(110136005)(7696005)(186003)(2906002)(53546011)(54906003)(38100700002)(86362001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QCp6/Ugk6G65kDooi3gYwDOVgoTdMWmo4y/pYiLAzjQfX5wCIcItHnBqdd?=
 =?iso-8859-1?Q?O51YbF5uh9ZO9E4rery2CPhSlePAr3JHEoyzL7hT1wxzxhawB+yUX1dXU9?=
 =?iso-8859-1?Q?pe60E+h9vU5j7TtSXh73Q7sWBEEury5C15mMNQy1mtniB9N3FHFFkV57XK?=
 =?iso-8859-1?Q?Prkct6ZYcUTOY7U2uM+FAYcgeI/1X1pr20+S9AyWI4zeevnp52eBIxC83l?=
 =?iso-8859-1?Q?j7r6nibkfXuj2odmhxf369qe4QEMVl0aprNIa3rGwiJyerbVRfyNfnJXPz?=
 =?iso-8859-1?Q?OdTZJwTM/2k6/7nnu1JsQokbeV1eomS5nBgqGWTkRO9NVHVFakOrTDkBji?=
 =?iso-8859-1?Q?1htPawZ40twnjZDd+xzqFVVeCIgSf8HGzr0gYuXRlSiawhuH3KyhqhVE/J?=
 =?iso-8859-1?Q?DZc+4+xTWXfLHs/orC3Mu9VM3f6C+Z1YCUqizK7S/nufuP/KykWYY8putf?=
 =?iso-8859-1?Q?PxapB9kKUL+itxj1tU18UqFiZ6w0UmSJoygfPF8EiH5wThPFIzktuIQA5b?=
 =?iso-8859-1?Q?9n8/Kkxnk7WgzzICdhjPcwoaFqka3XLJrKe6HwaV4xJI02jyzrLgPN4ska?=
 =?iso-8859-1?Q?ebShdwGlCL1ajtbD9V0cIrFXxsIm/OKCmM1BQbJ2Wso9QzKM9sUVoWaHq6?=
 =?iso-8859-1?Q?YvVHP0SToyUz+W9rqGZ5SQGGFLzhYDpELqZg+TvjekdhSpGPTeO+bWDTE4?=
 =?iso-8859-1?Q?b9W5Sh5g9yFzwDWz3jDbSweFTDVJzjtxo3ITfHUIrY6DAJS6Tp6GeQKaEb?=
 =?iso-8859-1?Q?isepLgUts3Jiz7ZWQ18jTbG3zZUy2uaxCnapv89y6/WrTLRg0ytNsw9Pgz?=
 =?iso-8859-1?Q?51LSSzYcSK1YArpVMU8cGZWc+W4ymCt0T+weKvPW5WytZqfEMR4JFTOqyt?=
 =?iso-8859-1?Q?5q6n+PQS7GGXfru8EcrMsCsgIHBiqzoaJ7ue1c/8pCKL/oG+avEw9eXcNx?=
 =?iso-8859-1?Q?VSbuB+4or5KfYAIbGlQ8cX8X1YbBcLWfPMTCb+b20MMHvry/mIQkNEjjcH?=
 =?iso-8859-1?Q?U6nZszWVEmAAYXst1oDv30nMNVtK8gKQpipliYVhHKlZR+ggI3iE6mA95C?=
 =?iso-8859-1?Q?n4B0Rf1zgyqDZ4rf3NbPMBe+VKd0ET1u4Aa/Fn4E3SBTTUGJdbXmCuoZ7v?=
 =?iso-8859-1?Q?hCH8+uXircNr1nGjZxbz/coGbYtbKqgR7Y0ap8ZkfpB9SBX/jUrfDvXxZh?=
 =?iso-8859-1?Q?JoLEIWpj3iEWXId4SHXSaHZjJOf+elwVQbYzSVOTyb0mEvUZT+2icMbJCA?=
 =?iso-8859-1?Q?tCXwYlUjIcyq0fGOzppa0dzuZwJdXBtQglpdgZ9pSWAqnKhgHmSlg5OuY5?=
 =?iso-8859-1?Q?AoEt0AUIqkphfvMQNkaLkvGu6VRe70+293vqESbcJaqUAzLcAhhjD88ywF?=
 =?iso-8859-1?Q?ueVrirHYVQh4XVGhBUjBehXMfv3ihRskSucL0xZKWP7whz4fpTIDy+RolO?=
 =?iso-8859-1?Q?9cYkoiHNM9tSElNAUVxGaYhboiDhlfq73bwKWdT20inYW5NwjjWhtjY3QX?=
 =?iso-8859-1?Q?LiEgsW2eA7vE2OYbLzj6vKlXWiBFQAI5xO/ixs3FmIbR54uV2GB0LKE1f/?=
 =?iso-8859-1?Q?0wXeh2Cj7CZqeLsYTWRAWmHoNrcsSC01BFj7ZU+P596SOHz5EcnODMBpU3?=
 =?iso-8859-1?Q?I4doHtCx67MwbdYov2ML3ypZOcNWFfoSoI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b2d3d1-c1b1-448a-b76d-08da5851e322
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 15:29:55.2020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUztJvjlxRYTnZqh4CfvXqR9K/uzAX3o1zAXO1+ulIjmrvEeTw5WpCJm3eZh9ut5AALSbNwH3NfnuLJSPg1lMudf62s/ppAqiwtloEuh5WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4956

> From: Juergen Gross=0A=
> Sent: Monday, June 27, 2022 3:49 PM=0A=
> To: Ross Lagerwall; xen-devel@lists.xenproject.org=0A=
> Cc: Stefano Stabellini; Oleksandr Tyshchenko; Dongli Zhang; Boris Ostrovs=
ky=0A=
> Subject: Re: [PATCH] xen/manage: Use orderly_reboot() to reboot=0A=
>             =0A=
>            =0A=
> On 27.06.22 16:28, Ross Lagerwall wrote:=0A=
> > Currently when the toolstack issues a reboot, it gets translated into a=
=0A=
> > call to ctrl_alt_del(). But tying reboot to ctrl-alt-del means rebootin=
g=0A=
> > may fail if e.g. the user has masked the ctrl-alt-del.target under=0A=
> > systemd.=0A=
> > =0A=
> > A previous attempt to fix this set the flag to force rebooting when=0A=
> > ctrl_alt_del() is called.=0A=
> =0A=
> Sorry, I have problems parsing this sentence.=0A=
=0A=
Probably because it is poorly worded... How about this?=0A=
=0A=
A previous attempt to fix this issue made a change that sets the=0A=
kernel.ctrl-alt-del sysctl to 1 before ctrl_alt_del() is called.=0A=
=0A=
> =0A=
> > However, this doesn't give userspace the=0A=
> > opportunity to block rebooting or even do any cleanup or syncing.=0A=
> > =0A=
> > Instead, call orderly_reboot() which will call the "reboot" command,=0A=
> > giving userspace the opportunity to block it or perform the usual reboo=
t=0A=
> > process while being independent of the ctrl-alt-del behaviour. It also=
=0A=
> > matches what happens in the shutdown case.=0A=
> > =0A=
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> > ---=0A=
> >   drivers/xen/manage.c | 2 +-=0A=
> >   1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> > =0A=
> > diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c=0A=
> > index 3d5a384d65f7..c16df629907e 100644=0A=
> > --- a/drivers/xen/manage.c=0A=
> > +++ b/drivers/xen/manage.c=0A=
> > @@ -205,7 +205,7 @@ static void do_poweroff(void)=0A=
> >   static void do_reboot(void)=0A=
> >   {=0A=
> >        shutting_down =3D SHUTDOWN_POWEROFF; /* ? */=0A=
> > -     ctrl_alt_del();=0A=
> > +     orderly_reboot();=0A=
> >   }=0A=
> >   =0A=
> >   static struct shutdown_handler shutdown_handlers[] =3D {=0A=
> =0A=
> The code seems to be fine.=0A=
> =0A=
> Albeit I wonder whether we shouldn't turn shutting_down into a bool,=0A=
> as all that seems to be needed is "shutting_down !=3D SHUTDOWN_INVALID"=
=0A=
> today. But this could be part of another patch.=0A=
> =0A=
=0A=
Agreed that shutting_down could be a bool but better to change it=0A=
in a separate patch.=0A=
=0A=
Thanks,=0A=
Ross=

