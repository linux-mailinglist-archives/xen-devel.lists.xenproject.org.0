Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35196227F2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440794.694979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshwv-0000VU-3j; Wed, 09 Nov 2022 10:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440794.694979; Wed, 09 Nov 2022 10:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshwv-0000Ti-0u; Wed, 09 Nov 2022 10:04:49 +0000
Received: by outflank-mailman (input) for mailman id 440794;
 Wed, 09 Nov 2022 10:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oshwt-0000Tc-N6
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:04:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef71172f-6015-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 11:04:46 +0100 (CET)
Received: from mail-mw2nam04lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 05:04:43 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BLAPR03MB5588.namprd03.prod.outlook.com (2603:10b6:208:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 10:04:37 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 10:04:36 +0000
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
X-Inumbo-ID: ef71172f-6015-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667988286;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6DebaxirIgDCvrQKuDmkUTLD+QtR7JOvGp+PbmaJoeg=;
  b=HLa0FmRFPNsbE/73ozjg26QqoIA7IaT4Fto4MlYtbg/IW4SBk9j625cl
   25zAiFzXO4LAnlKtbPzwbafA/fgmIAIHCFb5eAVTfBSPeTXAhnqzD7uj4
   xjGFfn/4SkuEY/eYtAKsL6nymS6/8QksKf6Kdr9ur4owpbXlFLRp0Rn4K
   8=;
X-IronPort-RemoteIP: 104.47.73.170
X-IronPort-MID: 84478402
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aKMNTak5CI1tQhkl98IBxc/o5gxNJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaDT3Saa2LN2H1ft1/O46+8R8Dv5CGyNBnS1Y//Co3QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5A6GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aAJcgw/bzCAvPuNw++lR/FCiYc8B/C+aevzulk4pd3YJdAPZMifBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1c3iee1WDbWUoXiqcF9k0qGp
 2SA42PjBRIyP92D0zuVtHmrg4cjmAurBN5NROHgrJaGhnW5+FdUMzQ9DWLghuKEiUWaW45AE
 FEbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooL07gCDFy47RzhOQNU8sYk9QjlC/
 lOAgd7BHzFkt7yRD3WH+d+8sjeaKSUTa2gYakcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx74j/luYO3qS/uFXY2TSlo8CVShZvv1qPGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:OVYXhqzCzX/JEiJEu/T+KrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtqrQaC50YvLrf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84478402"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC9h763AKqSPNvuiYboJDF/PkPLjA8IVjy+o0u2hRwL6F2BJpGv3Qm9RHrHUbWSFRXnuXp5F6RLl4sihn+xxSMG/cfWwlKUXiss+TKBgUTi8AC28KnN6bP4ax1R1PuDyZJCY+2oOWLgPQJNX0ecEOud97oCGP5JIZTRAOPHwQcW2VF3veh9ZmlQ8DcWdyaj9ian/F6nx/huS5ZA7aL3LH2/zNoroEA0UsyOsntQNR2erBH9JPq9nVaBujOXxqqA0f4p5so0TcJpnHgpTzFK4zUvjcGBVaJivNzK+YnNsELww0ZO3FuxZBffVTrv4lD2IjNjvSp6y9S7OR2cP5JBPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DebaxirIgDCvrQKuDmkUTLD+QtR7JOvGp+PbmaJoeg=;
 b=U067ovhw0uCTjoEnjb2dN2NpqtngDepWnN/QEsucyFF1Qjm/M312QW+mBHZJjyAuVc1jyrNDDunP3enaD7CDlv1jjxI5YOmSD/zIq2Xng/ksi2Hh/IT4fltbZJbioeIsXVZXXUTc1Pc4JQClyqu5gcVQaHR7AU0aHeot5t4OLG2WHNpyTy9Q7y9skdSZEoVlK9hOeoTo5oTdTy1yNj3foR4KdMrap2oPt+u4YN02sSrAdMLW+C5JYB0YVI0a0v0ivW9BpMWaOTcZGB5moOCX8ViP2WKHZ4/hcqJNX19R1AfoxXuoKGldGv1prAh3am309rmUByJ/7VLEHvO36be3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DebaxirIgDCvrQKuDmkUTLD+QtR7JOvGp+PbmaJoeg=;
 b=HPbGS2QKZ4sFX6RQrmU7sP9a6/F7laqb6c9lF9mQj6CSkbQFf0cnvEZXrwgd9PhDVUx+/oucjtFg4h0ciI8F6a5Q25U7YQbyStAbXb7yuiWKph5XmzvuTDuAFUKhXpXqfkGJjFUwgADpS5FsaXQLNab1mfbxwcjjIRUKMjCXn7E=
From: Edwin Torok <edvin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Henry Wang <Henry.Wang@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix
 build error
Thread-Topic: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix
 build error
Thread-Index:
 AQHY84enx+9R1HXBN0OC3OTqctPuu6415EUAgABJboCAACSeAIAAA/uAgAAEpwCAAANGgA==
Date: Wed, 9 Nov 2022 10:04:36 +0000
Message-ID: <736E7341-587C-458A-B041-F5CC18E85CAB@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <09afc07ba0ba65afc02028bd6b4950d8e51af69b.1667920496.git.edvin.torok@citrix.com>
 <AS8PR08MB79910C8281C7C356450152C4923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <1e994604-7a3f-ef5f-63f4-d03e4abe4124@suse.com>
 <D9D3FE01-976F-4609-BBED-961BE59E09F8@citrix.com>
 <09c03186-bdfc-d931-33bb-e589b074726e@suse.com>
 <2d734f9a-0b50-8164-3fce-3efaca6d7b61@suse.com>
In-Reply-To: <2d734f9a-0b50-8164-3fce-3efaca6d7b61@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BLAPR03MB5588:EE_
x-ms-office365-filtering-correlation-id: 5ffd985d-1e6f-4308-ba4d-08dac239ce9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Fh2ez9rxqYJZz1+F8gGJTFRz9tGn+4X9Q+IbZCQHrhdyiPLV5uj20/1oA0F2BOWlHxhqTkRnwQqFG5g/LZfsGIJNDgVWQW/Ok4ccZv68rsZ95vIa459XXIVM4Add9bvoO/po3x9cyinI5b/5TgLXtUFbtIyfTU6ElwrcSMv+qDx1n5bK6MkHOeBVAJFGHjBqORGe4blkpDBjUiFmfFWj1F/q02CKLO4dGhRTurl9mBllTyCCG++qiLhbdZkNeuF6O6Z6KxsikHtA2CQrl21it5hrTcZClUkDOLzAbFuQEWRs5La8hVQSE6+QManSu4hcItymu3RQlwM6hcx1Od0ZzQUSAXq5Akwyc1Ou+ZmnXK/Bx9/+jImUb8cid5NHDDP3agbpVdEAH3+EwtlBcmWR3lZQ0EEeX+K3ycOImTri8V0DUClZFNUFvHgBGWSj8mYDZonNxIheHOxMZINQUXHbabJgYfKWSmxa2N5fE8+2PWKinA2zN9NpePgeBbo6e0UCIzyStHT2AX7UkcvpqbIU78zYTbNyAjtA2Hz2z4XyXh/ZD/8trwUsqjQucnDBbKc/8EjZEb81jtv8jLHBevSlkeXLcuxZR87362YWl9IPAMWKGjsFLlrIPPylmGUS/iMPA+3BARLe2vHwlgIM2mmeSdTAM8U40eFKzUG29d1ycIQReKdVXE+tsPkAIj+xAtE1BGEziJPR4CacdjHLgl6a6nS3EpmXjSyfriDnLjb+xsn+fg8gFLLds5FLRkOXlp6myQ70lgSRjDbYd11BxOjfya2UKOOPxQ8ojQ+Uhkeie1yFD/frgy9MD8rdMqqD6aGO3lYQUVATaCKk7sQStOvo3w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(66574015)(66556008)(83380400001)(186003)(54906003)(122000001)(82960400001)(6512007)(38070700005)(38100700002)(26005)(2906002)(2616005)(5660300002)(8936002)(6486002)(91956017)(478600001)(966005)(53546011)(6506007)(64756008)(41300700001)(66446008)(76116006)(66946007)(66476007)(6916009)(71200400001)(8676002)(4326008)(316002)(86362001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0lXR2ZpQ1NBMTVQTXlzZ2trMGRhM05GNlJMekE4Q2RUNFVYY2JFY3VJejNN?=
 =?utf-8?B?djRXMXpSWE5JQW1YSlpzVUZXNmt6bXZ2NjREZVlvQU1Qc1RzRkJEVTVNa256?=
 =?utf-8?B?b0NXV1o2NHZSUEJKdTY2UEUvMllKY2Y3cW5rYnhxVWlwRWtxN1hjYzVleUph?=
 =?utf-8?B?ek5tazM3aXBhY0w1SnRMZmFyNm9QUTJxWmNMRDVLR3FKOVJKSXZIVVkvSHhF?=
 =?utf-8?B?R1FFWUdDbjNxbi93bWFXQS8yalljRzFYdGZJK29DRlA0eXNDM3ljOTlLU0xB?=
 =?utf-8?B?M2FnNjh4WG5HMi9HbFNQeXBuTVo3QU5oZHA2MDZPNGlpdHV2MnlBMm1HUVNs?=
 =?utf-8?B?TndEQ1I5eDQzY2VPdFFDOExSRVhtSll6N0Y2SkRLUFVqOG5LdndJNEN5ZHBR?=
 =?utf-8?B?OGFlWW50dGgvV2s3bTZSbVd2RHRsWTgyekcvVENXdXh4eG4zNmJhendDNStk?=
 =?utf-8?B?Zm9SVWR2Y01CY0FFV2g2bWdIRXIrdWdvRzBLOXhXN1ZmN0FUcFJhWVVTMGlu?=
 =?utf-8?B?WEhkOHhVbWxKU0pHNXVBN2ozUVF3R0JoYXp6OCtNNTJlM0xGMjVTOTBlQjNs?=
 =?utf-8?B?MW1jcGdBUTI5VC9ieWUveFV4MS9rakZaeTA5SHFDcGRQZGxZbXVGYU16ZW1W?=
 =?utf-8?B?Tk1KVU5wdlg1STNCUUhvRlA0cWFlNTVWUGFvenlEK2ZwbVZ2bzBoUzRNdmZs?=
 =?utf-8?B?OE9DY3k0ekdySUJ5UjlHekpINWVwcEU2RXVWRUNxVlU5NEJ3TS83WFdiYW1W?=
 =?utf-8?B?Si9idmVlYm8zYU5GUHV2ejJFbUJuMHhTUkhHZWd1eWFKWitvUWw4bkZSZG56?=
 =?utf-8?B?azlhNlJ3ZDd6UVJ3SHpubzJwZlN1c2cxNmxSZXBXVU9xMGlmL1ZXRXhLOFZN?=
 =?utf-8?B?b05pT2xMSEtmK0hHblZrVDQ5OGo2WG9UeVQ1RTN4TWRRNnpYc25wQ0kwVTV3?=
 =?utf-8?B?RWZHbEJyMDdQRnRVMWd5MlBDU2pQaUoxeW1TUFFHbjF5UHBueFRYZlFlL3dZ?=
 =?utf-8?B?OUEwTVJLbkIvc0p1bDZjNUp6TGhWd3JRdnpqck41WUI3Si9YcDAxK29uSnNw?=
 =?utf-8?B?UFZRbUVXQnU0MGY1SVNWdXo4L0U0Y1A0QlRpOWErMmcrUFgyS3orU2JvWHd2?=
 =?utf-8?B?dTYxbk5CY05hQkJCMUV4U1FGS3RBdko2d0gwek92VHFKeUdEWUcxWXdpeVlu?=
 =?utf-8?B?blYwb3BCK0tHUGUwY29UUGVYdE9xNlFvRjZRc3hKS0lVREY2VmZUbklpOFMv?=
 =?utf-8?B?SXZSZjRwLytmMEViY0dGdlNJb2FmQzAybGlaRGpvcUVVOEs0bGFzbERkQjN4?=
 =?utf-8?B?QnFGb0lUTGJUNjJ2WS9SYlN4ak1xLzR0OHJPa2ptMWszVTh4Z2lPZnZiWExM?=
 =?utf-8?B?OEFKWElDV1gvYjBqa3hqbjJrMWNxKzVpc3JiZmIvWitsSXhBRjdGOVZXNUU4?=
 =?utf-8?B?Vll0UldUWEViY0I5cW5HMnJKNmJ1OWdpODY5MlRhWEM0aS9hM0k2dHVhejJ1?=
 =?utf-8?B?MGNHZ3poaDRzWDYzaTBRb2Y5cXR0SS9FaVRwc2xZQXJlRW9qNnQra3FYbDVk?=
 =?utf-8?B?a1VDVmsyV2Z3QnArRStTSkl3aUdRZkt1N2hzU1B4K0g2S3NlcDNDL3FuR1Nt?=
 =?utf-8?B?MXBSK0RVM042L2xrdmVWeDZGWTEzaFk2cEhXZGVnUy8xM2QydktpWmxVbVk0?=
 =?utf-8?B?Kyt0SktwNHN3SDlIR0ZhTmFZT1RtTWlBS0hhM2EyalNxbExobW5ldzh0RWp4?=
 =?utf-8?B?OFFYYU42UFB5MThaellmOGZUdkd1cVBzUDlGeG9rYkxNbWkvbVIwM0RUTmE0?=
 =?utf-8?B?TVg3dE9KcEdGaGowVEVwb3N1cDdhRndhWEd6SW1mODBmdmFGajJ3K0U2NFph?=
 =?utf-8?B?OEVXSzFNZlM2WjZWRzhJeHphOXNDaEZodUxtNUV5TThGN21oOEJGalBWMVZR?=
 =?utf-8?B?b2JsNkc4YTFWWHVOTmlBUlFmMUs4STJWbE9nc25LZytiWFFvSUg4QkgzTzRY?=
 =?utf-8?B?QmRicDhQMlNTY3Q1c0FQR3k0STAvNno0b2d4ZXRROURFbm9ZVzNiakM4eVoy?=
 =?utf-8?B?UHBHS1JMMUtRTWdUcFhPc3FZbEFWOFFuNWM2RW5WaGl3SSsrN0hZMWpydzg1?=
 =?utf-8?B?MWdxV0wxUm1aMnNMYjRxSFN3NmgzczQwT0Yxd0J1OU5QQTVkdSt2bjNVdUln?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B33199254E1C9A408C646BE550469377@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffd985d-1e6f-4308-ba4d-08dac239ce9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 10:04:36.0958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6blXLLUfYEaL9mCP/5T5TYkqQG+X1kreHfiFFIwphi6xVh6Cpm+G2XrBwkKa0CQuU7KbXtgCuBgXiXh1HZxQkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5588

DQoNCj4gT24gOSBOb3YgMjAyMiwgYXQgMDk6NTIsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOS4xMS4yMDIyIDEwOjM2LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+IE9uIDA5LjExLjIwMjIgMTA6MjEsIEVkd2luIFRvcm9rIHdyb3RlOg0KPj4+IA0KPj4+
IA0KPj4+PiBPbiA5IE5vdiAyMDIyLCBhdCAwNzoxMCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IE9uIDA5LjExLjIwMjIgMDM6NDcsIEhlbnJ5IFdh
bmcgd3JvdGU6DQo+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4+PiBGcm9t
OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPj4+Pj4+IFN1YmplY3Q6
IFtQQVRDSCBmb3ItNC4xNyB2MyAwOS8xNV0gdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1s
OiBmaXggYnVpbGQNCj4+Pj4+PiBlcnJvcg0KPj4+Pj4+IA0KPj4+Pj4+IEJ1aWxkaW5nIHdpdGgg
RHVuZSBpbiByZWxlYXNlIG1vZGUgZmFpbHMgd2l0aDoNCj4+Pj4+PiBgYGANCj4+Pj4+PiBGaWxl
ICJvY2FtbC94ZW5zdG9yZWQvc3RvcmUubWwiLCBsaW5lIDQ2NCwgY2hhcmFjdGVycyAxMy0zMjoN
Cj4+Pj4+PiBXYXJuaW5nIDE4OiB0aGlzIHR5cGUtYmFzZWQgcmVjb3JkIGRpc2FtYmlndWF0aW9u
IGlzIG5vdCBwcmluY2lwYWwuDQo+Pj4+Pj4gRmlsZSAib2NhbWwveGVuc3RvcmVkL3N0b3JlLm1s
IiwgbGluZSAxOg0KPj4+Pj4+IEVycm9yOiBTb21lIGZhdGFsIHdhcm5pbmdzIHdlcmUgdHJpZ2dl
cmVkICgxIG9jY3VycmVuY2VzKQ0KPj4+Pj4+IGBgYA0KPj4+Pj4+IA0KPj4+Pj4+IFRoaXMgaXMg
YSB3YXJuaW5nIHRvIGhlbHAga2VlcCB0aGUgY29kZSBmdXR1cmVwcm9vZiwgcXVvdGluZyBmcm9t
IGl0cw0KPj4+Pj4+IGRvY3VtZW50YXRpb246DQo+Pj4+Pj4+IENoZWNrIGluZm9ybWF0aW9uIHBh
dGggZHVyaW5nIHR5cGUtY2hlY2tpbmcsIHRvIG1ha2Ugc3VyZSB0aGF0IGFsbCB0eXBlcw0KPj4+
Pj4+IGFyZQ0KPj4+Pj4+PiBkZXJpdmVkIGluIGEgcHJpbmNpcGFsIHdheS4gV2hlbiB1c2luZyBs
YWJlbGxlZCBhcmd1bWVudHMgYW5kL29yDQo+Pj4+Pj4gcG9seW1vcnBoaWMNCj4+Pj4+Pj4gbWV0
aG9kcywgdGhpcyBmbGFnIGlzIHJlcXVpcmVkIHRvIGVuc3VyZSBmdXR1cmUgdmVyc2lvbnMgb2Yg
dGhlIGNvbXBpbGVyIHdpbGwNCj4+Pj4+Pj4gYmUgYWJsZSB0byBpbmZlciB0eXBlcyBjb3JyZWN0
bHksIGV2ZW4gaWYgaW50ZXJuYWwgYWxnb3JpdGhtcyBjaGFuZ2UuIEFsbA0KPj4+Pj4+PiBwcm9n
cmFtcyBhY2NlcHRlZCBpbiAtcHJpbmNpcGFsIG1vZGUgYXJlIGFsc28gYWNjZXB0ZWQgaW4gdGhl
IGRlZmF1bHQNCj4+Pj4+PiBtb2RlIHdpdGgNCj4+Pj4+Pj4gZXF1aXZhbGVudCB0eXBlcywgYnV0
IGRpZmZlcmVudCBiaW5hcnkgc2lnbmF0dXJlcywgYW5kIHRoaXMgbWF5IHNsb3cgZG93bg0KPj4+
Pj4+IHR5cGUNCj4+Pj4+Pj4gY2hlY2tpbmc7IHlldCBpdCBpcyBhIGdvb2QgaWRlYSB0byB1c2Ug
aXQgb25jZSBiZWZvcmUgcHVibGlzaGluZyBzb3VyY2UgY29kZS4NCj4+Pj4+PiANCj4+Pj4+PiBG
aXhlczogZGI0NzE0MDhlZGQ0NiAidG9vbHMvb2NhbWwveGVuc3RvcmVkOiBGaXggcXVvdGEgYnlw
YXNzIG9uIGRvbWFpbg0KPj4+Pj4+IHNodXRkb3duIg0KPj4+Pj4gDQo+Pj4+PiBOaXQ6IFRoZSBm
b3JtYXQgb2YgdGhpcyAiRml4ZXM6IiB0YWcgbWlnaHQgbmVlZCB0byBiZSBmaXhlZD8NCj4+Pj4+
IA0KPj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRv
cm9rQGNpdHJpeC5jb20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4gUmVhc29uIGZvciBpbmNsdXNpb24g
aW4gNC4xNzoNCj4+Pj4+PiAtIGZpeGVzIGEgYnVpbGQgZXJyb3IgaW4gYSBwcmV2aW91cyBjb21t
aXQgdGhhdCBpcyBhbHJlYWR5IGluIG1hc3Rlcg0KPj4+Pj4gDQo+Pj4+PiBZZXMsIGdpdmVuIHRo
aXMgaXMgYSBzaW1wbGUgZW5vdWdoIHBhdGNoOg0KPj4+Pj4gDQo+Pj4+PiBSZWxlYXNlLWFja2Vk
LWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+Pj4+IA0KPj4+PiBBZmFpY3Mg
dGhpcyBwYXRjaCB3YXMgcHJldmlvdXNseSBwb3N0ZWQgaW4gaXNvbGF0aW9uLCBhbmQgaXQgd2Fz
DQo+Pj4+IGFscmVhZHkgcmVsZWFzZS1hY2tlZC4gV2hhdCdzIGxhY2tpbmcgdGhlcmUgaXMgYSAy
bmQgbWFpbnRhaW5lcidzDQo+Pj4+IGFjayBvciBhIHByb3BlciBSLWIuIFdoZW4gaXQgbm93IGlz
IHBhdGNoIDkgaW4gYSBzZXJpZXMsIGl0IGlzbid0DQo+Pj4+IHJlYWxseSBvYnZpb3VzIHdoZXRo
ZXIgdGhpcyBjb3VsZCBhbHNvIGJlIGNvbW1pdHRlZCBpbiBpc29sYXRpb24NCj4+Pj4gKGl0IGxv
b2tzIGxpa2UgaXQgZG9lcywgYnV0IGEgY2xlYXIgc3RhdGVtZW50IHRvIHRoaXMgZWZmZWN0DQo+
Pj4+IHdvdWxkIGhhdmUgYmVlbiBiZW5lZmljaWFsKS4NCj4+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4g
WW91J3JlIHJpZ2h0IGl0IGFscmVhZHkgaGFzIGJvdGggYWNrcywgaXQganVzdCBoYXNuJ3QgYmVl
biBjb21taXRlZCB5ZXQ6IA0KPj4gDQo+PiBPaCwgdGhhdCdzIG9ubHkgYmVjYXVzZSBJIG92ZXJs
b29rZWQgQ2hyaXN0aWFuJ3MgYWNrLiBXaWxsIGNvbW1pdCB0aGlzIG5vdy4NCj4gDQo+IEJ1dCwg
c2lnaCwgSSBoYWQgdG8gZml4IHVwIHRoZSBwYXRjaDogRXZlbiB0aGUgb25lIHN1Ym1pdHRlZCBz
dGFuZGFsb25lDQo+IHVzZWQgc3BhY2UgaW5kZW50YXRpb24gd2hlbiB0aGUgZmlsZSBpbiB0aGUg
dHJlZSB1c2VzIGhhcmQgdGFicy4gQW5kDQo+IGV2ZW4gaWYgSSBoYWQgd2FudGVkIHRvIHB1bGwg
ZnJvbSB5b3VyIGdpdGh1YiB0cmVlIEkgd291bGQgaGF2ZSBoYWQgdG8NCj4gZml4IHVwIGF0IGxl
YXN0IHRoZSBGaXhlczogdGFnLg0KDQoNCkkgdGhvdWdodCBJIGZpeGVkIGl0ICh0aGUgbWlzc2lu
ZyAnKCcpLCBidXQgdGhlIGZvcm1hdCBvZiB0aGUgRml4ZXM6IGxpbmUgd2FzIG5vdCBkb2N1bWVu
dGVkIGluIA0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvU3VibWl0dGluZ19YZW5f
UHJvamVjdF9QYXRjaGVzICh3aGljaCBpcyB0aGUgY2Fub25pY2FsIHJlc291cmNlIEkgdXNlIHdo
ZW4gc2VuZGluZyBwYXRjaGVzKQ0KYW5kIEkganVzdCB0cmllZCB0byBndWVzcyB0aGUgZm9ybWF0
IGJhc2VkIG9uIHRoZSBGaXhlczogZW50cmllcyBJIGZvdW5kIGluIG1hc3RlciAoc29tZSBvZiB3
aGljaCBoYXZlIG9yIGxlc3MgY2hhcmFjdGVycyBpbiB0aGUgZ2l0IGhhc2gpDQoNCkkgc2VlIHRo
ZXJlIGlzIGEgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9wcm9jZXNzL3Nl
bmRpbmctcGF0Y2hlcy5odG1sIHdoaWNoIGhhcyBzb21lIG1vcmUgdXNlZnVsIGRldGFpbHMsDQpp
bmNsdWRpbmcgYSB3YXkgdG8gYXV0b21hdGljYWxseSBnZW5lcmF0ZSB0aGUgRml4ZXM6IGxpbmUg
dXNpbmcgYSBnaXQgY29uZmlnLCB3aGljaCBpcyB2ZXJ5IHVzZWZ1bCBhbmQgSSdsbCB1c2UgdGhh
dCBpbiB0aGUgZnV0dXJlIGluc3RlYWQgb2YgY3JhZnRpbmcgaXQgYnkgaGFuZA0KKHdoaWNoIGlz
IHdoYXQgSSd2ZSBiZWVuIGRvaW5nIHNvIGZhcikuDQpJJ3ZlIGVkaXRlZCB0aGUgd2lraSB0byBp
bmNsdWRlIHRoaXMgaW5mb3JtYXRpb24gbm93Lg0KDQo+ICBTbyBJIGVuZGVkIHVwIGhhbmQtZWRp
dGluZyBpbmRlbnRhdGlvbg0KDQoNCg0KVGhhbmtzLA0KLS1FZHdpbg==

