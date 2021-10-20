Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7B4346E3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 10:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213688.371982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6xM-0002Uf-BZ; Wed, 20 Oct 2021 08:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213688.371982; Wed, 20 Oct 2021 08:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6xM-0002Rl-6r; Wed, 20 Oct 2021 08:28:16 +0000
Received: by outflank-mailman (input) for mailman id 213688;
 Wed, 20 Oct 2021 08:28:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md6xK-0002Rf-Ei
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 08:28:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6569a5ea-434c-4bb9-aa94-05d01a28d1c9;
 Wed, 20 Oct 2021 08:28:12 +0000 (UTC)
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
X-Inumbo-ID: 6569a5ea-434c-4bb9-aa94-05d01a28d1c9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634718492;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=JrpICEE5d2ljyILpLqHyrbEj84NwWU1LV74QP/CuE48=;
  b=CSvDbez+NroB28yf9fpJmeRxAV6V0lbU86GIYcYuJHNygE6WUpWNs5Pg
   KJYeHq/JtTZUBKyG9vQi0VKqNa35uoYck4Iza9+/zWdJVNL8ahvZcTtLC
   VXFEPl62FgeaiU07vj5jfmGwpPcEUNzKi0MUsKL/+2mNuncRfRNLzS9PJ
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ypC2+/2a45jlLPG2ff8XNMbyu90nM4lSFsgw2KVyaaFmaE+narBh+MMsQnpre4RziGKr9fMwa5
 NyaHeVp/iVSnLR9A4v+rXv8yZ3srnA1etdNDGFb8rNtDCd29wf+KalCkgdXDhKX2dqf+Wk/GLr
 0WUSG8CKuI94h4uL/qulwROKySggK5ltw5lGZ68klNyTIomjTa7Ni4Akr27/9IubvQyGNP7TNL
 cZY/E335CZUnupvJepVVtzbhDqDwP1qCyy82gbYIItuj5D/CYFXIIYTb7u1KCL/kCAwbtvG+5g
 9mTtaYQ+9vJIiXEbIzaN4nV/
X-SBRS: 5.1
X-MesageID: 55171897
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W/n2gK6aqE6y1tpvGamZmAxRtD3BchMFZxGqfqrLsTDasY5as4F+v
 mEWXWuHPvqLNGGhf4t1PYm2/RtU6p7czYBrHlBtrCpmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2NYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 oVMv7+wdjUTYKiSp8AwYQR/AnpFFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWpp2ZkeTKm2i
 8wxUGpjaDHCRhR1YVooCYAFlfeVvH7hSmgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt8G+oh+LJtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684mamUs9bA
 1wZ/Gwpt6da3FOvZsnwWVu/unHslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC3
 FKTg8ngAzAptbSPUG+c7Z+dtzb0Mi8QRUcDei0sXQYD+8Pkoow4klTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1XfDjjG3r57FVDkc4AnNQ3ml5QN0Yo2iT4Gw4F2d5vFFRLt1VXHY4
 iJCwZLHqrlTU9fdz0RhXdnhApnzt/ePEz3js2QxGsce0xmf5lmyJrt5tWQWyFhSDu4IfjrgY
 Un2sAxX5YNOMHbCUZKbc75dGOxxkvC+TYWNuuT8K4MUOMAoJVDvEDRGPBbIhwjQfF4QfbbT0
 HtxWf2nCmoGEuxZxT6ySvZ1PVQDl31mmz27qXwWyX2aPVuiiJy9Feht3LimNLlRAEa4TOP9q
 Yo32yyikE03bQEGSnOLmbP/1HhTRZTBObj4qtZMasmIKRd8FWcqBpf5mO16J9I7zvwPyr+Rp
 xlRv3O0LnKl2RUrzi3RMhhehE7HB84j/RrXwwR9VbpX55TTSdn2t/pOH3fGVbIm6PZi3ZZJo
 wotIK297gB0Ym2foVw1NMClxKQ7LUjDrV/ebkKNPWlkF7Y9FlOhxzMRVla2nMX4JnHs7pVWT
 nzJ/l6zfKfvsCw4UpaNNqzylw/r1ZXf8corN3b1zhBoUByE2KBhKjDrj+9xJMcJKB7ZwSCd2
 RrQChAdzdQhaadumDUQrazb/YqvDcVkGU9WQzvS4bqsbHGI9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHQdJdgooZ+iOz98OnTzW4ahnKUn2/nYvrrGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0NrjaCNH0NVakjp6o2Oo6zh1p50ExGbLzdFjTyvMOFZeJTPxR4O
 TSTnqfD2ehRnxKQb3opGHHR9uNBnpBS6gtSxVoPKlnVyNrIgvg7gE9Y/TgtF1kHyxxG16R4O
 3RxNl0zLqKLpm86iM9GVmGqOgdAGBzGpRChlwpXzDXUHxuyS2jADGwhIuLcrkkW/lVVciVf4
 LzFmn3uViznfZ2p0yY/MaK/RycPkTClGtX+pf2a
IronPort-HdrOrdr: A9a23:TN0WI6MWZVJpuMBcTyX155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrVQseVvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4F6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1ojegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKve/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdZ11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtRqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW3HAbgcYa
 lT5fznlbVrmQvwVQGagoAv+q3hYp0LJGbGfqBY0fbllgS/nxhCvjwlLYIk7zM9HakGOup5Dt
 L/Q9BVfYF1P78rhJ1GdZU8qOuMeyXwqEH3QSqvyWqOLtBzB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55171897"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUyNvvloIUoicSEX9BiP4YZ4zdYXdIB7qAfVCZa1D/9n4SjxgaHAYCsNQ3hMfpHK/8brgUipgj9nVRlKvHEas6wzh+pTvcBgHaVTeNOXnPZvogzL7hC7QBfWiPuzCRcOxqnr6MA7bZoPVjgxEIG2nXZ6WI4cQ6HoOSW61NieT8GBsyM/rJ3OStYon07wlAlJOY5kFkO6HKEIujgmRUa0TfvzD4CCfKr7qrRLa7CvDhPqrCp4/aOLQM10iNrgacL+3vsy2wWJSe1IEh51ks0FZ7zXCL4tJt9a4eXAo4LvyzLr6NtBlip5BB+x5KDiGp907VOc/xgFL3ZSh3BMz4e2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+TZg8WPP3akyTjvrlc+L0xyb2PkOCAI6o34wc2X8T8=;
 b=JkRDP7KZVBwDYUQG3UWKumQjJQWuHef0QkKb+Z7wgiSwQYGUbnTrjqJAtxffEiNFHQ2KwTSxNF8mggNAfqLITzDgarWiPNxSJLUCe0wsIm6WKc/ZAyo7AmPOTfhYv2PpJhOFpdqGW9IdTIuPDkEc1X5jyzXtFMP8q0JwHyKmAUn4nNz75snOi+Sf/fLDrVO1P1R+c/LNU3AtadvDpE+RYPBCYe9K7FGdcbp4n3W/oSAffdlc+pMw2Q0F9NiUetH/WACrRQlVWM9A9u08jBT70/zN4M72vs+mdVUbOuTViM+15KZnP5W8mbK/tQ/q18Ak1dGbqkyEh0WJ1wjedPfGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+TZg8WPP3akyTjvrlc+L0xyb2PkOCAI6o34wc2X8T8=;
 b=E2PNjbc4sgnvZT8KMTnp3wqCZEsGP+1hzxahGzAMxjPUZ6X1b3mSbYXoJjus0esamZge0z76Avh2kr2LolL7PTcfdf/X4u8uNSEkFl5RpZkVobJEQ5vN59GWSVxJBk2ka2KgPmQMxSPDhmrs/uGiz7fcv2zkib6ElQiWvVwt0jA=
Date: Wed, 20 Oct 2021 10:27:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Message-ID: <YW/TBnjCuRjm64nB@MacBook-Air-de-Roger.local>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fe5cd61-0f8e-4bba-e332-08d993a38443
X-MS-TrafficTypeDiagnostic: DM5PR03MB2844:
X-Microsoft-Antispam-PRVS: <DM5PR03MB28442AFFB1615181FC1594B18FBE9@DM5PR03MB2844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfmVzRbdHT+LmwbcJ+WAuaGB11KoUn3mYLQytZovykZ1ae3f7SmEADzrlvT0Z0NDzVKORT3KEd199B0lLHGXY6iA4zldLE7GzlV3MUtXtBzeVBNpk5mMtxYFtOCOJpYl+mG8BSIBfrFCuRtwNOaJ30ALdZ19IUpwZxOca9FCY0ZemNycJRNOGjWbbJvgfdaMLGWxK7FNwVpUnz6CDN6E4sJrD2l5/LGWeVWPtaNK3Or1eris9eCj6fJSuU/R6NiYF70htZ9h/iRNCbn6LTPTqsMjwrCOWEkWca0Sds+8hoNrkH/shhpCA64GiOpLAyP+EVfSaim3f9cQGnbGgJuo9rMPEsSqRSR9fVTYvlLml9w4J8SmdkWuofMMwWKijINiEmZBX1Lcr/2NK576PytCT46UHI7o1H2qjBu0b56cPYLAigrHN6UoRu27Ko01vDcba9YSUEmAXvrZCRkSouwdOmt2I2IJgtiMQ7LaK8rp3FtMVBV7J8ald6wMmL1KIHO/M2ZRNloyZ9GvHVStjkdjtLJyLJxlv3FAzJkIJi4wN9eQpfRx8MqcS44nDMpvwGI+05sO50+GT9KybGjvhJWhkn7bJmdYZIUvWbMyf0bohHi6i/ebAaNSb7/ugXPzpQeJU/hLkkGBnm/5CSw3INhK9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(4326008)(8936002)(6666004)(6486002)(2906002)(508600001)(316002)(5660300002)(9686003)(86362001)(8676002)(83380400001)(26005)(6916009)(66946007)(66556008)(66476007)(186003)(6496006)(85182001)(38100700002)(54906003)(7416002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2hkMGI2Y09pVlpBeGpjUW1mRUFjWi92UCtWa2pjOHpSeDQzbkp6WUdzOGw4?=
 =?utf-8?B?Y2RBcS9JVHNGNHE4SzJqb1ROb2RFcGtSaHZ5KzdYUnBJS3p2T0dsUkt1Q3U4?=
 =?utf-8?B?K1p0S1Jodld2c0d0UnVLS3hpRjFDZE1FdGlJei9ETGdDTkZUaldzM3A3TDli?=
 =?utf-8?B?UWViWTI1WmF0NGVtUnJycjB6MDZQME1Ja3NneDVweTlpdmhhZlZ6OHVqc2VN?=
 =?utf-8?B?UXkySitpMVpKa1YxVlZjeFQrK1ZadUxQZ2FjV0xkOURMekhMRUg0cUdXSDFp?=
 =?utf-8?B?NFYvU1B5Q2VDUzdNUWlaN0ZZcVZxdG5zbi9QcFY1WjVjelZjOE5CUGNzQTJP?=
 =?utf-8?B?RnpaTm9xY1U5Wjh4SU5adkhnbDQ3STBLN2V1VFJmWGdvSXc4c1I3N0oreVlQ?=
 =?utf-8?B?VFpHbUorSlBzMnQwK0VyakFBMFpDNit0cmdwV1B4WWk2V2dDZTdsUW04ODRn?=
 =?utf-8?B?L1ZabStPZkcrV09RK2dYQXpnc2w0dEVFaGcxZ2ViTzdtSDNxY3pLNHErWnEv?=
 =?utf-8?B?cnNhT1JzWmlxemJKVzZLZkg5Y2JJTHZwT2VGZEVTcmFSQVhSSTdDNVNNUFNm?=
 =?utf-8?B?c2V0SlIwY3JoVUNSVW9HMExlRERQcVNsY0F4RmNnYzJNbUhRWTNrellOSXF0?=
 =?utf-8?B?ejJ0RVNTcVNMek1Jb09jRzFRODhpeDB5d1kwbnZQdWc0Ujl4d255NWk0RDhw?=
 =?utf-8?B?SGNVeDB0OThWQmNPVENrWDlPa3FVR2tLczZSOU1zRHNabWZSQ01PbzJpWE9s?=
 =?utf-8?B?T0I5ak9sbXFvYXE3SjlGeStlL0Jwdi9ydVdmUGxMUmo4VnpCZjdGdFJUNUVs?=
 =?utf-8?B?dU5pZmtKU3Q0SDNlK3Bzbm1JWGVhclM4aEYxdnVUcGlqdjBKUFNNYkJ6Q0N2?=
 =?utf-8?B?NVpwY21rYTYwaDVKZGZzMHZHRjluSFFSZkJmaTRIWkVaK3hVblBwVnlJc2l2?=
 =?utf-8?B?SnRpZjZPWG9maFovakYwM2xIU21pazl0dThXekNGNnhQdlNKYlRYSzVNamRX?=
 =?utf-8?B?VjV1VFpwSm5uTnFjVkRxaUU4Qkc0dmFpMzhiTkhKVzJiWThuN1Y5dEhsVDFp?=
 =?utf-8?B?RGhVVlBxVjZMRExLZ2tKeGNoeGJ5MERxei9ZUU12TWRORm1qcjNJa1FYL2Yx?=
 =?utf-8?B?ZEJ1ZURyOHFZUkUxQmNMSERQSnVJNVgzbklYUzRJSTRUSm1DcTNqVE1hMnJ2?=
 =?utf-8?B?bE5WSm5xOE5Gc2lBOFdJQ0FvbzhRaWtKc1RER0dZZnQ1NDQ1aEdCS3ZHcEZm?=
 =?utf-8?B?RUlPa0ZXZGRwUVVvUStlckgvd2gxUnZ0RDBoTkUzRWZOWXk3bk1GVFpCYzZx?=
 =?utf-8?B?dWhXdmJvV01GSjJaeVdPYVN3K2hzVG9wUjk3U25xNUpxd1I3TEJRMDVxL2p6?=
 =?utf-8?B?NnVsWmpRVWFNKzFWa3Y1MUhvUnRGcGdYQnBkTDJpU3hTUGZhRk04SEhZMVIz?=
 =?utf-8?B?amtqQzlEbjNyRFVlbnBUT3FDN0JoeEc1ZVhhSlJRMElrRjFLb3JTWVdIM3F0?=
 =?utf-8?B?UXNNbE5wMHFBVlZjN1R5K3doL2JOS1Fyb242SVhxcVJ4M2lBaHRoYjcxN1Ew?=
 =?utf-8?B?Z1F0V3pGTXlzRGxJU3BWdjNycnBuVGFhN0ppOWMydXMwYUhjT2ViOWY2N0Jn?=
 =?utf-8?B?cFQ1RTV6c0ZDRzl5ang5WEFSSzE0amI4VDU0aXY4Vm9qVURVQ3VXTjd6QlRy?=
 =?utf-8?B?dzRNQkZrd21wWCtHVnFyVjZKcFVpclRudVJkTkQ4a2RZZTVzZkhFNzd2QjNI?=
 =?utf-8?B?ckZKZ2ZqY2hraUx4eWNWZkhkV3pxVitKU09qMG93bGJzM29KTGRMZ3RPZnRD?=
 =?utf-8?B?YjhzeFNsSXZ6Y2VWQkdOMjlEVDdjU2ZrVGw2SFkvYWJnUjc2bXdPbUVaNDho?=
 =?utf-8?B?ajFLdVFiNUdFZ2RlLy95OGRwTGpOV1JZZXVJNWFCblI0aFBTb3lrZUcxZnNu?=
 =?utf-8?Q?lOzZepUZnEWew2IlyIE41sCpR8rt4219?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe5cd61-0f8e-4bba-e332-08d993a38443
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:27:55.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2844
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 05:08:28PM +0100, Bertrand Marquis wrote:
> Xen might not be able to discover at boot time all devices or some devices
> might appear after specific actions from dom0.
> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> PCI devices to Xen.
> As those devices where not known from Xen before, the vpci handlers must
> be properly installed during pci_device_add for x86 PVH Dom0, in the
> same way as what is done currently on arm (where Xen does not detect PCI
> devices but relies on Dom0 to declare them all the time).
> 
> So this patch is removing the ifdef protecting the call to
> vpci_add_handlers and the comment which was arm specific.
> 
> vpci_add_handlers is called on during pci_device_add which can be called
> at runtime through hypercall physdev_op.
> Remove __hwdom_init as the call is not limited anymore to hardware
> domain init and fix linker script to only keep vpci_array in rodata
> section.
> 
> Add missing vpci handlers cleanup during pci_device_remove and in case
> of error with iommu during pci_device_add.
> 
> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> defined.
> 
> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> for ARM")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2
> - add comment suggested by Jan on top of vpci_add_handlers call
> - merge the 3 patches of the serie in one patch and renamed it
> - fix x86 and arm linker script to only keep vpci_array in rodata and
> only when CONFIG_VPCI is set.
> ---
>  xen/arch/arm/xen.lds.S        | 9 +--------
>  xen/arch/x86/xen.lds.S        | 9 +--------
>  xen/drivers/passthrough/pci.c | 8 ++++----
>  xen/drivers/vpci/vpci.c       | 2 +-
>  xen/include/xen/vpci.h        | 2 ++
>  5 files changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index b773f91f1c..08016948ab 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -60,7 +60,7 @@ SECTIONS
>         *(.proc.info)
>         __proc_info_end = .;
>  
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>         . = ALIGN(POINTER_ALIGN);
>         __start_vpci_array = .;
>         *(SORT(.data.vpci.*))
> @@ -189,13 +189,6 @@ SECTIONS
>         *(.init_array)
>         *(SORT(.init_array.*))
>         __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>    } :text
>    __init_end_efi = .;
>    . = ALIGN(STACK_SIZE);
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 11b1da2154..87e344d4dd 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -134,7 +134,7 @@ SECTIONS
>         *(.ex_table.pre)
>         __stop___pre_ex_table = .;
>  
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>         . = ALIGN(POINTER_ALIGN);
>         __start_vpci_array = .;
>         *(SORT(.data.vpci.*))
> @@ -247,13 +247,6 @@ SECTIONS
>         *(.init_array)
>         *(SORT(.init_array.*))
>         __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>    } PHDR(text)
>  
>    . = ALIGN(SECTION_ALIGN);
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 35e0190796..8928a1c07d 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -756,10 +756,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> -#ifdef CONFIG_ARM
>          /*
> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> -         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         * For devices not discovered by Xen during boot, add vPCI handlers
> +         * when Dom0 first informs Xen about such devices.
>           */
>          ret = vpci_add_handlers(pdev);
>          if ( ret )

Sorry to be a pain, but I think this placement of the call to
vpci_add_handlers is bogus and should instead be done strictly after
the device has been added to the hardware_domain->pdev_list list.

Otherwise the loop over domain->pdev_list (for_each_pdev) in
modify_bars won't be able to find the device and hit the assert below
it. That can happen in vpci_add_handlers as it will call init_bars
which in turn will call into modify_bars if memory decoding is enabled
for the device.

Regards, Roger.

