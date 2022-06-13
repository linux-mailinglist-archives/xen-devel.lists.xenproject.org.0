Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E1C548145
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 10:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347822.574147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0f2u-0003Ey-FX; Mon, 13 Jun 2022 08:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347822.574147; Mon, 13 Jun 2022 08:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0f2u-0003CE-CC; Mon, 13 Jun 2022 08:03:36 +0000
Received: by outflank-mailman (input) for mailman id 347822;
 Mon, 13 Jun 2022 08:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1H1N=WU=citrix.com=prvs=1561b7a3e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o0f2s-0003C8-DN
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 08:03:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50994206-eaef-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 10:03:32 +0200 (CEST)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2022 04:03:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM8PR03MB6216.namprd03.prod.outlook.com (2603:10b6:8:27::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Mon, 13 Jun 2022 08:03:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 08:03:24 +0000
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
X-Inumbo-ID: 50994206-eaef-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655107413;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CiiyAYTe4t/xVNgbnhRgwfUmI0mw7X2HrKUPuUz7ADk=;
  b=g8i5r9SORumOA+4nMlqEpEXuti3MzxkOM0oX8REjIrYkZt3pVmQlQyD9
   U7b6jSkHyGkxw3yyHcSXUgbR1Q1VZEL/euBQaba/r6TtDt/fFVZXkFwwO
   rOSmG06Uc0gUG5xYyzGK48pQ5a4rd4YfR+gPJmFB6T2tJtm/LFqhE0UDe
   A=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 73284651
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:i/wI7q0D7RZKalm6aPbD5aNwkn2cJEfYwER7XKvMYLTBsI5bpzcDx
 2McXGGGOq7ZZGv0c9wjboS/8BhXsJPRydAyQVdrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tAx24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0O6q3sFV0sY5b0p8oQCUhIQiBwPaZ/reqvzXiX6aR/zmXgWl60n7BCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+YBfmTjTNb9G5YasRmNPDSf
 ccGLxFoawzNeUZnMVYLEpMu2uyvgxETdhUH8wjF+fRqugA/yiRbyafxItTTauWVTPVRpBvFm
 FvjolnAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwASEy66R7wPHAGEBFmJFcIZ+6JZwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPTdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:Sc9Q1q4itAxq7+Tb9QPXwZGCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+843WBjB8bZYOCAghrmEGgC1/qu/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXerIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonis2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaQkEyzzYJriJaYfy+Azdk9vfr2rCV+
 O85SvICv4Drk85uFvF+CcFlTOQiArGoEWStGNwyUGT3fARAghKSvapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jRiuKYlGclsRLYkjQpo+VY7bVDHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TpE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZeo6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z44HSKyGG4fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.91,296,1647316800"; 
   d="scan'208";a="73284651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCNJT/6PdHy1u9z4PjF153hiXO2yxSPTWkbqu8JhpLSDzz6to0rejMO9f0n/SbmktX0gxd2Oeub5Y/UKZ7LhDN2EpgmBb5Cg3qGwMi6viRjGDaWXjOZD/wPExRbLB+FEfbJetkj1lCoFGeWapCyts5mKahMdaHoCLT9BrIS/I/RZhHevkvyuOgBk7IlJQ3WoBDGPDW9NPoUeH3GRFPpuHnNroazBFIZFjCaP9TNAR86DxQ/0+azE10jxMEB0htYkgE0PPBlJPoh7tZ1+LPxiPpeCZIpXrGsUcEAv9iQzycagszwBcmWJLQVCIpQ4KtCeLrCmvRhA3yRgZf8lSBhZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiiyAYTe4t/xVNgbnhRgwfUmI0mw7X2HrKUPuUz7ADk=;
 b=d/pvtfK5i09msmRbblLQ8GLTSkujlrYmMIYlIny3LLOxmxTWI8cUDBnXjcddesLtBuLGsA2wR/WsvDlDR9BL2YiWPZz5Om6jnqUgx5ZR3vZR7RxOEyoD8JK6AaaoQCWOb/06T0lecWi3zsVlalFxMU1PQrJKLWVh1QtAhHauaz7rsHwCiLBB83ILHcnJrc6N6OfRSbtCA9PAYHWZLRglEDFkvRvUpn/lo29UUf4MQLitjWuutsbIWuRCNwuvoTfVJr1zwtb0R89xZHDarh9DHfjZAc1+/to6ljyVLHvOtp/Bk0S89kjunXLQOLpmtsMh9hyKECLp9cRsFoSKTDh1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiiyAYTe4t/xVNgbnhRgwfUmI0mw7X2HrKUPuUz7ADk=;
 b=rt/2n8wXfobNfXd4X9VMmtstLVQnDLHoa+XGhBFhn+34T6qPdplhEByc+u+QJCYZK72jWFrXZJkU0GQ/Q0XfV6wv8uwofFhZnaUIEl+dsLp4n+H0byJD9YFlBWPyiHkADXm7A6Pwl7hkkM4oizNNhRaMF/xHWlUC1lSn4li5Be8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/spec-ctrl: More MSR_ARCH_CAPS enumerations
Thread-Topic: [PATCH] x86/spec-ctrl: More MSR_ARCH_CAPS enumerations
Thread-Index: AQHYfONZpKeg248Rt0um2v0bci+Cz61I4Q+AgAQYjICAAAS6AA==
Date: Mon, 13 Jun 2022 08:03:24 +0000
Message-ID: <e61ec318-c61d-37d0-7bf6-3fe804a1f9ba@citrix.com>
References: <20220610160050.24221-1-andrew.cooper3@citrix.com>
 <46e8251f-6a76-a45a-54db-c15a39b2ff68@citrix.com>
 <6f1b9d99-290a-dc29-c953-3b38516995b9@suse.com>
In-Reply-To: <6f1b9d99-290a-dc29-c953-3b38516995b9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 609953d3-4eb3-4841-fa54-08da4d1330c9
x-ms-traffictypediagnostic: DM8PR03MB6216:EE_
x-microsoft-antispam-prvs:
 <DM8PR03MB6216416D083597BA67079D91BAAB9@DM8PR03MB6216.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0JQUSH6qOgr/0rsiEIvNDwZBffJK7Tu70rdQmTp2A5ipIHqfkOxkNBwTbQoBBjRU7acsekk8dVXJ6oefkc5EjajGhBgRj8y68TF8HT4GOTklyJd7rz3Y8nNnKe2sERV1WWN0NQT3fnKxKBKChct5Z7E8w/YXxQ/nIf3QLMZnglesSvvngc4zTxCYYa2DIeRv8qu8EwI6r7c8rIEK+ECQPzZqYrr8o3sahQlHWWmO+BA7jQ0aKYAF7Qoeat5egja24VGUgnm4LnMHfILECxjsGwHzTbJUMxqNa27xzBL5H21oVHX7MO8RcypXd1moya4CiTboSsAmcl89FogycDgbSEoH92M9pfZBXedjckjO/NM545Thc4LkMfwZQl6Ri5VT0hVyV5yQgFx2Qxu7P+SttcW0fNKXak18BSZvC5jip62GuWtjLi/aAYGLK8xA/gnYaKNMSm4ojKWgCVX81j+CgZT0/yjOcu+6dOfZDK9eEQYXs1cO4SgkMXfGNFbGyTkkBIXa7MZij30jSNeXhW36JgTbXiQDajVGwYswQqKwgbBbnNw+270+M86IOR+o4s+G10FBx0AGxEEPowNP1zoSCaV5uoGMjLvVQNDIHyDVFxgF8IbyQLu+DgzLBcann9UiuydnXQTF8lCsA/vUBXzJxdGZGZr+QPItN+l8GIxV0TDayC2I5DUtptxDjhHiGLmAnzKvtAWVocW403gvsI03jJYbSAe7KhuFSpZsAYTYZAes4ATMtUT4rGyHkRES9F6U0GXshcjSsbtvLwTWDpScaYH/hWagACJFgEjYRyaWBfKSk2M/9HBkqneFHuRd5WGVjQMJgSDQrEgY/klrUh3Z2FskkHTKfdmS3+729vuTD0W7eg4DksIL595//VMii5nypbJhns4fhm03ouFge+ApDg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(86362001)(6506007)(508600001)(8936002)(31696002)(71200400001)(53546011)(55236004)(5660300002)(76116006)(82960400001)(122000001)(2906002)(6512007)(38100700002)(26005)(36756003)(38070700005)(66946007)(91956017)(66476007)(31686004)(8676002)(110136005)(83380400001)(54906003)(316002)(186003)(6486002)(2616005)(966005)(4326008)(66556008)(66446008)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTIvcXRpelN0clNNcmNlRW5CV29SYzN1NDJZWVJGSW9RRU9WbGlXcnpYTThs?=
 =?utf-8?B?MFpEcTU4MU1iNThDNHpEaEhMUEJiSklVQzVTUGdlUU01OWVwOWtnT0JvREw4?=
 =?utf-8?B?dnNJekpXSjRKUEVPVkVQRDBjVStBak1NRzFtVUVTVjYwKzhxNmNqVWVtVFVI?=
 =?utf-8?B?YmdNOFJ2bmVtd0VCbEJtMjdYVUJFeE9UUWN2UTczMVVjbkhNaExpYWZ5RU5y?=
 =?utf-8?B?NUdEaENjbXJ5U1UrSFk1NjRBa2dQWWQxeklYVXNLbXNRUXhzQWd4Ymp5RUt5?=
 =?utf-8?B?WG83R0Zkd3dZaDYvbFNZSWpjUkxFa1FPTEpicldPNFhUQWN6SXppSnhTaHRs?=
 =?utf-8?B?SG5ER2pTdytnRjVyVW9odmRXSnUxWXFRS2Z2Qk5NOUVyY0N6ZC94QUdpc0Fp?=
 =?utf-8?B?ekZZTDZ2SDhnNHcrdVNGVExvdlZPUVBxRzVHUE41VXhPL2VMSTVORSt1Um9v?=
 =?utf-8?B?d2crakpTb0xjWUpHb291bFIxTU5tYklEYml6MElscmtvM0U2bUdoUUNKZC80?=
 =?utf-8?B?RzJIMGVNKzNvYitsTDZyV2o4NXcyVW9qdWhpd3hyYTJPUFNBaEtqSkxtdXVR?=
 =?utf-8?B?bDVXSEQxU0dxNWhjYWpDNGNseDh1SkxXRkVhV1RGQ3ZZNEx4M3RXeVB0eDdk?=
 =?utf-8?B?MFNtTmpBc1pMY0U1MHdxNWJpN01RZGFWQ1Rkc3NIWmRTR3JFSkFLMjIvUy9O?=
 =?utf-8?B?SmpERExFcWVqNndFQW8zaWRzM0swanNoWDBIN2o1WFJwaFR1TXNCUFltQW9s?=
 =?utf-8?B?L3BLcU9uTFBMNDZrZzZxNUIzbTNVVzZOQ3RsV3cxcEtZd1JpeFhQaWs5Mkgz?=
 =?utf-8?B?VFlraHdVb1h3S2Y0V3A3QmtIQ3ZEMmgvbkM0UitjQWVWQVhkR010bGNSWk14?=
 =?utf-8?B?SHdERDR6Uk1IbkMxQUpLZzd5SGlJVVYyM0dxNmV5OU9sZ0hhU3JINVArK1Yw?=
 =?utf-8?B?dHhqekJEbHlaT29xVGYweXZ6VklrUVhKMkVjQkJwTml2WG4yNkx3SlVabHlk?=
 =?utf-8?B?S28yd29vUGo2U0EvbnZqMVorOTlCaktQZnY0NlRZc2k3SGdJWFlWS0g4a2w1?=
 =?utf-8?B?VjYzYnJZdXBpQTZPYmEwUW5ha2doRzV6MG5wUlo2OVpMQ3FWVi9TWnorSmpz?=
 =?utf-8?B?TGlvQ0RSeDBBMzBzYThJdGFBMlVjdmV1TU5IaVR0eFVpNFpHVDNMY0QzWjgx?=
 =?utf-8?B?WHA2T0NQazQ3MU4rSDY2eGtJTEdKdVVTVElDN3FHRG5TMzlGR1QxMzJYdUpW?=
 =?utf-8?B?VjE1aDdLV1ZFaEhQUjczemZyUmRQYTl2UnJjaEhRb1gxVE53VjlNckFsRlAr?=
 =?utf-8?B?RE5YZEc4blFTNjRkVWgxWWNoSHlwWmpnMWVHMktHZ2pQVi9ocnFVd2d2dFp3?=
 =?utf-8?B?UHRjWVlIM0RjWUVFak5EZWFGK1k0VTZjU1Z3OGRtd05XemRORFpucCtLTDFu?=
 =?utf-8?B?OGV6RGE1L2xpbE9McTdXdlg4U0I3YUFSWlZXekg4clVvOHFvb2p2UXFNM2Jp?=
 =?utf-8?B?UkYrUmRZbDhkVFN0a2xwTzN1NDU3ZFpxd3hNeXVvamJNSUZReVcvaS9nRCtk?=
 =?utf-8?B?aVhGK2lDeVpGamRFdGZ6dTRWLzNOOTU4eVZIaXorQkhBWFlWYm1pcHl4SWw5?=
 =?utf-8?B?WFNrVlZGTVRkRmlOVjEra0lwRTNobjd3REgzbkpld1pVd1FSbzRhYTRNMnRy?=
 =?utf-8?B?OWphWFhlWC9VNWJQc3BBK2t4QUROS2N2MWgwaGZGWStMSkgvcjFpQTN3RzVv?=
 =?utf-8?B?bmlscGwzRjZIbWlFTDVJTlZRUnFFSkNWV041Zi82cEFoNDFmS0VuNUl6SEgz?=
 =?utf-8?B?ampKWkJFMzdyVUlnNW9IYVEyL2l2SHhPdTY2cHRLMXE0cVZqRDMwSzNzc3Yy?=
 =?utf-8?B?cFZDMC9pZFY5UW5yWkpYWmtnbHc4U28relZoU2FzK0lYOElNMi80NS9pUHFK?=
 =?utf-8?B?VWZpdlE2aEF1SVNEcWVJcXQ2SkRBSE5mSk9XVGZPd0lORzBhL1JrNktLVVVk?=
 =?utf-8?B?Slc5dThCT3o4VFJQQnY3cUpzUEpHMERYVmI2VjJVVEMwS25iaGREeUdZMUxq?=
 =?utf-8?B?QXJUaDR0bEQyUEdJNlluNlhVUmMzUjRTazlMWG9FSWZlak9YcVZXbTBpZHV2?=
 =?utf-8?B?VVhJeU9QNk52a2xndG9mdUlNTURFRENYTjFNdjc4eXF3L09jdU53K2VyUXBw?=
 =?utf-8?B?TzZXSFhQaTJxRlQrMzFKc3h3WmFxLyttL1R1c1M2NE9Wb1dWbFFibVhvOGxs?=
 =?utf-8?B?cW1KaUJMZ1JGcjlVcmZMLzZMcG54Yk1YZjFPcUoxNEtxczQ5ZEI3YjJsSTlN?=
 =?utf-8?B?UzBKS1JmcEcrdXlaU3hhdURjQlRaTVRSNHEramtGVERiVlRlWW1JZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <731679637338244FA7D91F5CBA01AF8B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609953d3-4eb3-4841-fa54-08da4d1330c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 08:03:24.4450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: necZpJBv6mhPw92YtBiIRU/eyGJtpLCv6fHiOn7JKSZLDqi9+nXWQIs73dT8VUfPnwkx9F7lQ7uJgrXtxAlI8LaWCl6UNQoWtw262oxCbJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216

T24gMTMvMDYvMjAyMiAwODo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjA2LjIwMjIg
MTk6MTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMC8wNi8yMDIyIDE3OjAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IGh0dHBzOi8vd3d3LmludGVsLmNvbS9jb250ZW50L3d3dy91
cy9lbi9kZXZlbG9wZXIvYXJ0aWNsZXMvdGVjaG5pY2FsL3NvZnR3YXJlLXNlY3VyaXR5LWd1aWRh
bmNlL2Jlc3QtcHJhY3RpY2VzL2RhdGEtb3BlcmFuZC1pbmRlcGVuZGVudC10aW1pbmctaXNhLWd1
aWRhbmNlLmh0bWwNCj4+PiBodHRwczovL3d3dy5pbnRlbC5jb20vY29udGVudC93d3cvdXMvZW4v
ZGV2ZWxvcGVyL2FydGljbGVzL3RlY2huaWNhbC9zb2Z0d2FyZS1zZWN1cml0eS1ndWlkYW5jZS9h
ZHZpc29yeS1ndWlkYW5jZS9ydW5uaW5nLWF2ZXJhZ2UtcG93ZXItbGltaXQtZW5lcmd5LXJlcG9y
dGluZy5odG1sDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+Pj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4+DQo+Pj4gVGhlIFNETSBhbHNv
IGxpc3RzDQo+Pj4NCj4+PiAgICNkZWZpbmUgIEFSQ0hfQ0FQU19PVkVSQ0xPQ0tJTkdfU1RBVFVT
ICAgICAgKF9BQygxLCBVTEwpIDw8IDIzKQ0KPj4+DQo+Pj4gYnV0IEkndmUgZ290IG5vIGlkZWEg
d2hhdCB0aGlzIGlzLCBub3IgdGhlIGluZGV4IG9mIE1TUl9PVkVSQ0xPQ0tJTkdfU1RBVFVTDQo+
Pj4gd2hpY2ggaXMgdGhlIHRoaW5nIGFsbGVnZWRseSBlbnVtZXJhdGVkIGJ5IHRoaXMuDQo+Pg0K
Pj4gRm91bmQgaXQuwqAgVGhlcmUncyBhbiBPVkVSe0N9Q0xPQ0tJTkcgdHlwbyBpbiB0aGUgU0RN
LsKgIEl0J3MgTVNSIDB4MTk1DQo+PiBhbmQgbmV3IGluIEFsZGVyTGFrZSBpdCBzZWVtcy4NCj4g
V2l0aCBvciB3aXRob3V0IGJpdHMgZm9yIGl0IGFkZGVkDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IEknZCBsaWtlIHRvIG5vdGUgdGhvdWdoIHRoYXQg
SSBjYW4ndCBzcG90IHN1Y2ggYSBzcGVsbGluZyBtaXN0YWtlIGluIHZlcnNpb24NCj4gMDc3IG9m
IHRoZSBTRE0gKHZvbCA0KS4NCg0KVGhhdCdzIGJlY2F1c2UgaXQncyBzdXJwcmlzaW5nbHkgaGFy
ZCB0byBkZWxpYmVyYXRlbHkgbWFrZSBhIHR5cG8uLi4NCg0KSXQgd2FzIE9WRVIgTE9DS0lORyBp
LmUuIG5vIGMncyByYXRoZXIgdGhhbiAyLg0KDQp+QW5kcmV3DQo=

