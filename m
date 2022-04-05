Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2384F251D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 09:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298554.508636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbdpr-0001Ix-Mx; Tue, 05 Apr 2022 07:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298554.508636; Tue, 05 Apr 2022 07:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbdpr-0001H4-JR; Tue, 05 Apr 2022 07:42:43 +0000
Received: by outflank-mailman (input) for mailman id 298554;
 Tue, 05 Apr 2022 07:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbdpp-0001Gx-NA
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 07:42:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5ecaa3e-b4b3-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 09:42:38 +0200 (CEST)
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
X-Inumbo-ID: f5ecaa3e-b4b3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649144557;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kf23B/RcHX29r450+gyrgUunDuuGEt26SOtF9x9V21Q=;
  b=QCG7up+pOR3tdIeQZz2pym8p39HbCFKdY0mdau/+C1yYfcomfl8hIhOr
   fydLhdpRc4t7hm22HvXUaCJ+FPTyyJxHbzfa3ZcLwftrlan12txZadmbd
   sadnWhg3UGnWcq+o1DRf2Ct9uoDh7nnEVj2UhI9NOFVRkTY5qef8tdGyJ
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68017922
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KNnO762cheybMdU1s/bD5QJxkn2cJEfYwER7XKvMYLTBsI5bp2RVy
 2pOCj/Va6uINDT3Lt4jYIzk9x5XsceDmIA1SgNspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIw3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0cmK2IdlwsHpbFxsoSQ0lUSi5uMbd/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u1pgXQqeEP
 aL1bxJTbTfkfg9jOW1JI6omsMGq3l7AKTRx/Qf9Sa0fvDGIkV0ZPKLWGNjcfNCQVNhWtkmdr
 2PCuW/+B3kyONOTxDWf+1qwl+TPmmX9Q4tUG7qmntZxi1qP2iofAQMXTnOgvfCjjke0HdNYQ
 2QY4jErrLQy3EWzQ8PhQgajp3qZoh8bXcEWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby4jOkbkM1Rfvdd89PqGl3tGsFiH82
 Qnf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm80aa7omhezO
 Sc/XD+9ArcJYRNGioctPuqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/1uY
 c3DLZvwVipGYUiC8NZQb71AuVPM7npgrV4/uLihl0j3uVZgTCD9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WlChQ7BbU7dAhQRVBiXMieg5UOKoarf1o3cEl8WqS56e5wJORYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQOi2B8wi8itnY3dE0JTB8yFLXLtDJZw3LvMfVbIm6PZi3bhzS
 fwEcN+HGfNBVnLM/DF1UHU3hNcKmMiD7e5WAxeYXQ==
IronPort-HdrOrdr: A9a23:b94wOql2vUwe7StELRf8+/GLpQjpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68017922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIw9KEERhLj85XtWy+K+3qvURkaiAUGatRnQJm2rcPa/yd3a7tiSYyPxAhsBgnAZWBGu59X5rE1xPo1rgC3mEFEk4b59nR4d57RP32ITcaZz2yX0rjXc7dGjOu0mQeT2ocI02quFXWpvRkyrydATDNDBCXIsMQUaQAaUFWhm33TmhLdl1VREHE9f7aWin6I8j4dwqlMMDErUUGtPt9C5JakOvqbfKXxKPhHgav20Q2Je4GOhKCi9y/UU7nmsCBULNXNvACGPtZosy6eFB0Ie9MMItkI0836HQ3XsAKjY/YJI+byDkeUQBSysF+Vh0PRzns3vBgZG09muNmGTqO4DDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujeaJow8xSy9r7cLaQRDnkOrgWUB0pRTW7ImUZPADDY=;
 b=ej21RTttHcJ2391VJYaI81j2RnnhuKhhJXhRaJMaWNkTh3MB0b12dCKmcR6EWdGQezEW8+FEkEr9tZUicZGFEp+OO1th0VYXMuwgOPN89BWF+AcZ+1Ks5M/XCqqb5WvNCRC8bao2OGTbme91f2Wg4jLhu9bN65+5kHubP2ZmjcnIIlAPw5R8K9mtjyZHnHUAO4TMjpEIa5dFnMTP/JNs6PpcwTTOxMnh1+cgzy9yGcNCPi3qX8NdKWqe/HfiPi3QLXL13Auey6DgWwulKW0xKGfl2y5V/QpaEAY6qS9wdsFgdZN99UOnnZVqpDoeG6cNGUitbQgBN3U6enMjv5yLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujeaJow8xSy9r7cLaQRDnkOrgWUB0pRTW7ImUZPADDY=;
 b=dsR9I0PTHy2J+XYf2ZBivaNZl2lkJowGVyWP19GevWoGY+OPqaiYjCm1Y43Rp9n14eTnEttePisCsm1PDi7PzEVuSSgSGrlTSAsNfwu5OPe1/30jpsYY0lilwa0mmw0R9O2yS/zXOVwbmUzqlB5LJhjcGMV/6zzFdnVEGjPEa9c=
Date: Tue, 5 Apr 2022 09:42:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>,
	<jandryuk@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <Ykvy4lWiwASHGXcF@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
 <YksK9hIbJbOXkIYd@Air-de-Roger>
 <cd178295-4c8b-6710-3050-011fcee378b1@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd178295-4c8b-6710-3050-011fcee378b1@apertussolutions.com>
X-ClientProxiedBy: MR2P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a907c93a-84ed-4ff0-714c-08da16d7d788
X-MS-TrafficTypeDiagnostic: BN7PR03MB3921:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3921296871F0A3ADCD597D098FE49@BN7PR03MB3921.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ss+5CZkKjrm7Gh3+CNlbedmBHMjAkpLFYTtKfW89IrE/0DeEyxwH0U3+Ku+VRbKWyK9+nJbfw3G5XnwJJ6UvmPfuFaTO5hiqCPZBUEl8ykIT6oCTVZNl84e7Nd6+Cwb6x8iYr4qroQO9azGYLu4qKLBHQFBhf+mXiZU90r8useVbQW0HQSh69UZ/FBSCB5gAR1/IQNGBF0ItXFXKUf3gouacoQKu5fwHgz3HbU2GFkUsbhSbEHy4oxWL/Z/I3B3fx5EOgy77fKQywCUqfoy/fKDobR06za/OPY8Rk0zthmdVC2mmBiuJiJ6urAsyUG7923cvl0TRYkZCJACoEGfnSxeiANaDhNo3Nx3I6CaQUS572w/CG+ra6Fh50/eH78yrlOMwWvWJ3LLqUWWs+T94GJazJ7fn7eAbmp+cR4K5CvNtumAhqqUOv3t2s8c+xbi2wNgYHVt6EgPHboWgKJHMQENESpzJCsh1JsRt7V1i5p3A91rTt2zncJbL2crXYKgOhjaugVN5Kp/lzT4a/AGCvPgTcOW3YtglSNQST8SNOADogn0B76wVNlY3OlTKuNJZzuC4tUIeewwBLBbaA1uYunqaYcFovVdZwEELu6CtZhUfWDlWDo7VHzpfkIW591qFpw6X+UMgveFijVzQh1KQWOWcUunWzAz32BVLNuLA+RgQyo9FRPIwMue8DOZMomgu6WX7jCggJ1kn0j0ppDIxyz4FSrHthSG9UfJQGjZchlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(66946007)(6666004)(6506007)(53546011)(6512007)(107886003)(66556008)(66476007)(86362001)(4326008)(8676002)(8936002)(9686003)(26005)(54906003)(82960400001)(38100700002)(5660300002)(2906002)(186003)(85182001)(966005)(6486002)(33716001)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1JaUmtKdzJjblhpOXlONVBXSjZ4NTZXNXpHbTRlQWVFQXp5ZzlCdWtwaldP?=
 =?utf-8?B?N21jNERtRUdVYnJmd3REZlN6TVpON3NMSTZTWHZDU1k1emplRHUxdStzdmxW?=
 =?utf-8?B?cWsyUVhNb25yaUJGTE5mYmpRTVdaUFJ0bTNNTTd6ZCs3bG52RGZQS0hTRUE2?=
 =?utf-8?B?MXVqQkRoVVFQREQ2Tis5aVZoV2VPR3MvNjZGK1NWd3p0RGlKMWJ1eHFYR3Ex?=
 =?utf-8?B?eWhLdUVtcXNQT0NraEtMYzZiZVc0VTV6Vm1jVHJ5WWpnbW9naTE4ZlZXU01l?=
 =?utf-8?B?QTB4bVBrSy9sc1B4bysvQzRMRWZZbEJrUWY2SzQxMVY5c3RLMDIrVzN6K0wy?=
 =?utf-8?B?eHE0eVk3WXZHbkNyTkpNUkZpMHJEUkk2RFdpUUVVSGZ3TVc3bEo5TDZ5VGp6?=
 =?utf-8?B?ekMyKzI5U2ZUdFJLbXZqZ1lsdVFmeUtsRUdXNEUvV3k2QTJUMWVDNkpER0x1?=
 =?utf-8?B?cW5uVHdwcjRsNTFlOVJsVENQZWY4VTBjTStCOUM3Y1AwbTNTWTVlZDFLYmdB?=
 =?utf-8?B?Rjd6MWpyQmtRMXRNTGlrb3gxVTdPOUtuMW1uTy9qaGlIRWwzRktYK2hmbTFa?=
 =?utf-8?B?ZVlub01EVGdYRytEY0UyMG1BL0NWOUtDb1J3S3pnekpQME1ENlp5cTZxVyth?=
 =?utf-8?B?WnE1bmhRL29jellLUHoxbWRpbUJKUjBmMEtuWFYwYjFTYnVwYkNlQW9lYjZW?=
 =?utf-8?B?WUZ6elo0aEZlK2RHS2I1WmRxQjZQd2NOVkZHNkN4eVU1bndqR2VMeVB3N003?=
 =?utf-8?B?eDNIdlkvRGtQU0VaSElRd3ZYVC9pblkwU0w3NFc4RG9WQ2QvUTZWaDhNK084?=
 =?utf-8?B?d004Z0YwVW9kT3pyaUZMTDJSM1NuTXlWcnNzMzIxRjNLNmo1dnV1ajI1WnVs?=
 =?utf-8?B?V09DTklpaENCNlVLWDNMa2tua2JINjcxUmh3OTFGSnRYN2hLemFnakk1QXNh?=
 =?utf-8?B?L3BrYXA5TEVEKzBBRHlCdldqaXY5RmdRN2M0WktBNFRvZ29SKzhoMnVvMTFK?=
 =?utf-8?B?S3hKMWxYS0ZsNXh1SFkvd3BsN29kMmhBcXFaQ0NMVjVKeVpQU3lia3o2NGky?=
 =?utf-8?B?cWVOaDAvNnlWcFZ3TWxpMThqTlZXQnR3NjZibXpMOHh2a3RqekU1cWMycGd6?=
 =?utf-8?B?c2gwUm1CSnZtc2JnUWk5VTdXbTBiTWpZTjFZTjA4azJObFZwbEw3TEhzcVhp?=
 =?utf-8?B?TkMwOEQ2aFpJVzhLM29HZTFuNXdHNTJ6YS9tWGpYWHNyeHFHRVZrOW1Ib2dD?=
 =?utf-8?B?SXYyRFNqSFdtRzBBQXFzaVFuVVZLMEl0aG83RjltZWRaa2RDaVV4UU5hM3Fk?=
 =?utf-8?B?bXMxUWhxL1ZidkJETUx4bWVpU2ROaWh6RHc1bW5jWjNYUzIwTWQyQTVsdmdO?=
 =?utf-8?B?NXlJa0NXSHNXeHNlWUZLbFBaVjcwQnZaVzhNejdqM2xNWXVtTWIvV1FQR2Zq?=
 =?utf-8?B?bVppTkVxN1BPbEQ1cGQ3M21sR0ljZkkzeTE1OGI2ZTZVN3dUUWpycExHY0Rr?=
 =?utf-8?B?L0F3SmRLbkMrQ24veUpiSGh0VnY4cDVTQ0ZKdm9VQzJrczJmTmNQUUZBQlI0?=
 =?utf-8?B?aEZ1ckJLV25ob0FreTFpYlRzTmlIYmhWQ0cyeWJtT0VFcUdtRzlDRmZ5c09R?=
 =?utf-8?B?RitnNkJGV3k3ZmxtTmczSHRJM29QT2ZlK1NvcTZ1OWYxRm54WEZEbzFGbHNh?=
 =?utf-8?B?N0VVNmZ4WUhQUUU4eHdqa0VpY1FwSnhXeFBKNy9nZ3I3TU1VRkJxN1NpQ1kw?=
 =?utf-8?B?WWRUd1BweTFYSmdPcmNuODNLTWVzQzB3Zm8wT0cvUjh4K21QbUdBcTlPbE84?=
 =?utf-8?B?Y1Rjb2NNWFNSOU1TOEdNWlBBN1BJdG5zNkVxK1lEQW50RUZyUVp6MWJtYnNH?=
 =?utf-8?B?UUpxZTZHOHZiSFdwQTdQQlJ4Yzl5ZEVGU1k2NTFBM3JZUTBSL3luMC9sNkh1?=
 =?utf-8?B?Tk53aXcxRnNLUWpoeVpXUjNzcTZVZjNRemRiVHFFL2tVY1F6a0g5WmpNeEFw?=
 =?utf-8?B?MFF1eThsN0RsVXVUUUo1M3NYRW9TNGlKWjJtZW1RM0JvRXhWM2REcFJSaGFM?=
 =?utf-8?B?Y0kzbHlmbkV4ZWhDS0Jldi9FRGpUM1R4L201enkxSFFwTEY3QjlCRmFSKzda?=
 =?utf-8?B?cXRIa1lZaEUzZDlxK1RhSFVzajRSMStwaVNJamg2bzJvMzhESE5ZcGhoMWN4?=
 =?utf-8?B?Ukg2VkhXMk15L082cUw1WmM2MWo1WUFodG9mRUdZcGh0WFpZcjVUbUZ0U2ZV?=
 =?utf-8?B?YmV5eHRXdFRFdUExUUtoSHNHckF3U1BiYTI2OU5xQXY4b0xIM3YyU3ErNktK?=
 =?utf-8?B?Zy8rY0hXWWFiUjRIZmxLWVlSRVBRSGxHdUxxNXpzTHl3MDFyVDV0K2FleHNs?=
 =?utf-8?Q?mKws5pKpuZSiwWFI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a907c93a-84ed-4ff0-714c-08da16d7d788
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 07:42:31.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Byq/fYMIyRiFuHG4PNcQUDI4Ni6RrLvirhzzx32HefeMl6sMR8840OZndSyk5IeNPCwuCsCqYLR7mu0KBFYfPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3921
X-OriginatorOrg: citrix.com

On Mon, Apr 04, 2022 at 12:08:25PM -0400, Daniel P. Smith wrote:
> On 4/4/22 11:12, Roger Pau Monné wrote:
> > On Mon, Apr 04, 2022 at 10:21:18AM -0400, Daniel P. Smith wrote:
> >> On 3/31/22 08:36, Roger Pau Monné wrote:
> >>> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
> >>>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> >>>> index e22d6160b5..157e57151e 100644
> >>>> --- a/xen/include/xsm/xsm.h
> >>>> +++ b/xen/include/xsm/xsm.h
> >>>> @@ -189,6 +189,28 @@ struct xsm_operations {
> >>>>  #endif
> >>>>  };
> >>>>  
> >>>> +static always_inline int xsm_elevate_priv(struct domain *d)
> >>>
> >>> I don't think it needs to be always_inline, using just inline would be
> >>> fine IMO.
> >>>
> >>> Also this needs to be __init.
> >>
> >> AIUI always_inline is likely the best way to preserve the speculation
> >> safety brought in by the call to is_system_domain().
> > 
> > There's nothing related to speculation safety in is_system_domain()
> > AFAICT. It's just a plain check against d->domain_id. It's my
> > understanding there's no need for any speculation barrier there
> > because d->domain_id is not an external input.
> 
> Hmmm, this actually raises a good question. Why is is_control_domain(),
> is_hardware_domain, and others all have evaluate_nospec() wrapping the
> check of a struct domain element while is_system_domain() does not?

Jan replied to this regard, see:

https://lore.kernel.org/xen-devel/54272d08-7ce1-b162-c8e9-1955b780ca11@suse.com/

> > In any case this function should be __init only, at which point there
> > are no untrusted inputs to Xen.
> 
> I thought it was agreed that __init on inline functions in headers had
> no meaning?

In a different reply I already noted my preference would be for the
function to not reside in a header and not be inline, simply because
it would be gone after initialization and we won't have to worry about
any stray calls when the system is active.

Thanks, Roger.

