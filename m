Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974BF4B68FB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272902.467894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJur8-0001iF-Dd; Tue, 15 Feb 2022 10:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272902.467894; Tue, 15 Feb 2022 10:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJur8-0001g5-93; Tue, 15 Feb 2022 10:14:46 +0000
Received: by outflank-mailman (input) for mailman id 272902;
 Tue, 15 Feb 2022 10:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIVK=S6=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nJur6-0001fz-Qg
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:14:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1603c97b-8e48-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:14:41 +0100 (CET)
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
X-Inumbo-ID: 1603c97b-8e48-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644920081;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BwzIscPox8/N2tAa2yzOWEg+AYTY49WwOs1HdsrcVSg=;
  b=FujwDTl/ue3wPc0U4lgykA2PbvxPm46c6F6i8HgGDOUIGIJG0AmjvKI+
   wxttRL0H3NwST2bAOXr5g3DK/fl+CXvNW/bPZn7u47LwMKmMy3FxhMH+Q
   0dmuiTBJaKNDKnlhRpujbi1gKyTB0mFcsc+MBmqIr5ObxoQcWblezpDTC
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6OnrZt0EahQqPKzPGOlPJ9MKa5iJ6BAxoP8UE0SAx/JuqotcbS1nLoa90jNWVwmaZGPfTCy17c
 2+8FZgPtP3r7Q6MT88KA7LwDPgWuqVXFowMGwgBoO+4zNfFMwarUVTb5dA2RcZ9Z5EpkgkIQYI
 S94MIx06tRFWYWVPpKrdADfAex7Q1TLFV6RAFlJ+Swj6XEbjghAXxtotLpCCsI42JPfz4ZYDh1
 W/M9EIgpZnoX8BYRChA9T/Nb7YskVy9Xwx0j12uCzri7Fzn0/7o4k8mDdnbUojVzdoSp2eb6rQ
 dorwc+6recciuzq9ehUSFDOZ
X-SBRS: 5.1
X-MesageID: 63670515
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PaMv9a+85AvMKaHba2HqDrUD63iTJUtcMsCJ2f8bNWPcYEJGY0x3m
 mMbDTqFOviOYGv0c4t2O96x/RtSsJbQyNYxTApu/yo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgr+
 fAOqMC2FTsXO6/Hv+oWVDIGCHxHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwBJc/meqYWvnhkxDfUJf0nXYrCU+PB4towMDIY2JsQQq6DP
 pdxhTxHaQbRWkxVE30tD48ng+r1qWembRB6pwfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+X1ahveOwjEL4XttFM
 lEV4QInt610/0uuJvH+UgO5pjiYvxcac9tWD+A+rgqKz8L84RufQG4NTTdDadkvnM4wWTEuk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkxhB/SStdoEIauk8b4Xzr3x
 liisywWl7gVy8kR2M2T/03Dgj+qjojESEgy/Aq/dmCq9ARif6a+epelr1Pc6J59wJ2xFwfb+
 iJewo7Hsb5IXcrleDGxrPslRoCMpOvZNmHgv1ttFL4v/DOGpWX+RNUFiN1hH3tBPsEBcD7vR
 UbcvwJN+ZNeVEeXgb9Lj5GZUJpzk/W5fTjxfrWNN4cVPMAtHOOS1Hw2PSatM3bRfF/AeE3VE
 bOSao6SAHkTEsyLJxLmFr5GgdfHKs3TrF4/pKwXLTz6i9Jyh1bPEN/p1Wdiichjssu5TP39q
 Yo3Cidz40w3vBfCSifW65UPClsBMGI2A5v7w+QOKLLffVo2RTx5UqSLqV/ER2CCt/4L/tokA
 1nnAhMIoLYBrSGvxfq2hoBLN+q0AMcXQYMTNi0wJ1e4s0XPkq70hJrzg6AfJOF9nMQ6lKYcZ
 6BcJ62oX6QeIhyaqm91RcSs8+RfmOGD2Fvm09yNO2NkIfaNhmXhp7fZQ+cY3HBVUHTu7ZJk+
 +LIO8GyacNrejmOxf3+MZqH51iwoWIciKR1WU7JKcNUY0Li7M5hLCmZsxP9C5hkxczrymTI2
 gCILw0foOWR8YY5/MOQ3fKPrpuzEvs4FU1fRjGJ4bGzPCjc32yi3Y4fD7rYIWGDDDv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAn+cLuQa/V
 k+V1MNdPLGFZJHsHFILfVJ3ZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdp8k
 +k7ucMQ5wiusTYQM46L3nJO6mCBDn0cSKF75JsUN5Dm11gwwVZYbJ2CViKvuMOTa89BO1UBK
 yOPgPaQnKxVw0fPfiZhFXXJ2uYB150CtAoTkQ0HLlWN3NHEmuU2zFta9jFuFlZZyRBO0uRSP
 Gl3NhIqefXSrmkw3MUTDXqxHwxhBQGC/h2jwlQEo2TVUk20WzGfN2Y6I+uMoBgU/m80kuK3J
 11EJLIJiQrXQfw=
IronPort-HdrOrdr: A9a23:C0EV9q6+K4BoiKGqigPXwWuBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+863WBjB8bfYOCAghroEGgC1/qs/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpYdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwteOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 v4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv+/VXEO0aSSAWQR4Z
 7xSiQbToJOArTqDziISC7Wqk3dOfAVmiffIBGj8CDeSIfCNU0H4oJ69Pxkm13imhcdVZhHod
 N29nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMEjgRBq3PkiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyOeFPbC1z1dLl1qbrRnxw2OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,370,1635220800"; 
   d="scan'208";a="63670515"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhiH94mjWObNpJesh8H3wDSPNNSZ+OppS1QO/X8ToIgTJFaHnSnzDJ0veIJI6G2SSZCRx9n6v6RNJPXVu0hU+nmi/kUfpk9R1pj99hC1bVztl6+aDrdfHTP45Zb5++gk/jslqWuwQcr1B3aJjewt+OvQDlmah2x/7U79TOGAPjPWrhAnnkfD1a7fRvzLibisi67lRJa2PHxtAY927uePHRl+dz8B0Aag8tSDhx66Rg2aoBTr9PITnko/6RajYqN2wE8TNmE/k2KC4ULA4oJ7kNZyQbSDfkowo7VUiRUv+aPj6ypuQ5X7/MmpfxUwI2b7cCkjCHd0t27zUIuU8PZUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwzIscPox8/N2tAa2yzOWEg+AYTY49WwOs1HdsrcVSg=;
 b=Yn+RF8kN6/DtAzpi7nr740CJrEAudnZ5CMuAfv6tK40YPCH/8ZvVsmEIwRbLcs8h3o0WbAwW4UPXO9gCixYoHuMmUtG4SnwUwVinadqUaxmrPSdbV6TIvSfulgdpYIEfH94TdNprt+9mIKC5Xcz/0vBkhrlvyosAn6nmZX0fgd7tzP+5KmqOSPnmxOZEetmIqhco6dVZys2ZssIxAwo8NsKPv0otdloG1p1cT+PH+oqBwzhi+y/mu708jBXfpqJXLg/JqByt+8O+2zdzJstguOfLU78Hospoc/P8sWpG9u1t4G0/9eJuLlArjUkpi/G3KXt2m6WHYaUTkk27lxgfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwzIscPox8/N2tAa2yzOWEg+AYTY49WwOs1HdsrcVSg=;
 b=d/hFPH5yvDQ5U6iIc/IMesLwtxoQp7Ydk4fjoreF/cz+oIN4oppUPjvd/qTEoht8aKN8cKXGFDH6xTWNQhduAtK2iFXqsQ9Kauz60gKSEo+PHnlJV0M6R0GPaq4J5bdzuwnC9+qJ4699T2Yu2KCpKomBRFE5Nd2mt+FyTp7ukNE=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYHE+TdJl64aH33EedeR0PZ4zblKyMkj6AgAGTLwCAABdDgIAABJKAgATOw4CAAAIAAIAAQJgAgADqygCAADOdAA==
Date: Tue, 15 Feb 2022 10:14:32 +0000
Message-ID: <9721222d-1c0d-ddaf-fbc6-801f5d9445f5@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
 <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
 <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
 <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
 <1bac0507-9420-f0b9-f846-f1c73bf9678d@citrix.com>
 <42fb3257-0c36-c156-c81b-f70dd5f247aa@suse.com>
In-Reply-To: <42fb3257-0c36-c156-c81b-f70dd5f247aa@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f04d1dd-a0e6-47f6-bd7f-08d9f06bf5e0
x-ms-traffictypediagnostic: DM6PR03MB4809:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <DM6PR03MB4809B3346885CE3A1D705DC481349@DM6PR03MB4809.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vvnOaEiCm5QulmmOPGZwrEvuDi62ErHmK0gS45IA5WaWbdSuIDSQmwW2yPrWHNjR/hVGUroSrvQMMAToDosV3Htr7WFu15ss1H/N357fI4vMVtxqQAFp85izmj92kwU+jtrYtMvWn5tjoi2MphdTT04/JVjGv8jwsYVs3ADIQtVk8sfVZv4biXpP+GZYzhwJk5IwsVRt4OomJqcSrB1QInmmyrwZubv8YhWw6sUPcD8Wp73fHSPFqGhiZuSOSU1G689+7Vdh+zCQKqzJeLsVx6B20GvawrC1WzNWpJDyLw9Al0GCGdD0gAAN2qKZyor7g1pfnZlctuxyPJNeQd8GSha8mfI9V91AvwpQ0fAQbDptsbVKYYI19Jmtc2D8GIy6I+KqEwy5QyRRDaKH34AzYhmaBmnWB8d6ZdzWJEvExUg2u/G4qQzfPxgoe0NUWrn2SxT61+yeG/OoXjomupAcGzwiV2huLxYTwB5K/igMv3YIA2Qmzk7Umdnlhx/cO4bf+fkaDm+Vl8fCyU2LvongDAyodB102Hit68zh++hPJdJfCySbEhOWSryh9Bl1g5a2ApzfpbV5Lq1gALQzrwDi2xEw645o6gXSwL6KleQSdDB8QEsZ8908RJdAyQbBclDzUvTSCXE1qaXRKRrm9rPIddOkcwBklqiKuP1pzzFLA3kii7r0StvkTR2rPt/a34X7IKHn0fuOHY9jpH2J5MxV+9IUGKGrpQ0t1Pf6pBPWPs83DkZ5escdx4eCmMEaLR1B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(6916009)(91956017)(316002)(508600001)(86362001)(83380400001)(71200400001)(6486002)(6512007)(6506007)(31686004)(26005)(7416002)(31696002)(186003)(2906002)(36756003)(5660300002)(2616005)(107886003)(8676002)(4326008)(66476007)(66556008)(53546011)(64756008)(122000001)(66446008)(76116006)(82960400001)(66946007)(8936002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFFvekZoRkQwVTJ4RWttREhNZG5VVklNd2VPZis2VHoxYVFNN0NzNEZxVGFq?=
 =?utf-8?B?UG1DeWQ2L3BKSkNkaGppOU8xZU8zbnVmc0Z6eUczeXdvNmNDRUJ6U3ZzQmdO?=
 =?utf-8?B?SEd6VXNWR1k1bTkzZGFBbkc0QVB3eXZIU2kxaG5sRDZlYXdkK0w0ekJIZzB6?=
 =?utf-8?B?OS9sUEV3b0tIcG1xd2REVTlKa29NWmJPb1drbTYrOWQvZ2VUYmUvWkFadnFL?=
 =?utf-8?B?ZEQwdXZGVUhIMjVsanNwU0xROGVSemhlaFlSay9wQkhRS09BK3JrK0FnNnV3?=
 =?utf-8?B?K3ZhMFQ5NUpPNjA1OHMyUFlacnBodzR4QnVLZXRhSTdWbHowOWVQVks1ZlE0?=
 =?utf-8?B?bjFwaWhaanNjOFZnNE92T3M4Z0Q2aEFYeWlTVy9RRk1NMXRsOGd5dHR1dy92?=
 =?utf-8?B?ZE5YbDVLVDJsZUd2NlhIOFRHTTV3TGN6NnpHN1hUR3JXK3FpNDQzS3N4MmZP?=
 =?utf-8?B?aWtpdWxiTG9ieWkyc01xYzdsSHJudTQxYXJBR1VJNFVJcmFTcWFiS1JNREoz?=
 =?utf-8?B?YUtuaTJYTVp1N3RoanVhRjk3NUIvQytmQ0VFblJpT1hyUmhuVmtKTmlUc25G?=
 =?utf-8?B?UlFDdG1PTVU3YjNWWUdsUFZBcTRSR2hRaXE4dVdxUVAvMzFJc1ZkWmlJQWZk?=
 =?utf-8?B?N01wei9MOGJLaU0ydEFPbGxpOUd5M2NaeEdRTGR3Z0dkVUthcHh0OU90b1Bq?=
 =?utf-8?B?dDhrYnk4dEhLbEFUK0QvOUY3VlZ1QjVPd0huZ2g3RXZqMk1lWmNZS21SRm91?=
 =?utf-8?B?Qi8wa0w5TEtwcVUzTXU4NWNYdmJTK25PaTJna2NuYjJmUmRFT2NHd05yZ2tQ?=
 =?utf-8?B?SFBhQkRWZXV1cEh5Q2d5bTZDcjBBbVJic2pPZStZVHZic1lxZFlINjc5b09Y?=
 =?utf-8?B?NWYyZWJtZnI5REljNkZPZklLVmNyN0gvSDFsRTU0SldtVDdtb2RyTmQvQUdl?=
 =?utf-8?B?blNFdlhzM1ZYOFFyQUhrTGFBSWVIbHpMVjRoMXl2WkVMSitUVTVXTmxWT2pN?=
 =?utf-8?B?WWhXYmxlZmhrVDl5T1JlZlNhTm1WZ3lmMW9jNllESVl2MzZiNUdLeUwwMnNl?=
 =?utf-8?B?SGV1VE40MGpkeFhVeUljMVBEU1M1UlM1WVhZZ2FPaEY5aWp0Z2Vmdm92VjFj?=
 =?utf-8?B?R0Y4VGdpY21kNTdoK0I1MDlHRGI2MnEzOFF1TXNKY25Da1V4Zk9DK3BoUkJm?=
 =?utf-8?B?cHZ0ZFZxQkdIcS93L1gydkw0ZGpRTHpOTG8yZ1dzSE5tZEY1VmR5SWdXamZ3?=
 =?utf-8?B?ZFVhMVBmbFl1VHZYZ1NGZjFGVDlwQUQrRUlGejA2YzFwL0hEN1Mrak1QWFNS?=
 =?utf-8?B?T2tIMUFXZWdOTWxsLzFBejBsb0tqRGJSRnNEV21xMjdjUkpPNmdmUVV4cTJB?=
 =?utf-8?B?UmNvQzd5UXBaWDhwNWdEdG5JVFpRSGRpeTMxWU54aDZ2UllqUmNpaTBtZU05?=
 =?utf-8?B?c1lsRGR5SS9TNUpBaG4wTGd6NUM3WEM0Nk1yc1lEdWNnNllJY2xhbU04SEZq?=
 =?utf-8?B?R05hM3ZDMit4KzFQRzJvSzRrakhzeHRTZGJ2R0FVNi9GOXNpbGxDQTJIQ2NL?=
 =?utf-8?B?bHZ0d05GdzQzeDY4R3FtKzlJOFpSb3pSdjdaVEs4azYrSkoyY1c1OS9SV1Fh?=
 =?utf-8?B?OEMva21RVlZPbk9pYkhuWW5OUm9kbzl0VGlDR2NycGVqVE1LeDdGby9QbG9F?=
 =?utf-8?B?ejc3RytEQ3JnaTNhMXBOSDBRWEdtdzIwNnBNSWZwa2d4Y2FzUXRGVnVoMnhh?=
 =?utf-8?B?UjNsVUp3SUx0cUtXREQ3Unl6cGdsWm51ZGtzL3MvaVRqS0FjOUJXWCtoQS9v?=
 =?utf-8?B?OXFVSEVHanBlRzlnVXFCc3ZaR0tzbmNlY2pVRzdlR3VPb0VCeHpUQzlWaEdY?=
 =?utf-8?B?WlBvTXY3RmpucDdxL25DZG9hd1FwTnVuOEo5aFE1a1QwZkJPajFCY09haFBz?=
 =?utf-8?B?MDd4bFQxZFBXUnd1MlpUMWN2MGlyRytNb0J0Tm9mRzdMWkhWbWljM2gvYllY?=
 =?utf-8?B?NUZQeFY2OHRXUTVrMlhhUExFMndTY2Uzc2JUMGRMaVhEM1ZYVno2Szk3V013?=
 =?utf-8?B?NjlKK3VXaUNiRitXLzkyL1pwZDl6ZG9Tek1sa2Q4bjlWdExTaklhZlZ4SUQ3?=
 =?utf-8?B?bXRoYnEzWk1RbmpPdGJWeWJHRXpBdmsrNGMwK09scmpGQS84eGZYVnFYRVBi?=
 =?utf-8?B?MDQySEdyOUNpNjNOdnZMZVpIazA5c0RUTE5wWVYrUDNiTnBtT3hGQzFVdkVv?=
 =?utf-8?Q?Lpw6oSf1Imztq2ya0+YvZjdmfGt88kbuUukkT0nQWg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F7D5E9541164847BFEB702A260A8FBB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f04d1dd-a0e6-47f6-bd7f-08d9f06bf5e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 10:14:32.5386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hb2++IPhvOm4NwDobolj9nLdN3DfoDyOYRPUepG64Jx26w3WRrEgKppQuTkR/vH7gRARCZOAuEwgwQo5u3OC7CbnFqXW2cIyqS+vM+lP86k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4809
X-OriginatorOrg: citrix.com

T24gMTUvMDIvMjAyMiAwNzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDE0LjAyLjIwMjIgMTg6MDksIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEzOjE4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBbQ0FV
VElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4NCj4+PiBPbiAxNC4wMi4yMDIyIDE0OjExLCBKYW5l
IE1hbGFsYW5lIHdyb3RlOg0KPj4+PiBPbiAxMS8wMi8yMDIyIDExOjQ2LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4+IFtDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xp
Y2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4+Pj4+DQo+Pj4+PiBPbiAx
MS4wMi4yMDIyIDEyOjI5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+IE9uIEZyaSwg
RmViIDExLCAyMDIyIGF0IDEwOjA2OjQ4QU0gKzAwMDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+
Pj4+Pj4+IE9uIDEwLzAyLzIwMjIgMTA6MDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+
Pj4+PiBPbiBNb24sIEZlYiAwNywgMjAyMiBhdCAwNjoyMTowMFBNICswMDAwLCBKYW5lIE1hbGFs
YW5lIHdyb3RlOg0KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bWNzLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMNCj4+Pj4+Pj4+PiBpbmRleCA3YWIx
NWUwN2EwLi40MDYwYWVmMWJkIDEwMDY0NA0KPj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vdm14L3ZtY3MuYw0KPj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3Mu
Yw0KPj4+Pj4+Pj4+IEBAIC0zNDMsNiArMzQzLDE1IEBAIHN0YXRpYyBpbnQgdm14X2luaXRfdm1j
c19jb25maWcoYm9vbCBic3ApDQo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBNU1JfSUEzMl9W
TVhfUFJPQ0JBU0VEX0NUTFMyLCAmbWlzbWF0Y2gpOw0KPj4+Pj4+Pj4+ICAgICAgICAgIH0NCj4+
Pj4+Pj4+PiAgICAgIA0KPj4+Pj4+Pj4+ICsgICAgLyogQ2hlY2sgd2hldGhlciBoYXJkd2FyZSBz
dXBwb3J0cyBhY2NlbGVyYXRlZCB4YXBpYyBhbmQgeDJhcGljLiAqLw0KPj4+Pj4+Pj4+ICsgICAg
aWYgKCBic3AgKQ0KPj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4+ICsgICAgICAgIGFzc2lzdGVk
X3hhcGljX2F2YWlsYWJsZSA9IGNwdV9oYXNfdm14X3ZpcnR1YWxpemVfYXBpY19hY2Nlc3NlczsN
Cj4+Pj4+Pj4+PiArICAgICAgICBhc3Npc3RlZF94MmFwaWNfYXZhaWxhYmxlID0gKGNwdV9oYXNf
dm14X2FwaWNfcmVnX3ZpcnQgfHwNCj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSkgJiYNCj4+Pj4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1X2hhc192bXhfdmly
dHVhbGl6ZV94MmFwaWNfbW9kZTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJJ3ZlIGJlZW4gdGhpbmsg
YWJvdXQgdGhpcywgYW5kIGl0IHNlZW1zIGtpbmQgb2YgYXN5bW1ldHJpYyB0aGF0IGZvcg0KPj4+
Pj4+Pj4geEFQSUMgbW9kZSB3ZSByZXBvcnQgaHcgYXNzaXN0ZWQgc3VwcG9ydCBvbmx5IHdpdGgN
Cj4+Pj4+Pj4+IHZpcnR1YWxpemVfYXBpY19hY2Nlc3NlcyBhdmFpbGFibGUsIHdoaWxlIGZvciB4
MkFQSUMgd2UgcmVxdWlyZQ0KPj4+Pj4+Pj4gdmlydHVhbGl6ZV94MmFwaWNfbW9kZSBwbHVzIGVp
dGhlciBhcGljX3JlZ192aXJ0IG9yDQo+Pj4+Pj4+PiB2aXJ0dWFsX2ludHJfZGVsaXZlcnkuDQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gSSB0aGluayB3ZSBsaWtlbHkgbmVlZCB0byBiZSBtb3JlIGNvbnNp
c3RlbnQgaGVyZSwgYW5kIHJlcG9ydCBodw0KPj4+Pj4+Pj4gYXNzaXN0ZWQgeDJBUElDIHN1cHBv
cnQgYXMgbG9uZyBhcyB2aXJ0dWFsaXplX3gyYXBpY19tb2RlIGlzDQo+Pj4+Pj4+PiBhdmFpbGFi
bGUuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhpcyB3aWxsIGxpa2VseSBoYXZlIHNvbWUgZWZmZWN0
IG9uIHBhdGNoIDIgYWxzbywgYXMgeW91IHdpbGwgaGF2ZSB0bw0KPj4+Pj4+Pj4gYWRqdXN0IHZt
eF92bGFwaWNfbXNyX2NoYW5nZWQuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhhbmtzLCBSb2dlci4N
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gQW55IG90aGVyIHRob3VnaHRzIG9uIHRoaXM/IEFzIG9uIG9uZSBo
YW5kIGl0IGlzIGFzeW1tZXRyaWMgYnV0IGFsc28NCj4+Pj4+Pj4gdGhlcmUgaXNuJ3QgbXVjaCBh
c3Npc3RhbmNlIHdpdGggb25seSB2aXJ0dWFsaXplX3gyYXBpY19tb2RlIHNldCBhcywgaW4NCj4+
Pj4+Pj4gdGhpcyBjYXNlLCBhIFZNIGV4aXQgd2lsbCBiZSBhdm9pZGVkIG9ubHkgd2hlbiB0cnlp
bmcgdG8gYWNjZXNzIHRoZSBUUFINCj4+Pj4+Pj4gcmVnaXN0ZXIuDQo+Pj4+Pj4NCj4+Pj4+PiBJ
J3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgdGhpcywgYW5kIHJlcG9ydGluZyBoYXJkd2FyZSBhc3Np
c3RlZA0KPj4+Pj4+IHh7Mn1BUElDIHZpcnR1YWxpemF0aW9uIHdpdGgganVzdA0KPj4+Pj4+IFNF
Q09OREFSWV9FWEVDX1ZJUlRVQUxJWkVfQVBJQ19BQ0NFU1NFUyBvcg0KPj4+Pj4+IFNFQ09OREFS
WV9FWEVDX1ZJUlRVQUxJWkVfWDJBUElDX01PREUgZG9lc24ndCBzZWVtIHZlcnkgaGVscGZ1bC4g
V2hpbGUNCj4+Pj4+PiB0aG9zZSBwcm92aWRlIHNvbWUgYXNzaXN0YW5jZSB0byB0aGUgVk1NIGlu
IG9yZGVyIHRvIGhhbmRsZSBBUElDDQo+Pj4+Pj4gYWNjZXNzZXMsIGl0IHdpbGwgc3RpbGwgcmVx
dWlyZSBhIHRyYXAgaW50byB0aGUgaHlwZXJ2aXNvciB0byBoYW5kbGUNCj4+Pj4+PiBtb3N0IG9m
IHRoZSBhY2Nlc3Nlcy4NCj4+Pj4+Pg0KPj4+Pj4+IFNvIG1heWJlIHdlIHNob3VsZCBvbmx5IHJl
cG9ydCBoYXJkd2FyZSBhc3Npc3RlZCBzdXBwb3J0IHdoZW4gdGhlDQo+Pj4+Pj4gbWVudGlvbmVk
IGZlYXR1cmVzIGFyZSBwcmVzZW50IHRvZ2V0aGVyIHdpdGgNCj4+Pj4+PiBTRUNPTkRBUllfRVhF
Q19BUElDX1JFR0lTVEVSX1ZJUlQ/DQo+Pj4+Pg0KPj4+Pj4gTm90IHN1cmUgLSAic29tZSBhc3Np
c3RhbmNlIiBzZWVtcyBzdGlsbCBhIGxpdHRsZSBiZXR0ZXIgdGhhbiBub25lIGF0IGFsbC4NCj4+
Pj4+IFdoaWNoIHJvdXRlIHRvIGdvIGRlcGVuZHMgb24gd2hhdCBleGFjdGx5IHdlIGludGVuZCB0
aGUgYml0IHRvIGJlIHVzZWQgZm9yLg0KPj4+Pj4NCj4+Pj4gVHJ1ZS4gSSBpbnRlbmRlZCB0aGlz
IGJpdCB0byBiZSBzcGVjaWZpY2FsbHkgZm9yIGVuYWJsaW5nDQo+Pj4+IGFzc2lzdGVkX3h7Mn1h
cGljLiBTbywgd291bGQgaXQgYmUgaW5jb25zaXN0ZW50IHRvIHJlcG9ydCBoYXJkd2FyZQ0KPj4+
PiBhc3Npc3RhbmNlIHdpdGgganVzdCBWSVJUVUFMSVpFX0FQSUNfQUNDRVNTRVMgb3IgVklSVFVB
TElaRV9YMkFQSUNfTU9ERQ0KPj4+PiBidXQgc3RpbGwgY2xhaW0gdGhhdCB4ezJ9YXBpYyBpcyB2
aXJ0dWFsaXplZCBpZiBubyBNU1IgYWNjZXNzZXMgYXJlDQo+Pj4+IGludGVyY2VwdGVkIHdpdGgg
WEVOX0hWTV9DUFVJRF9YMkFQSUNfVklSVCAoaW4gdHJhcHMuYykgc28gdGhhdCwgYXMgeW91DQo+
Pj4+IHNheSwgdGhlIGd1ZXN0IGdldHMgYXQgbGVhc3QgInNvbWUgYXNzaXN0YW5jZSIgaW5zdGVh
ZCBvZiBub25lIGJ1dCB3ZQ0KPj4+PiBzdGlsbCBjbGFpbSB4ezJ9YXBpYyB2aXJ0dWFsaXphdGlv
biB3aGVuIGl0IGlzIGFjdHVhbGx5IGNvbXBsZXRlPyBNYXliZQ0KPj4+PiBJIGNvdWxkIGFsc28g
YWRkIGEgY29tbWVudCBhbGx1ZGluZyB0byB0aGlzIGluIHRoZSB4bCBkb2N1bWVudGF0aW9uLg0K
Pj4+DQo+Pj4gVG8gcmVwaHJhc2UgbXkgZWFybGllciBwb2ludDogV2hpY2gga2luZCBvZiBkZWNp
c2lvbnMgYXJlIHRoZSBjb25zdW1lcihzKQ0KPj4+IG9mIHVzIHJlcG9ydGluZyBoYXJkd2FyZSBh
c3Npc3RhbmNlIGdvaW5nIHRvIHRha2U/IEluIGhvdyBmYXIgaXMgdGhlcmUgYQ0KPj4+IHJpc2sg
dGhhdCAic29tZSBhc3Npc3RhbmNlIiBpcyBvdmVyYWxsIGdvaW5nIHRvIGxlYWQgdG8gYSBsb3Nz
IG9mDQo+Pj4gcGVyZm9ybWFuY2U/IEkgZ3Vlc3MgSSdkIG5lZWQgdG8gc2VlIGNvbW1lbnQgYW5k
IGFjdHVhbCBjb2RlIGFsbCBpbiBvbmUNCj4+PiBwbGFjZSAuLi4NCj4+Pg0KPj4gU28sIEkgd2Fz
IHRoaW5raW5nIG9mIGFkZGluZyBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9mOg0KPj4NCj4+
ICs9aXRlbSBCPGFzc2lzdGVkX3hhcGljPUJPT0xFQU4+IEI8KHg4NiBvbmx5KT4NCj4+ICtFbmFi
bGVzIG9yIGRpc2FibGVzIGhhcmR3YXJlIGFzc2lzdGVkIHZpcnR1YWxpemF0aW9uIGZvciB4QVBJ
Qy4gVGhpcw0KPj4gK2FsbG93cyBhY2Nlc3NpbmcgQVBJQyByZWdpc3RlcnMgd2l0aG91dCBhIFZN
LWV4aXQuIE5vdGljZSBlbmFibGluZw0KPj4gK3RoaXMgZG9lcyBub3QgZ3VhcmFudGVlIGZ1bGwg
dmlydHVhbGl6YXRpb24gZm9yIHhBUElDLCBhcyB0aGlzIGNhbg0KPj4gK29ubHkgYmUgYWNoaWV2
ZWQgaWYgaGFyZHdhcmUgc3VwcG9ydHMg4oCcQVBJQy1yZWdpc3RlciB2aXJ0dWFsaXphdGlvbuKA
nQ0KPj4gK2FuZCDigJx2aXJ0dWFsLWludGVycnVwdCBkZWxpdmVyeeKAnS4gVGhlIGRlZmF1bHQg
aXMgc2V0dGFibGUgdmlhDQo+PiArTDx4bC5jb25mKDUpPi4NCj4gDQo+IEJ1dCBpc24ndCB0aGlz
IGNvbnRyYWRpY3Rvcnk/IERvZXNuJ3QgbGFjayBvZiBBUElDLXJlZ2lzdGVyIHZpcnR1YWxpemF0
aW9uDQo+IG1lYW4gVk0gZXhpdHMgdXBvbiAobW9zdCkgYWNjZXNzZXM/DQoNClllcywgaXQgZG9l
cyBtZWFuLiBJIGd1ZXNzIHRoZSBhbHRlcm5hdGl2ZSB3b3V1bGQgYmUgdGhlbiB0byByZXF1aXJl
IA0KQVBJQy1yZWdpc3RlciB2aXJ0dWFsaXphdGlvbiBmb3IgZW5hYmxpbmcgeEFQSUMuIEJ1dCBh
bHNvLCBhbHRob3VnaCB0aGlzIA0KZG9lc24ndCBwcm92aWRlIG11Y2ggYWNjZWxlcmF0aW9uLCBl
dmVuIGdldHRpbmcgYSBWTSBleGl0IGlzIHNvbWUgDQphc3Npc3RhbmNlIGlmIGNvbXBhcmVkIHRv
IGluc3RlYWQgZ2V0dGluZyBhbiBFUFQgZmF1bHQgYW5kIGhhdmluZyB0byANCmRlY29kZSB0aGUg
YWNjZXNzLg0KDQpUaGFua3MsDQoNCkphbmUu

