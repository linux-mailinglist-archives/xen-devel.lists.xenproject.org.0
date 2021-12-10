Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935E47021D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 14:52:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243896.422001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgJb-0006gW-7y; Fri, 10 Dec 2021 13:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243896.422001; Fri, 10 Dec 2021 13:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgJb-0006eQ-47; Fri, 10 Dec 2021 13:51:59 +0000
Received: by outflank-mailman (input) for mailman id 243896;
 Fri, 10 Dec 2021 13:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvgJY-0006eA-Uh
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 13:51:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 546fb092-59c0-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 14:51:54 +0100 (CET)
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
X-Inumbo-ID: 546fb092-59c0-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639144314;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yI7K06ovLU8YroQeSrEStiLOY41V0BF+kUSjdvB7HuI=;
  b=YUnNqXCsXULQLHghw2AR6D53yQXQK50u16VoTEhtOn5YVlQcoib0W5iQ
   X0c5sS9tzycQNFesbLpeGBPqlQFOTf3fkutUM46UHn1/ZX6jmt3p1LZWu
   eYbSqs5JpUQuFkey06Frp7YchEtDZkBGzNaVSS1EZzhkUsU+GVOfqy3Qq
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EiiN3/yZYCkNpnUb9YP2yIhPkSfB7LZqdHBO7nhG2YZcU+XF84ryPkivltC50a855ZPggLAHgh
 WdGdNR5FvuAMxsFz1AnzSGqg0X1vTNOmXcfWWwOWDcasxL7Q3dttCFB26DeyjDc75Jrc/TFluN
 PGzZXNU+2vRWZtvptDsvH8oqZrqgS8jesRAd+nyDWVKVUvchpc/INpOFl6Mx1mW54BP92LThtm
 nn132mruXOEqt80n/vrY59SvodH3eKvHP6nWojpLdsZekSgPq0yfd6ktOe2rlBBY4cOO5XtJGk
 FkLSFgBI7y/gbp/KJUihZ542
X-SBRS: 5.1
X-MesageID: 59682315
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Y8Ou8Kix6C8iufOgCjduOxolX161ghcKZh0ujC45NGQN5FlHY01je
 htvD2uBOqyLZDTwLoxzYIW2/E9UsMfRy9BgT1No+C81RSkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qx2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1d76OoWVYAIpeQ290Tb0VGLipBI6pZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t154eR62HO
 qL1bxIoQz3jSDdpZWs6S746rtq5iGfnLy9X/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru4GDREhwcctuFxlKt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT881ymHnhVZyJ7NJ8fuvNqWwEh6
 UGOgIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHVm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7FHjFtX
 1BewqByCdzi67nXzERhp81XQ9mUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hSC4VwMuMELbSfyBUOSX25XI55ypUQHPY66Ps04k/IUOsQhHON51H8GibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OS7EIZ9YYQDmRr1os8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSRhWM2t9ZUILrXrz8gPMDhJNsI9CIgJIuRNt69Uiv3J7
 je6XEpZw0D4nnrJNUOBbXULVV8ldcoXQasTMXN+MFC29WIkZIrzvq4Te4FuJess9fB5zO4yR
 P4AIp3SDvNKQzXB2jIccZii89AyKEX13VqDb3i/fTwyX598XAiVqNXqSRTiqXsVBS2tuMpg/
 7D5jlHHQYAOThhJBdrNbK791Eu4uHUQwbogX0bBLtRJVl/r9Yxmd374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjCCv7isNCTc8m6y+qN6Ub6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SL0JUdtqBJwbMF6wK6V
 ljWp4tfMLSNfsjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 bZzscEb3AWzlx42P4vUlStT7WmNciQNXqhPWkv222M3Zt7HEm1/XKE=
IronPort-HdrOrdr: A9a23:jQdVpaPl8/j+TsBcTyX155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrVQseVvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4F6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1ojegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKve/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdZ11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtRqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW3HAbgcYa
 lT5fznlbVrmQvwVQGagoAv+q3hYp0LJGbGfqBY0fbllgS/nxhCvjwlLYIk7zM9HakGOup5Dt
 L/Q9BVfYF1P78rhJ1GdZU8qOuMeyXwqEH3QSqvyWqOLtBzB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="59682315"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiUqKv63CdQneT4EWs4cBIRSDZrU7K/VlAPeuBbN5TJOCUDQjzUX39pShZqX8c20V18Pp0qY3AN5t4MxUn9tdxfxlOftxH7Q3sz0KgeuPRgzz18JUBwjCFEocMmQoccPP1xr5gopuIXOWKGsD4oCXa8p0Arz80I3l/4YadiV0m57vz+JPUyr5MTegq20K8YEibpkpfgAHljDGvbsIWFLRhV2LQkqDkoSMAqrNdQE+x6lQTwlAlTaZ/+OzGwNAsMtp3nwrYyfzoog1ennOIch+IeDuS49xqBPNkcIrTQQ+URyD0sS/dNj9f9Os4zk/kO9tdUYyVxG78kwAbGZGb8MdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6OTVpimcPuYbvwbTgXb89vt8uWITNd/FZzxmO3+HuM=;
 b=mIPbAmJUEi1h2Q02d9xeRJ4d3VAK3BXpaGmwi8q1NdUfV86cL/NcaGEN+Sermy45j/d/qKe9MAjO1tT4tVxCkVAGCCrLQ62AnGiVcSQ+3ikdhvV+6QUC9XOOb7RX0diG7t0KkErfK96+zRvSba/4crV9xX89x4TowVrWz+oNAK6nKi+B6NK+qOtEYdlmGB0oItYqRE/8PrHpUJwFCrEm4JFe2pkJ44N9tkIOaD7vydafKIVNYT/NtW94MTrVhtVCLA7Vj3JIMlMTspmXhW2kyMyBBcNMsU8pCQ2F18wwFbLMfSxWt8kqj52XcdL/C/6U+cofUcbXewoLmzVNfZwOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6OTVpimcPuYbvwbTgXb89vt8uWITNd/FZzxmO3+HuM=;
 b=DEeKJvTfWgX643/b9WcVKHZaR1oF1ypuEyXt/66qAhSv2XiS9RfZgGUNYk/Dcqc4fnJ9F2TL82OkxiI30YfgFHv3StSqfQg8t9zDyneqS/qD2/TwFr45DFzovTTw7so5hM5yHoiPxWOCUx43P2fQUYyMotBrpTCuhxil1/JUF30=
Date: Fri, 10 Dec 2021 14:51:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
Message-ID: <YbNbafZMMbRJxlzs@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f58b5369-3e2d-4956-ae8f-08d9bbe432bf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4684:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4684E70A2C744F5FD006ACD58F719@DM6PR03MB4684.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPjGsndIPTJMnIUwhhtvMDSnFIYLxKCXp1z3Aw+VhNmxpx7qogV7ihcOVq+QSORLGxhqSu3or68y6/nfURok2LN4HcaJINLK2T49sxNTyCQIF1vZgVr06eBdgskmcQ13kvlmOnT5EhHKWlFQHt4MiqZcOt02CMEAHF4WlEWyCpe6h+d101WoqFwwaqUcQdtoGBnq3Ui5NdAYTwshpNZxge3fN2qvfXPSqMmv37cVxzIQgZ4J1PwA0O6wwOoWSBDnRohSQ1WEb4wm4T9QY8XalIhoGs3zTH5Bzu/Ayc6Jid39YKiOw97lP1yBJC79qwzoJAxWzyRc0FPadf5KMXEn8WWVvLYhNMf5V9Kt7ECICVOOHAeYR02YamyMfykOpMAyYMifqvPL1jj9gWI6jASovjaVPw1ae2hoDTMuPpYQvB6qNx1vOTWpIQSj8qZGjPjncECfpFdhvPLezix9ZtMRK6Aq8HlxHRQeKq5UufyMMvkJ8KXy33eCt+7nDKPzd2JaH45ZmpG5QksXOVZsJkXNGdxFY5TURujMhELx9CzGnNz7PHqWphFQhgVD6TvQFQMlm5UMpxwg0v4sd6mU/satHql/AAmv/+r7EzeHPC3nIzR1dr+znOugm/AjUy97ZaUYAqojqxURgfYGzZA/qKAD0l/5DrWhI9kGLXS9mMvBCTGYmtMtsYeGcjXSy3VopfvMxc0wGaY7cDOTTE+z2bGFDoT4OEvlokBtajMKYQMlOR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(2906002)(66476007)(66556008)(6916009)(6496006)(33716001)(6486002)(54906003)(4326008)(85182001)(956004)(316002)(66946007)(9686003)(6666004)(8936002)(508600001)(186003)(26005)(5660300002)(8676002)(38100700002)(83380400001)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk1kSHNpN0EvTjdjV0Jwd0RFdlhCTmNjSXpKLzJuT3ZTVFZTVENnSnU4emhE?=
 =?utf-8?B?QW1sNVNQNk9IVzhOMVkxRUNWL0ord0VCM1E1VUk2aFlnYW1zTU91bHcwNno3?=
 =?utf-8?B?UGlGcmhMb3draWhEZFVKZXJxclF1a2llTC95N0VZTFppNmhsdHczMmw0NG4y?=
 =?utf-8?B?Uldobmw5L1B6enRjOWNWZHJXV3gxemVKYStSYkxuRk5ndk9HZUhKNXIwTlpv?=
 =?utf-8?B?KytvR1d2SzdhdDZNem1iaVBjWlFDRUhzREtqNzRHb1J3aVljZm9PbHZoZ2hq?=
 =?utf-8?B?RkxLYXhISzVsRkdoUXc4cnU5bHh0WFNnZmJ6UXRQRzhUL1pHT1F0VkVYenZJ?=
 =?utf-8?B?bUNBdkJielhMbkl2VXN4dDdSdU9XR09jcnpsSmtDUnJHUDJhb0FwR2t6aVBC?=
 =?utf-8?B?SW5oUVpJeUZCRjl2eDQrb2NnV2UxUFZNWFVEL2lyVkxPeEtsVzNLa2JES2x5?=
 =?utf-8?B?bkJxR3hEMUNzaWMzMmwzMnpVV1lHaURFZmhaRHJGRnJ2Rld0d2pxRmFBOE5D?=
 =?utf-8?B?MVFoZmhjN3g1TVRzWmpzZjBodjU3bHNDRHJPRk9sL0dRMFF2TTk4MVdRSWpy?=
 =?utf-8?B?MWU5VDFiZG56Q2dJb3g1YTdjVEw1NDJPOXhiU05JWTdjeDVlYTJrUkRqYTA2?=
 =?utf-8?B?RHR2cStaNnhMYloybjhlcEExRXN5eFd3OE03MUpBeGNPbHpXZW5jWjVGeE94?=
 =?utf-8?B?eWcrdEpBeDNndVVGYnQyWFZvU1N6ZGNZYkdxM3BPeklLdWpaYjhVK0w1MWt5?=
 =?utf-8?B?aWM3OG1lMWV0OUtXUXI4bkZQU3RxY1VGOElNbXIzVkpqdXAxYnlTcWg4WExn?=
 =?utf-8?B?cTJpVzRkdGtnZFprazV1K1hFRTB6cmV4THNDa05pRkl5MkwyZ1pYTG9Jd0FC?=
 =?utf-8?B?alJlWk4wOVhvZ2srdzAyYWdldFBXU2syaFkxeXNqNFhqR3BKM0tmYVh2T1JC?=
 =?utf-8?B?amw3V3BDSGRhVk05TStMd0o5MHBFbmJIbm41SnRSNzBzS2t4Y2FvM2JVZTV6?=
 =?utf-8?B?M2x6Y2srUGJudHFneFRGUTB3UW9SUHNRZDM3L3dSUUg5TFJ1cUxWdUM1R05T?=
 =?utf-8?B?TTY0ZElwaUdCK0JNRGhTZTlSZFNnWmFDOFNJdllNOTBwbklmZGNmK3I1K0NB?=
 =?utf-8?B?T0l3bmVubWVRN2hqcDJXQ2pSWkNqWXVDQkwxUGtpMHpuWTVwTkxGbWZpU1V5?=
 =?utf-8?B?Z1RoYkVyYUo3QUVudEZzQTVsckJxcG1za3AxczR4WWVrVEg3MENYSHcyWGZz?=
 =?utf-8?B?U25USWx5SThUWWpFODh1K3BsVU9VUENMTEtUTE1IbjcveVFsb0lpSmMrdmti?=
 =?utf-8?B?YXRHZGZUWjBLUzFHOUlWNHlQRlF2NURTOUtXL0s5d1o1NmhvK0l4bmlRRlI2?=
 =?utf-8?B?M3RiTDNvb3psT0NDbW1OS010cG9Gb0NrbURmSnJMVGd5b29VOVNwWDI0dkhh?=
 =?utf-8?B?YmVYaWszZFFoTTN2L1BjSFdXdWF0SXRSZ2ttaC92WDdzTXpPVFBFbnFuV1NE?=
 =?utf-8?B?alRlczJjVU5LS2dwbHRYSTVtRW5HcWU0SzJVcEowOEFmSjduTGtGcDl2aEw5?=
 =?utf-8?B?WWVpNWZaM1ErSXlJMC9FWTFvYmpCNzU5aEtuZWVpcnNoVzBqUXFXSEZUK0U2?=
 =?utf-8?B?ZUE4VSswSXEyVDRXMTZ4U05YbDg3Z2lwU1RJbEg2Q28xa2JvWUgzbDhLb2VB?=
 =?utf-8?B?M3JsR3ZHRm1JdVVkWlhGQ21IL2RCc2xiamVCK05UdjJTVHVKOVNudVZBS3Bv?=
 =?utf-8?B?SXJVNFZRdm5pWlpwdEVBWldlejlRdkZsZkQrMG1VOEFsOEdsQVlhbUh6azRv?=
 =?utf-8?B?VEpVZUFKSmFEM2tvWWRrcHZGajJnQS9raHZQYnRKM2FvdnRrQy85dmpRTTVJ?=
 =?utf-8?B?d3pBek5aYStVVXhibGtTbWxiTGFQK3VNdm1FRW53eW40cUZaN3dsMmdqZHBT?=
 =?utf-8?B?ZzNDcVd2eXg5OGtqc0J6Y2FWTFh2R0FFRjFMcGQwT2JsZGR3bFFpODg0Tmtx?=
 =?utf-8?B?SlhaU0RjbUNWL0RyQmRoM01QUm1DblpsbURBUFVlWjRlWklBVnNJdWpKY1Yw?=
 =?utf-8?B?Nm4rbk1NU05DY1YycmVWWG1iL0FBMVFRVGt6b29DUEVqN0lhKzVFTnJOdWdt?=
 =?utf-8?B?bnlZN2t6ODJLWTkrclo4N0YvYVlWWWdSbVRTVUdGMStRbkhpQ3g1UXF5UGxZ?=
 =?utf-8?Q?NGJTn8gB47OxLVqCfi85nos=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f58b5369-3e2d-4956-ae8f-08d9bbe432bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:51:43.2138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yG2gHvzCVk4pR0xyWVWFF80yFtisB+HfaNJwmDMMtNuN1QiX9Ei2lgMrNh38N4WZeAahZNpD2fQLH/xv6/TM0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4684
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:48:21AM +0200, Jan Beulich wrote:
> For vendor specific code to support superpages we need to be able to
> deal with a superpage mapping replacing an intermediate page table (or
> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> needed to free individual page tables while a domain is still alive.
> Since the freeing needs to be deferred until after a suitable IOTLB
> flush was performed, released page tables get queued for processing by a
> tasklet.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was considering whether to use a softirq-taklet instead. This would
> have the benefit of avoiding extra scheduling operations, but come with
> the risk of the freeing happening prematurely because of a
> process_pending_softirqs() somewhere.

The main one that comes to mind would be the debug keys and it's usage
of process_pending_softirqs that could interfere with iommu unmaps, so
I guess if only for that reason it's best to run in idle vcpu context.

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -12,6 +12,7 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/cpu.h>
>  #include <xen/sched.h>
>  #include <xen/iommu.h>
>  #include <xen/paging.h>
> @@ -463,6 +464,85 @@ struct page_info *iommu_alloc_pgtable(st
>      return pg;
>  }
>  
> +/*
> + * Intermediate page tables which get replaced by large pages may only be
> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
> + * that the necessary IOTLB flush will have occurred by the time tasklets get
> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
> + * requiring any locking.)
> + */
> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
> +
> +static void free_queued_pgtables(void *arg)
> +{
> +    struct page_list_head *list = arg;
> +    struct page_info *pg;
> +
> +    while ( (pg = page_list_remove_head(list)) )
> +        free_domheap_page(pg);

Should you add a preempt check here to yield and schedule the tasklet
again, in order to be able to process any pending work?

Maybe just calling process_pending_softirqs would be enough?

Thanks, Roger.

