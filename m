Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354763EF6E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450560.707886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hiy-0003VP-8f; Thu, 01 Dec 2022 11:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450560.707886; Thu, 01 Dec 2022 11:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hiy-0003Sd-5n; Thu, 01 Dec 2022 11:27:28 +0000
Received: by outflank-mailman (input) for mailman id 450560;
 Thu, 01 Dec 2022 11:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0hiw-0003ST-SF
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:27:26 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 202d7172-716b-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:27:25 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 06:27:22 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 SN4PR03MB6703.namprd03.prod.outlook.com (2603:10b6:806:21f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Thu, 1 Dec
 2022 11:27:20 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:27:20 +0000
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
X-Inumbo-ID: 202d7172-716b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669894044;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MfDKT0bKhOSENH51Zb9SaEg8m+bqt9pFHyA802p3q54=;
  b=HvNn3oTNewxAmlR7ij8ErxsC3aG+2YA2KkOtvBSbmezXRO7cNH/5lBdJ
   gPPN7SjVsZZWIRxZ53Uhp0uRZr+cJWPCodxorcput2ggqknt9IlXvNj0R
   EQLs2y11LDRIMy6N5as5AC9glpX09AtMZu4o1/bVTv2d6F/Pnb3c0sf9m
   8=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 88568499
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:86prF6nmExnFKOkgz4pPXezo5gyfJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUD/Sa63cMDajKYt/O4y+/U0G6MSAy4BkGwQ6qiE8QyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5AaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dAmJmxdTi66vcCJzru3TvFUr54vB+C+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9lUaCp
 3na/m3/RBUbMtCexhKO8262h/+JliT+MG4XPO3oq6A63AzCroAVIDlPDnX4qqe6s0SjX+IFB
 FUYpHBpiqdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQm3
 0GEt8nkDjtutPuSU331y1uPhTa7OCxQJ2lSYyYBFFIB+4O6/tB1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:PIoaE67/rhYu6fT0iwPXwOHXdLJyesId70hD6qkRc203TiX8ra
 qTdZsgviMc5Ax9ZJhCo7C90cu7L080nKQdibX5W43PYOCMggqVxe9ZgrfK8nnNESz5zO5S0u
 NKdbR4AtGYNykZse/KpCWzEtAbwNeBtJ2lgf7ax2pgJDsaDp1d0w==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="88568499"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvHWUyr12IQWrCubeuNRDF1ElDigirIA5zgpkWKfI7gDqE8NK8mLQYTri9uycjlWvn6EwLA9zZOAsPdWAs5hNc2tTRF2RoYqjht3kieRqBCDfB1OhqBYM3XBdUEsiSw0oPuok2TQ/6rSw15Lw+KxVK6wO+AQxyaW7bF5UbBWIdbwV32R1RskmOMMSzp03xiMYgMl7TpVfvpiTpLIG5DyqlJ6H4kVlv1GqgS1J33JlStIOf9dEnt6HoLLAeOnFb3rH1RfyeAbSfa3Dtz5eIAZFlPcGz+kiQTZmezNRHCy/YKPui0gPg3QHIiMcf2qdIhm/54Kwize+gIOpKPgcSESMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBITVukZMk4wFeGbSIhXSmTcukl3kvHXt/fOIvH2m3M=;
 b=MlAjBXHvdujk7BauaCPqfilaB+j0aXQ43UW5bW1e3uwZGweVqWGx5Ud4tEbp1m/1EJ8mam83057qJrz/AOLtuO4bNO+qbL+E/Qrveax7n13fYifLMqBn3B2tqC4svh/KqIyo3J0cGuwSY1QbOFFcS+IS0+anH986ZdhtZvU/eLWlIrP/h/EPWZk1qSofU4Keb2nVzEtLthhnll5knd/gV3CL11kP1NJgSAOpmf9Aqu4se3hlsutgQ1LJeaS5pe6lYnz6/oIkirbZzSt6cAV6NLbVVdS6j9zbgcOhbOgV+m9Q9S1P29TXTSZ4RA8Q6sXBt9onFR95sa0LJAC9IfdATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBITVukZMk4wFeGbSIhXSmTcukl3kvHXt/fOIvH2m3M=;
 b=ap3SqayZw47ZJQbsc+gMycYWocc6Qvtq8nBgaUmuYo7afGGn6cJ280f0LGzABtSiGr3g9nWbnz4xqbNw+vH1Bp8qdzt9AQDxMOZ6Xv2LCQKvbBi1o0X5DGuqlfVqBkc09KJjL56YWzbwjWMoNrQnMp2nvyAK9OZzX9u5OnFFw+I=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 2/6] tools/oxenstored: Bind the DOM_EXC VIRQ in in
 Event.init()
Thread-Topic: [PATCH v2 2/6] tools/oxenstored: Bind the DOM_EXC VIRQ in in
 Event.init()
Thread-Index: AQHZBNyFiz9JQ1d6rkae9FT1ll5Oeq5Y5gYA
Date: Thu, 1 Dec 2022 11:27:20 +0000
Message-ID: <A4F72C75-8330-4D95-A9DE-5FC9C7582728@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-3-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|SN4PR03MB6703:EE_
x-ms-office365-filtering-correlation-id: 9d51bafd-911c-4c02-592d-08dad38f02ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 si6IVRadOLUEpOCMtoJ69jAEWVlRcbgZ7Vt42hwRTra4pWFHbR7fXN1snW/0eH5FD5MBfjnzxP+j+dMZEuT4RYB8SS0XxJH+X3NVpAEP2QbiEQO8/NKe+IlGtxflxT6v5DbMFClGvRz4fFE8d2PZYnMYKzLLkiD1bDo3jomK/EVrp4F3VkbABnNtnAjS+17unA1u/cmnku63p3SOBfycPXGIGiF3LD1UfU8fY19+XoqNfcKCTnSPF13rcsj2qm/sW5BbzLtFeQEDh7QLvxs9bnb18Qz0vhMoZwzrH+6AxLDn1A2ZpWMlgfHY3sE9pTrNsPPadJtkBtS25yFYQCv8YaO+uIdzjs4XaBMsqy8olj+1TIQYuy/N8kSpuBKG/AhA0zHh+RzG77C7GUv2CW2K+832lKyj3KV5piTx0s4SdPfg2heAe14L9DQUBr+cZeVAW7dBbQZsw9/qoZjv8JImkLXd+h8NsZMv7s7xf0YS5X++lmeYKaU772qd4v7J7moqOSFgVfijF+M3onVaHeyLtOYDbMQK83lYjicaTFDF7WZtAoMuasGp5VUqDDjAmHpTi3W94tFYopeqFddAPFesTek1ntdTUQd0FspHjMuJosN4dI0IFFEoZNLeGQW7Co0MN9HNRDjFm5KSnzR7eFSyEtvhtMHcsZNVIR5sT49+nA7JeCb29NFbNY5ANPyh77EzMBYsSEE+eJXI/LsTGRhbVSXBH18QwFyBoUbUSEns4sU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(33656002)(2906002)(83380400001)(38070700005)(6486002)(478600001)(91956017)(44832011)(64756008)(6506007)(66446008)(82960400001)(66556008)(66946007)(4744005)(86362001)(122000001)(4326008)(107886003)(8676002)(76116006)(36756003)(316002)(5660300002)(6512007)(26005)(186003)(66476007)(71200400001)(6636002)(54906003)(2616005)(6862004)(37006003)(38100700002)(8936002)(53546011)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RXvKPE77KJFx2OwTQvV7RTdhq7Y6nG080E2RyjexG3u2w9obxVYnL4J42D0s?=
 =?us-ascii?Q?8Mj9S5YdR+Y9lpjRCy3Xpxu+z/IcQTkDBAj9TV8GFD846P6Y9tHa8HBlYusS?=
 =?us-ascii?Q?ar0DYYe2VpYuVwvW4x5oCm3YX1ouhqnNkzbQ//j8HIIfioXWiv5dJ3X+0pP1?=
 =?us-ascii?Q?149mR4nj363EEL6ITM8jWtgxXLKDsZig9MpvIHkEleUEMxoYZCI9WEOHha3Y?=
 =?us-ascii?Q?zSgHBD1PiQ1gCx9B6zhh8CmhnMP62Kc1crurmMYE8NU8JtaHbOGqm3GGsnG7?=
 =?us-ascii?Q?u69Qb3D4K5W/GEh9Tei9fMLHcwxYbR5M807Mha/a+Zbhccm0Po613FXciMup?=
 =?us-ascii?Q?CsCwZLjLXZqAgiKjRK+aMiZP/nXfzQBfEvXGOBPxg/CnvfM8isqCWva+REYK?=
 =?us-ascii?Q?vZt8e05B+LecWVQOMCSycyH29Ih+5H+ioXuN7N5SMBFy2mQrkwwVdf4VgLBq?=
 =?us-ascii?Q?w6JY6d18C9YnCJIOtmnLUTOlG4PlV7RXB3o6vsnADYNSvU2FT7D0+9d3i8ZO?=
 =?us-ascii?Q?SVk3Y0iFherum79Qep352GIsMKdyHMZHkDg/lBeIeyFLMT6g9Gl7TRb2TvlE?=
 =?us-ascii?Q?mw9IqRlVwOxT7Pyk7mlGxvw8MsaZfW4uUoDfVPYl+oTxxDAV3uI/yzLikfqA?=
 =?us-ascii?Q?xMIGc35IyKKI3qWL9wh1j9PZQWMDa99X/kSvPyxmsHM5o5uKo7XVbuUcl4DJ?=
 =?us-ascii?Q?8Eb7p1Q8ulGCsbOQKd78HuppRHD+gFtcw2DUAsiqG+EkXXjjFisOEvBjMBXr?=
 =?us-ascii?Q?u9uOeMkvVbhYsybAWmH2xaaWskND5mCH+cJUGsuYJxHf358ap74hIJmL3Phi?=
 =?us-ascii?Q?6PNekKQa02gaunetfYglPqM1Nk+e8/4x7eWEIkpMal/uBx+kTb9uKvZrtExw?=
 =?us-ascii?Q?5f4Q8MYy7IPj2lb8CJ3CRpW7WGWrLXa7pneTx5a7tTg4Q4Jt8Xsa0Odb+CtL?=
 =?us-ascii?Q?idSZaEYl5lTOMidji/yH/mKE74ViH1ZpK7bDSx/Bb32wnuXfOA7nJVmE89j8?=
 =?us-ascii?Q?20aeCB8zvtt5KgsGJAla62ammVXwdGsCtETWDo8O7KgfbLkbp0DzheaCaGAZ?=
 =?us-ascii?Q?imjUvo3EorVe8UKe13+cb6DphWvOVv0Y2+OYiEbvv2vxPqozRL+0E2Vo/Nzp?=
 =?us-ascii?Q?C9gDQ/ozXhmzhsDUv07Gszb8hkIeLqZRTNZC6WqxyPTPZHozVEmvQwmCiSLI?=
 =?us-ascii?Q?62JCBmIXzfsRP+VKIyf57Bme3FvetwroKkzBtljG05uivvAxj+cDpuEVvn+7?=
 =?us-ascii?Q?HLaOSR9Sr6Kt3w1ZblVXNUzDet0i0d+Txr1cExg3qOzYut+yrhJ9IzG1kgbo?=
 =?us-ascii?Q?SDgU3EpTz5AuVslq+5Bj/6v/KfS+FkkEaYl3KpNEsMu78raolOy0ABBjRf6a?=
 =?us-ascii?Q?hgJsxTsNzvYbiej/9XrkHav0CC6B+QhmF45BakB9aAThn+dU9J2OSdjQ3zNe?=
 =?us-ascii?Q?qTm9Qi0eT/knAbNkhwcMnRA4gXUnqHe1LkZHPLgcbp4JO5/ONuezeqmGSf5f?=
 =?us-ascii?Q?cPfiUZjQIv5IcgznozehuOQEJJtYq5aawUToBp3PdEPCb1L/gfxWGffT8x0y?=
 =?us-ascii?Q?NIhtGddMkwS+f7YLVAdSTkYng2uu65PwS/CH+4hN/8Qud0LmnVftiqtpDHeT?=
 =?us-ascii?Q?nCtrqA718uwrqKAhhO/86uo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5056720111278C45B92E60F175B82FC0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5K1lxxyw+kf5MWrJvgmXQFoL9xm2FrzOqQcY4aQNBqIYllyqL5MM4BuU0fhC4yUWwqdGdkNqSxupvW10JPR0l6D5WlOMIaFAtDVao0Esc/wGGmL2YArKorOm0/q48pF9Wqm+vFPu6jOnstjStOPljlBM04YWfGwmsxuXG5NvCAOcQMlPvwO6eCBKIPjYqc58T8scPP1pjlooZcB9MiE14G4psGKvjkVtVHIfpgHihu4TNVc/XW+rzZkZ3SMTqLCkye89TFW0RPWGjy3HCjqQKOS5kaLV2Ya54tnHN0MCAtBD5Vm+VRG1bkgZt9XREl1x+ZyIpY8ggb1WTIYv26OgsDNikC9YiIIaqcy8l6ldnFltuG6YGK3lHl7Ok45ECnHwhxlg8zD0SheZZ9foaxIX3u6Uj9v/i3Oi/qB6lw0A5Y6w+8n0NltH8I/dxw40wKoZousNONA3ecym+NAESJbtp/wIGSZRuuLvhow1v72hbGTx4VHJx9Sgz642DzAgIdf5bs+uB+Q5EKnb7qjUVLMyHLCcpx8A+wAjo19ZltBs2CdlX9SHwdTdNrW5dYX8VhvDCFpXykuCnhCYCNJ3tNkffAf11l7GuQFcMU6x0h5Usgp2C8UFW7RiXPqeZD2Uz/xQKBlHQdU5VsKFXi1WJAAGo9yNZYBg7WsMQMgEcMOjF8lkhlEiC7kB1X2NUVNfCCPrkzgqwEZ/7AoQX+Di18sgAouMC6eel4BdTT2EFJx3QsSZdQPBz0uEtQ7qaa9vddR5HNz3Mw0Iqnp8cOHplX0ZOj1wuFxVFreCswMhIqCUYDkYM5VhQBF434jacCQnysj4
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d51bafd-911c-4c02-592d-08dad38f02ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:27:20.4355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mN9CYReyN/voLYeh4eJ/fesEkcYKoXaIdcLeVZPxB4L9ALS7AySEdvVya5qhqmLsQRYTCBfdIKmTSB0rJlimHYOUKMi1+QFYMBypRbHiupQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6703



> On 30 Nov 2022, at 16:54, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> Xenstored always needs to bind the DOM_EXC VIRQ.
>=20
> Instead of doing it shortly after the call to Event.init(), do it in the
> init() call itself.  This removes the need for the field to be a mutable
> option.
>=20
> It will also simplify a future change to restore both parts from the live
> update record, rather than re-initialising them from scratch.
>=20
> Rename the field from virq_port (which could be any VIRQ) to it's proper =
name.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
>=20

Acked-by: Christian Lindig <christian.lindig@citrix.com>


