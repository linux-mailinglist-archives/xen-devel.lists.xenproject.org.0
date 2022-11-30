Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65063DBC4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450075.707243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qh8-0001Me-Ui; Wed, 30 Nov 2022 17:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450075.707243; Wed, 30 Nov 2022 17:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qh8-0001J7-OG; Wed, 30 Nov 2022 17:16:26 +0000
Received: by outflank-mailman (input) for mailman id 450075;
 Wed, 30 Nov 2022 17:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0Qh7-0000ky-Al
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:16:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6995734-70d2-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 18:16:24 +0100 (CET)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Nov 2022 12:16:22 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SJ0PR03MB5774.namprd03.prod.outlook.com (2603:10b6:a03:2da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 17:16:20 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 17:16:20 +0000
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
X-Inumbo-ID: b6995734-70d2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669828584;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8XuEESIUVAf3nFKmdhUjcwz2VcWpkX6PfwwH39adzto=;
  b=Nj3oz1ufSUjlJp7FiUntbwO9KyKyVZwkX/Jr55IhzdkP++sqYFWRP4A6
   Pp9j6M9Kqek2ykeihnagOZu5/mdTtcXp82ppiYSJZuLKrvgY1mPu/fx8D
   ptGbB/Q7fpYLwLlyyduHR1y1JJwrfkqir6Sgu54opQhNi+sV0k+ug6EHm
   o=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 85904162
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hQvC7qstBsDgNGlALXjKipYTUefnVEVfMUV32f8akzHdYApBsoF/q
 tZmKWiCPPmONjHyKox0PI22/UoHvsTRz9VnSAdsrn1kRS0Q+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaFzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBQ8SMEinlqWN0K+EE/FjgO14HNvWFdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60bou9lt+iHK25mm6Vq
 nzH+SLlBQsdN/SUyCaf82LqjejK9c/+cNJPReXkr6Aw6LGV7mMjVTIVe3CZm+aou0+3UtV9d
 nxIxgN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc6TCIn/
 kWElNToAXpoqrL9dJ6G3rKdrDf3Mi9MK2YHPHYAVVFcvYilp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjvNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:Qgfc+qPTKcewZ8BcTxr255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UossHFJo6HlBEDyewKiyXcV2/hcAV7GZmLbUQSTXflfBOfZsl/d8mjFh5NgPM
 RbAudD4b/LfCNHZK/BiWHXLz9j+qj8zEnBv5aE854Hd3AMV0gU1XYBNu/tKDwReOApP+tdKH
 JBjvA3+gZIf055Ui1BPBQ4thL4zeHjpdbHehgAHhg99U2kiz650r7oH3Gjsis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv+/olbg9zoz/pEHYiphtIOIjvhpw60bMA5Mofy/QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/AyhTtyzEn7l7l0Bu9jWH4qcL0aTomA45qhJ5fcDHe90081esMnp
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2FfeZF2Us4QkaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hUxsC2VHhbJGbEfqFCgL3W79FlpgE886Iq/r1Zop7GzuN6d3Bw3Z
 WADk2vrsAWciZZV9MkOA5Le7rINoWEe2O8DIvVGyW8KEhPAQO8l7fnpLoy/+2kY5oO0d87n4
 nASkpRsSood1vpEtDm5uwBzvljehTIYd3B8LAW23FCgMy1eJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H8A6EwhSbOQF/tIgH16eqMPCLYPn8uTdbfbIPbLoVTIpQHn2DH
 cPVCX6YM9A8keoUHnlhwW5YQKmRmXvuZZrVKTK9ekaz4YAcoVKrwgOkFy8otqGLDVT25ZGCn
 eW4ImX5Z9TiVPGiFogtV8ZSSa1Jnwlkondbw==
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85904162"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pc8PL864qek7RdU0y6hnx01evzvvcZc6WKUuN3iUbITZVTpAXVQSAMd+HJ0aQt9tuL9xQcSLsHFaLGvX+xV+izmt4tAQHZTWhAk+P/rWKsSc4UOWb09wPDspgL1i1qYVduEArkZ6ylZ+P0wcvGeFUB0TMc/3l3CwzScjxq3EtK08dNrKJyZkBlpJNEL/X75zsaR/E66ZqaBOvXtXnz3+m+Wk4yGZ04JIBGWwnrx1ZclFUmpsMan1RQ7sFAYlDzjYjmbIhKUbe63fxKSr2VGuiFxB2bzJ6SHumD654O7yG3PM/B4GC6f4o8x0MMr73kH6udBA7KQNc8pCS1grm2juPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XuEESIUVAf3nFKmdhUjcwz2VcWpkX6PfwwH39adzto=;
 b=Vt72nIl8bJUZMu1Y+QUIFPjiImvBSvyrMIndXvfNQekwQbonBmGFmktk54cwkskENGd6TyT5YBPKIjg4GTdgIZTQx3vYCr45oWlCZaND4VRWC6zZWnfjXGFM8JUDk2tyUmZZl7hfkGDInm1jlcveQDrBKLzzhVOc5khnmIUYre52h3OWBjLzwDtfcNuW9lwYjNkOTV7SQzYSZLsfrNxQaOCzAyNy5/DgLeJszEKauKS1EL+0p4UV2L9P2/01Ftro2XX2IBg5wVpk6Hpnu2e/rmpyL+AVL2cgeI30xFZFxtA6Cckh2RxzPxLnS7nDLHFKdntXrrxdQgaYFc177eqyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XuEESIUVAf3nFKmdhUjcwz2VcWpkX6PfwwH39adzto=;
 b=MoSE7SvMXfdXsprBEoxQ8HXcVtbPObIEZJHL7E0RepbsVQt6XnCRAC05mO4t7XM6F+lViWnVLtQKW8PBTwljyQTxUENz8E33aSq5xica4MrA/FaTgcDpqNZ2qiMj9OJ4jD/r76M566Hjy9cEN+OEXzaTkbZUUIBWzuMIyLP3FU8=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 2/6] tools/oxenstored: Bind the DOM_EXC VIRQ in in
 Event.init()
Thread-Topic: [PATCH v2 2/6] tools/oxenstored: Bind the DOM_EXC VIRQ in in
 Event.init()
Thread-Index: AQHZBNyFjTFW7WdVpk6WP9HBQn+OQa5XtSgA
Date: Wed, 30 Nov 2022 17:16:20 +0000
Message-ID: <CAE5A014-B021-4B1C-8F47-E58578C97DBE@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-3-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SJ0PR03MB5774:EE_
x-ms-office365-filtering-correlation-id: 561ca59c-3d30-4524-edbc-08dad2f69996
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 is0wTqZnOb/xhmIz1GgPLK7ntGK8433K52DkiLjb3Mku2qtaETRPegkxvIkgO0qUpNKw0/oPDTqlI2yITIwZM7lRWmrjT5x708OzUvn1BPVlg+xyfZvdJxNF7p6yL6oLc153la+OskzKUavBpbFROBdVVXmf3yjxotMMOE5XAtpnDcB1hfb9WGerp4roBBTqNn4YZITF1k6JQMCUam0z1RH0QJ8ZmKy2NN2QDmOwFbdFCLNp4Cx6YZ9JiW6nJfDuIB/MxoVj6DvARI1tnZ9G/zcJ45WcvzPTbLSeXgVN6DNoFFD2BktdA+PfwEnNcpRyBG7FF68yVrDkLSWu3HidfhTyzyb4Z0ISwSHxgxVhtxwDDskOKNlHXLO9EMVln6GCbuJdTRv9qjdFklkxVSf2fk/SGSaMuhIFPFdS7VSqfZcmQMT0DRkPWAhwUvrPAXetVblfmzL1kgmCbLX7pV7lPouuR4oq2kl1N8Q9TC8RabYLMPXwywMicgOpDKnIwjLtKA78doz2DLraJd7YPLTbLuqfjW5gCXuoKgyB9zZ+x7+KS8T2who538u99a/vDrsKd5Q5ceP4hKrAK/5NVw1YxsvBZdt/MCRzdIMLkFE0syhV7G8ZmMJkvBdlqvNYv0JTDBdKta53qZdEDF6+Hi1xKUYob9GyBhFg9Yh28yaXvjXhurtWnDy48v25O3UgFndX5FdgN9kUE10E3fH8JlEIguTUDbimUXkQtgVeP7MP9Zo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(66574015)(83380400001)(2616005)(53546011)(6506007)(6512007)(186003)(26005)(71200400001)(478600001)(41300700001)(36756003)(107886003)(2906002)(6636002)(122000001)(316002)(8676002)(54906003)(4326008)(76116006)(37006003)(91956017)(38100700002)(82960400001)(6486002)(66476007)(66946007)(66446008)(66556008)(33656002)(86362001)(64756008)(8936002)(6862004)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFlMYStHNU5uY1ZVQmdPZ3FFeFI4c2VhMDloZjJpN2J6VVZPaE9iWiswOFVv?=
 =?utf-8?B?YlkwbndrZGNWTm9vK1A0eXJ0UW8ycStXdURLVkx4T0IwTkZRTWRNVUFiQnQx?=
 =?utf-8?B?VzdXbXZSRS94TmpocHExUTFVcXFsRVFwN1RKc0ZaUE1vTjVGMUF6bFBKcWlk?=
 =?utf-8?B?ZC9qTzVyYlBpK0gyVTFwQml4YktpYjJEV05RS2FORWZmZEFFYmtGb2psNkZs?=
 =?utf-8?B?N3RPQnc0T01QdStSNHFIMjZLbnpuSWlSQ3N2R2pXUm1qNUkrRnVxcVA3aHkv?=
 =?utf-8?B?aHpCWmJiK0hTUzNTWVllR3BlUjhqQTRXK2xYTzVSMVRFZlNvakJCblVzdndm?=
 =?utf-8?B?Q2tpOGRZWVNZRXBXMWxsZW9RaUh1RTlnMWZqRXVPMWQxblA1Q0JXeWJ3eDZ6?=
 =?utf-8?B?MFdHeUlDSUxxYmFmek80aG80aXR2WjN0dVZFek5Wd2pVV3lvR0ZvU2ZMejkv?=
 =?utf-8?B?M251SmdSWkdDS2JONGQ5OTZoT2sySElLZW9SM0RyZk8vV254VlcrY1EwdStG?=
 =?utf-8?B?Q2NkRFg0cjkvbzBJY3RINEs0TjNJQkprdE9wWGZpSHkwYXF2dGxUVGRPOFY0?=
 =?utf-8?B?enlXdFVoVUFpL3RMc3htTFA0TXl5ODFLQ1dCd3pkQVpaZ2c1c3dVbC8xazNO?=
 =?utf-8?B?NEdlYmNqeTE4SjBsSlNzbWhFWTNzNlNNRWwyZUtjeldteWZDNGhpalVMMVQ0?=
 =?utf-8?B?dWZKV3h5dGtrbVFJWnM4QU1xay81ckVHUmhmeTI4aFVyb3dKWWhISStmajlE?=
 =?utf-8?B?SW1CSCsyZ0x6cGdHZXFjUDRNVGMyMG9KSXlUY2lTTk9XRFJWb2xIVFVnVXpT?=
 =?utf-8?B?c0UrY1lQczF5NmxDZ1JORCs1Ymx6TmJibHhScm9vZ3pCT3RtM2wzRElvRlpn?=
 =?utf-8?B?RWF4UnVFK2FzRnl6Zlg3bEVjamFudGlNaFhBcWw4aG95Z0tNMzRyRXd3NVo2?=
 =?utf-8?B?SlZuSHdVQ2ZxQUlQeHZSbDU0Slg5THlZbVNIQm9tZzVhUUlzY0FpWS9jV0JZ?=
 =?utf-8?B?eGNPbGVWdFZHVE03eHp6UHB6MFdTbGR1ZXdiaCtKbVJDZWVMTkpmTCtPaHBr?=
 =?utf-8?B?WThHd1NGZTFWT2ZqZm5TVTJlSFU5R0lDSnE1RTZuNElOTk92V0hNU1pIOG1z?=
 =?utf-8?B?TzRCaGlhMHE0clQ1WHpTeXZxRTUvUUErL0xYQVgwdklNQ1d3Rk4vWHVHSEVE?=
 =?utf-8?B?aWRUMmdrRVZSVk1VQ1pGckJsaTN0TnN0ZDYzWFlQZGxqQVFTWi9OTHNXWHps?=
 =?utf-8?B?alJGZS82WFc5ZUdRdThyay83QXRyRFZuQnlLY0VTc0pWM1RmendpMk9SYUhN?=
 =?utf-8?B?bW9FcHd3NXZtbThwd2txN28zTm1JZGx2YytEZS9uUUdmeW14NjFqUDhyZFkz?=
 =?utf-8?B?bUU0bm5VZ3UyZ1hpNFRKMEc2cVorOGdmUURZVEdFYTMrSUJVZ0xIdkhJN1F1?=
 =?utf-8?B?c0JWOWpaWjJBMTJaY3lVcGM4b25uSThZNDN2ckFOOGZGbHFDNi9BVzFLdE9N?=
 =?utf-8?B?RkZ6bWE0Ri8yVnpDd3NWMVlUVHhjQXZ5S1daYTgyRDNLQUJOZmhQRU0vU05M?=
 =?utf-8?B?S0lCSjFmM1BnSnM2Smpqc3FFQVFiWFFpM2FPQWxaQ3hjVWVxcTU3MWE5TGZt?=
 =?utf-8?B?dW1BWVlNQ3QzSWUveFN0aVJWS2I4S05qTU0xdE9pc1FPVkdBNXdnRFV2YkJP?=
 =?utf-8?B?N0phWnNReVpYZXZnZys1NTZ5dmdWb0VmdTVNNnVsWm5BSWZ4U0c3bFhwdFZt?=
 =?utf-8?B?YTBqcVdnaTBIWERsR1lKQVc2N0t6UnRNVVhWYnJhUng1bkpMU01udHlEZ2pV?=
 =?utf-8?B?Ynl3am9BSGpJTTZ0TkFPU0JQQ1liNEFTVDlOdWFObmdSeWhUZlJoSE9na2hT?=
 =?utf-8?B?WmFpaFlmTUtBRmZNZXdzVExTTDF5ZzdPdkFac1RQODZzbzJYVE1KR0gySGwy?=
 =?utf-8?B?cy9OZCtqUDhjMXFjK1h6YVR4SnJuNGF3cS9WNzlHc1o0ay9HbGJ2U1NsRFZC?=
 =?utf-8?B?eGZ6eXFCQUZjMXB5R2ZiMHdVaGFaMGdhM0M0TklZeHFyTjZ3QXBwWmJsalNO?=
 =?utf-8?B?V05GTWl1aTNHZkhrS0JBT1ltbTRsa0tWRFYrNW55UER3Y2tSSjNIUjNrRTEz?=
 =?utf-8?B?VFJjdkRUS2dHemVCYSsvOXVoRHZ2NXhOWjJrMVAwQWhDZDc1cjd5aTd0RUE0?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6EC9E58523F02428915D1162283C3E0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kxxqgNS2XmxmTyHh4Ko6If9yD2eqwZ81iyoA4UrtK1yoyuHMFKijroZhQnr9xMSu9zWxPDhFYiaU8r3Alr3PHvyHHFQy5d6CIL95qItykJqyXo0yHtDGMqJmdVAuahcWrXH/Tr1oBR4MsImRXX4iwapxqcVVMH1G02Kefl91lm1kSF3BSm/gHLgJycz/t4KMT4w2sGSyw2CcFcOptOqGLeXCgUmJuVerqcjSBrCdGYL1tIhJCjluO/mSx8WsRPhLCINyDmbJ7ZkpY1i4gG1s8yephgTQi9VDXgneoqff/gMOu+hmxw09BWrq4Y3uwWDr1cZBTxatlbYw2hN6utZnpktkr1cRvOZiNDNPi2vWU5QXY8KdakeymN5Wojj1dnfawXoxvQkqCGUkfpXnp3/NG3cp1XFHGbNkR55+mGLHykJp6Pze58A62OG7syGe1d97pOWbDtsra6x/HbHIFsfNKeL9SuG/wSHgh3a3po0kfwYunUhVEwwqN6l6Ap+/v5LWDP4tjoICSmfmjg04Blfkk3Rsxse0DGqeImJTsG4okQVkxuhNNGuhqSzh49vzA/nwUm+4dyZA2f0BNn2btJRw23lsN+Yz4Hulp2mCIxY8vEQaVuh44HfxEUDjZ/VeIfbd8H0Qm9awvDooXVlpjNi2iG6CjVhy8k8x9vXoaDvgXZhr+VzVDYFP2W78zGDEMwqAIc5H2Mg9lV33/ji1XQMMmmyMDxLLTknClNi3+oZnMzlHm+F4nuZ7mlNCGQ9fSA5kAALExP+CNI5uGnSssgPNyeuIlyE14dOwzF1NzQxaGMX3WBw3JIzYNxUkjgkdXfRi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561ca59c-3d30-4524-edbc-08dad2f69996
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 17:16:20.6627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6rL6b1+Y+uNRnjoZ7vWJxHil8LPtFM4/ZC8egzUe9N2/A40DcOT6aoAWsiP9R6K7qTbEF7uXUC8OZCEIaOS6EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5774

DQoNCj4gT24gMzAgTm92IDIwMjIsIGF0IDE2OjU0LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFhlbnN0b3JlZCBhbHdheXMgbmVlZHMgdG8g
YmluZCB0aGUgRE9NX0VYQyBWSVJRLg0KPiANCj4gSW5zdGVhZCBvZiBkb2luZyBpdCBzaG9ydGx5
IGFmdGVyIHRoZSBjYWxsIHRvIEV2ZW50LmluaXQoKSwgZG8gaXQgaW4gdGhlDQo+IGluaXQoKSBj
YWxsIGl0c2VsZi4gIFRoaXMgcmVtb3ZlcyB0aGUgbmVlZCBmb3IgdGhlIGZpZWxkIHRvIGJlIGEg
bXV0YWJsZQ0KPiBvcHRpb24uDQo+IA0KPiBJdCB3aWxsIGFsc28gc2ltcGxpZnkgYSBmdXR1cmUg
Y2hhbmdlIHRvIHJlc3RvcmUgYm90aCBwYXJ0cyBmcm9tIHRoZSBsaXZlDQo+IHVwZGF0ZSByZWNv
cmQsIHJhdGhlciB0aGFuIHJlLWluaXRpYWxpc2luZyB0aGVtIGZyb20gc2NyYXRjaC4NCj4gDQo+
IFJlbmFtZSB0aGUgZmllbGQgZnJvbSB2aXJxX3BvcnQgKHdoaWNoIGNvdWxkIGJlIGFueSBWSVJR
KSB0byBpdCdzIHByb3BlciBuYW1lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENDOiBDaHJpc3RpYW4gTGlu
ZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQo+IENDOiBEYXZpZCBTY290dCA8ZGF2
ZUByZWNvaWwub3JnPg0KPiBDQzogRWR3aW4gVG9yb2sgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+
DQo+IENDOiBSb2IgSG9lcyA8Um9iLkhvZXNAY2l0cml4LmNvbT4NCg0KDQpyZXZpZXdkIGluIHBl
cnNvbjoNCg0KUmV2aWV3ZWQtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5j
b20+DQoNCj4gDQo+IHYyOg0KPiAqIE5ldy4NCj4gLS0tDQo+IHRvb2xzL29jYW1sL3hlbnN0b3Jl
ZC9ldmVudC5tbCAgICAgfCA5ICsrKysrKy0tLQ0KPiB0b29scy9vY2FtbC94ZW5zdG9yZWQveGVu
c3RvcmVkLm1sIHwgNCArLS0tDQo+IDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9l
dmVudC5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9ldmVudC5tbA0KPiBpbmRleCBjY2NhOTBi
NmZjNGYuLmEzYmUyOTYzNzRmZiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVk
L2V2ZW50Lm1sDQo+ICsrKyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9ldmVudC5tbA0KPiBAQCAt
MTcsMTIgKzE3LDE1IEBADQo+ICgqKioqKioqKioqKioqKioqIGhpZ2ggbGV2ZWwgYmluZGluZyAq
KioqKioqKioqKioqKioqKQ0KPiB0eXBlIHQgPSB7DQo+IGhhbmRsZTogWGVuZXZlbnRjaG4uaGFu
ZGxlOw0KPiAtIG11dGFibGUgdmlycV9wb3J0OiBYZW5ldmVudGNobi50IG9wdGlvbjsNCj4gKyBk
b21leGM6IFhlbmV2ZW50Y2huLnQ7DQo+IH0NCj4gDQo+IC1sZXQgaW5pdCAoKSA9IHsgaGFuZGxl
ID0gWGVuZXZlbnRjaG4uaW5pdCAoKTsgdmlycV9wb3J0ID0gTm9uZTsgfQ0KPiArbGV0IGluaXQg
KCkgPQ0KPiArIGxldCBoYW5kbGUgPSBYZW5ldmVudGNobi5pbml0ICgpIGluDQo+ICsgbGV0IGRv
bWV4YyA9IFhlbmV2ZW50Y2huLmJpbmRfZG9tX2V4Y192aXJxIGhhbmRsZSBpbg0KPiArIHsgaGFu
ZGxlOyBkb21leGMgfQ0KPiArDQo+IGxldCBmZCBldmVudGNobiA9IFhlbmV2ZW50Y2huLmZkIGV2
ZW50Y2huLmhhbmRsZQ0KPiAtbGV0IGJpbmRfZG9tX2V4Y192aXJxIGV2ZW50Y2huID0gZXZlbnRj
aG4udmlycV9wb3J0IDwtIFNvbWUgKFhlbmV2ZW50Y2huLmJpbmRfZG9tX2V4Y192aXJxIGV2ZW50
Y2huLmhhbmRsZSkNCj4gbGV0IGJpbmRfaW50ZXJkb21haW4gZXZlbnRjaG4gZG9taWQgcG9ydCA9
IFhlbmV2ZW50Y2huLmJpbmRfaW50ZXJkb21haW4gZXZlbnRjaG4uaGFuZGxlIGRvbWlkIHBvcnQN
Cj4gbGV0IHVuYmluZCBldmVudGNobiBwb3J0ID0gWGVuZXZlbnRjaG4udW5iaW5kIGV2ZW50Y2hu
LmhhbmRsZSBwb3J0DQo+IGxldCBub3RpZnkgZXZlbnRjaG4gcG9ydCA9IFhlbmV2ZW50Y2huLm5v
dGlmeSBldmVudGNobi5oYW5kbGUgcG9ydA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVu
c3RvcmVkL3hlbnN0b3JlZC5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC94ZW5zdG9yZWQubWwN
Cj4gaW5kZXggYzVkYzdhMjhkMDgyLi41NTA3MWI0OWVjY2IgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L29jYW1sL3hlbnN0b3JlZC94ZW5zdG9yZWQubWwNCj4gKysrIGIvdG9vbHMvb2NhbWwveGVuc3Rv
cmVkL3hlbnN0b3JlZC5tbA0KPiBAQCAtMzk3LDcgKzM5Nyw2IEBAIGxldCBfID0NCj4gaWYgY2Yu
cmVzdGFydCAmJiBTeXMuZmlsZV9leGlzdHMgRGlzay54c19kYWVtb25fZGF0YWJhc2UgdGhlbiAo
DQo+IGxldCByd3JvID0gREIuZnJvbV9maWxlIHN0b3JlIGRvbWFpbnMgY29ucyBEaXNrLnhzX2Rh
ZW1vbl9kYXRhYmFzZSBpbg0KPiBpbmZvICJMaXZlIHJlbG9hZDogZGF0YWJhc2UgbG9hZGVkIjsN
Cj4gLSBFdmVudC5iaW5kX2RvbV9leGNfdmlycSBldmVudGNobjsNCj4gUHJvY2Vzcy5MaXZlVXBk
YXRlLmNvbXBsZXRlZCAoKTsNCj4gcndybw0KPiApIGVsc2UgKA0KPiBAQCAtNDEzLDcgKzQxMiw2
IEBAIGxldCBfID0NCj4gDQo+IGlmIGNmLmRvbWFpbl9pbml0IHRoZW4gKA0KPiBDb25uZWN0aW9u
cy5hZGRfZG9tYWluIGNvbnMgKERvbWFpbnMuY3JlYXRlMCBkb21haW5zKTsNCj4gLSBFdmVudC5i
aW5kX2RvbV9leGNfdmlycSBldmVudGNobg0KPiApOw0KPiByd19zb2NrDQo+ICkgaW4NCj4gQEAg
LTQ1MSw3ICs0NDksNyBAQCBsZXQgXyA9DQo+IGxldCBwb3J0ID0gRXZlbnQucGVuZGluZyBldmVu
dGNobiBpbg0KPiBkZWJ1ZyAicGVuZGluZyBwb3J0ICVkIiAoWGVuZXZlbnRjaG4udG9faW50IHBv
cnQpOw0KPiBmaW5hbGx5IChmdW4gKCkgLT4NCj4gLSBpZiBTb21lIHBvcnQgPSBldmVudGNobi5F
dmVudC52aXJxX3BvcnQgdGhlbiAoDQo+ICsgaWYgcG9ydCA9IGV2ZW50Y2huLkV2ZW50LmRvbWV4
YyB0aGVuICgNCj4gbGV0IChub3RpZnksIGRlYWRkb20pID0gRG9tYWlucy5jbGVhbnVwIGRvbWFp
bnMgaW4NCj4gTGlzdC5pdGVyIChTdG9yZS5yZXNldF9wZXJtaXNzaW9ucyBzdG9yZSkgZGVhZGRv
bTsNCj4gTGlzdC5pdGVyIChDb25uZWN0aW9ucy5kZWxfZG9tYWluIGNvbnMpIGRlYWRkb207DQo+
IC0tIA0KPiAyLjExLjANCj4gDQoNCg==

