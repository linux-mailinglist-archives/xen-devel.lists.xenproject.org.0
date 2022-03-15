Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E04D984E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 11:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290710.493118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU41A-0000s4-2r; Tue, 15 Mar 2022 10:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290710.493118; Tue, 15 Mar 2022 10:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU419-0000pf-Vo; Tue, 15 Mar 2022 10:03:03 +0000
Received: by outflank-mailman (input) for mailman id 290710;
 Tue, 15 Mar 2022 10:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU418-0000pZ-Un
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 10:03:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0808eaea-a447-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 11:02:57 +0100 (CET)
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
X-Inumbo-ID: 0808eaea-a447-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647338577;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DeSJ2a0H4s1/C65Q4p3lPmSxVcMpFg4jGEQrdru9JxU=;
  b=F6IAYUiMZNTbPSRoH1vfwO3qiyufHLwiD47lf/p9ZEkKjG+qADpSSQxR
   fDOph4v8oqBpH/CvqV2smDWZ3pitZmAqdjEPutesxJddI8H+GTnV/ZG+4
   317US1BWLNcqi9CHzzbdCxm0JeWfZymnLp80NX0GRjnEdOuHW3XhGTyD8
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65733602
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oOnLbqlWGCMDbUrY+bB9stPo5gxfJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXDWqGafeLYGSje911bNnn8EJTscDVx4RhTAQ5/yE8ESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWl7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYUTwzb53sydwhY0cJGA9iGJMa4OTDCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uBP
 JFHMWAHgBLoQjB2H3k3JZMCufb4on7cThwA+EK+nP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqzgsffkCW9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGha077kmiVNT+dxy+vn+fvxQYVsZQEus18wWEwOzf5APxLmoZSj9MbvQ2uclwQiYlv
 neLld70AT1ksJWOVGmQsLyTqFuP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLCJWv3+3VSAnM8
 27bpwYiootPlZUP/vDulbzYuA6Eqp/MRw8zwwzYWGO58w90DLKYi5yUBUvztqgZctvAJrWVl
 D1dwpXFsrhSZX2YvHbVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMxkV4JjHOwFCHzBUOSX25XI59ypUQHPY65Ps04lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EVfs9nWDvHbdEi+VDKsUCKYX7HsmTI/OPi+b2WZJoYe1dbAvmgh4RsctoXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSNTOHwCkOQOLrTrClM/QAkJUqaNqZt8K90Nt/kEzY/go
 yDiMnK0PXKi3BUr3y3RMSs9AF4uNL4ixU8G0dsEZg/5hSJ8Pd7xsM/ytfIfJNEayQCq9tYtJ
 9EtcMScGPVfDDPB/jUWd57mq4J+Mh+sgGqz0+CNPVDTo7YIq9T1x+LZ
IronPort-HdrOrdr: A9a23:v2aFOqr3dvdVDr1nceHy020aV5vPL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGNXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5lUUtMPpZzfSKJMB25ffvtChPaHb21LtBOB5ryw6SHlIndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.90,183,1643691600"; 
   d="scan'208";a="65733602"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBEyGpmrwJBViSqAUEfdGtXADHQxialMu7yzoPIb7VZAd4y5FON5vcYj98ZOIAFYL5htpvhn03kNIgQjGyIw1NbkMdnqHVfSPKvSYEg06UhzIyH9jZt3PrGazTjxnHRjvU6IYI7XDr8t0dsppAfmfD7ZTg5n4PYyq2Z7BFsWjPaQQMqlwxsW+JjqgjOBZhMLW9Sr0ESU7dwVig5MTn20wBNQgWJHe/UBgqmu97UW+o41kwOXZvWycarkefgn1qjNpnqtiwKl/KleH7FmETTYp+OyTZiLX+RwFbGcmPpUAgTID8o7VYuoXQ+gzZ8610fij+QeRL3JXfxz9ZAA/8WzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYHjW+oh1C0V3IAAXUINnLbbiPqWendHECTKZN4od/A=;
 b=Vad6EM0bcsV/BN3PV37lxYAHA7Y9aMSooq9tLMPW5ano2Fp3zm5xY/OvWR3QeeZdN79EKHA5Jx+fZG5xz2Vqh43h/uHfGnB7N/LbMuwgGrBPHGGd7HzTkj8NG1oM/t1QfB2IFBBYffArrf5LJ8PUWOGooFJBfjAijSGBCRSFgbquG/tDAKDP0FgXjgu9Q2n/jJPcTOPOHurPUFDUYAi+KoCGkqzEShPRgKg1GCiOAb+1jJyXpcNUTHVYh9f3lm4OEIMb+cQPEJ4W8L6qH3MLvND2zU80O6wkHuDcB9gzj9gJDCBXgZwKFRnXtEq256uyHGBI+hM6pyK5YJy0hKyGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYHjW+oh1C0V3IAAXUINnLbbiPqWendHECTKZN4od/A=;
 b=w8o5U6FpULCSZAK85P3nhglKtLH/li3ld5VfgpSa/WADjeVPyhGvq43+c1iU58z5m6qpWhMS7QWBHcJ/M7Sy8lSyYF2TASTfWLiUmIhcXMEhogMGziElb72M448I3Nh+VhRdenwd0A/YW9Hg4aIzSnYgj26/1gcUOQjR8W3kC3g=
Date: Tue, 15 Mar 2022 11:02:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <YjBkLgpfAlPwtwiA@Air-de-Roger>
References: <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org> <YiopXU65pAlnNVNI@mail-itl>
 <d2c63630-6ab3-b4dd-128e-72f871fb9e08@xen.org> <Yisp0Q/cNGbgsO/7@mail-itl>
 <2a5c59ad-2fa5-b668-8bce-0d55e89a4afd@xen.org>
 <Yitk68wpP8HV4od9@Air-de-Roger>
 <5cedf43b-3903-9668-69a0-01b8ba339ba7@xen.org>
 <YituGsgaGaGSIMZ1@Air-de-Roger> <Yit5rnJnOu1VMIn1@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yit5rnJnOu1VMIn1@mail-itl>
X-ClientProxiedBy: LO4P123CA0475.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80695629-a1fd-4481-c394-08da066ae8d3
X-MS-TrafficTypeDiagnostic: BN3PR03MB2244:EE_
X-Microsoft-Antispam-PRVS: <BN3PR03MB2244F25EE107EBB742234F418F109@BN3PR03MB2244.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5PUUfVDtIrvKwZDcT9QPV9wVAbRdIZbZ63eBaba+CLOltLM29TmwacKbwlEOQBzvu1ofYsjNDNc8Hws6GWC4Zqqmeww2j6k8PxeiKgRiIm3Uo8JDLJBml97JM1QuifPDb6wevxw+bZECBu3WpCrcEjbrZ/nuwceVHyo+PKzAjO3pmYEvEjpSPHJ4lBvDA2qkJURLnOO3wKs5YGQhre/bYcFQfUzFOxpfF+pLpcGhzi9IPXaIn+n6YuOBtJA4fykjN19nLG2W1wTTxt1sRCaUKmLvVzzG6/1xthIxFNIFvybb/WOBVMXSvA7wr1O7DOXxsAvv2kQQ2L8hPz0HHuf6268JJ8BXyjcp0qkVtP/OBYSFfAiGxHguaP3TQ1YKpqzwNbTcEHFnFc7J2r7YxmGrd/Fy+vPNHc/d87GzI/LPDLoAw7XKTjWyWt2FCZO9Q7fj72q44f0pXBf1x2sKc+QHx8lXM3qSJuaEMhphnOLIKsCKKOVl83ekwOhT4VsfbrqDFBnqpH/KLUhyKlT6+Azv9X2TSd/gZeHUEx/kLOv3cLZ+3wKA/eBH8649G0n8GC9JcGFlxIEzEEG6suR4pd/JCAhZPFIA/XrucbzmchWBcL+nv0GijrQa8E7U25TRE2J9a51GDEtdSqCQ/762Vicrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(8676002)(66476007)(66946007)(66556008)(33716001)(38100700002)(316002)(82960400001)(186003)(26005)(5660300002)(8936002)(2906002)(86362001)(4744005)(6506007)(6666004)(6512007)(9686003)(54906003)(6916009)(508600001)(6486002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODdMTTVpN2oyemdTOUxoMS9QRmpsUWZ5YkpON2d0WUQ4MFE0RFIvMWtsNDg4?=
 =?utf-8?B?NU9WaVZ1Q2hKZElRWXIzdXZnU0JUS2V4citHUlRTMVNCUUdOemNLckUxT3Vq?=
 =?utf-8?B?YllveEpodUFoZ0o0VHNPdnlTRnZzMTNOSnVRd0xsdXZaR1hwZWpkSkYxRXNh?=
 =?utf-8?B?NGdxaHNhSXJ5emNpQlVpcWh6bVBUazNXWmlqNGtqdEJ2MmdrVVh3ckw4cnlw?=
 =?utf-8?B?UXM4ZjZ5V2psbSsrbGVxZ3dVOFI2c3pUbnhqcTV2K05BMFZ0VkdVOGtVYmVK?=
 =?utf-8?B?RmMzZTFqUXpndERzNVQ2MFB2Sk8yQ3I2MDFGWDFGbFpYZGJLN2cwQ25tTHRX?=
 =?utf-8?B?eFhrYlNRaWpydFg0NzhubXEvczVnM0VDQ1gvd1Fhc3B4N3VCbzZnemY1THp3?=
 =?utf-8?B?eHJTSDM2ak1KUlZ6UHBlWVFuRnBIRnBSU09RZG1KTHRjWWJGUmFlaVg5b1hz?=
 =?utf-8?B?WFdudy9jZnV2NFFmbWJ2ZXlLK25iTFJhUm9BaFptWDh0ejQ4em1vdDE0bWxP?=
 =?utf-8?B?VXRkUEJlTTE3azRocEFzRXpjKzRYckFBcDhXUHRSemFHUnpNajNhRHZqbUJT?=
 =?utf-8?B?MFVpcjgzOUVGOXBzcUwyNnkySi9jL1JHNWJpYXpvMDRNcDFSL2tLaS9KanZa?=
 =?utf-8?B?MWJRbjIrS3pYSnl0ejBMN1R5ODJRN3BoR29GRjVqQkFIcEFrdlM5b0dQd2tp?=
 =?utf-8?B?aytzTGJpcGliQ1dHQjArWGUxQlc5T2FSRnEvcUdMV3RQVnN2NDVSdTVzYlp6?=
 =?utf-8?B?a1pyNyt3MElGN3RsYkt6MUV1U29BOFdyb2pvUFQrc0VRb0lTK0JSSGZad3Uw?=
 =?utf-8?B?OThzMUkxWFpVZlpDSzk5Wll2eFhEdWhwTHh6TDNPcWxNSnJTZXJubkY2bWp2?=
 =?utf-8?B?T3dYZmFGN3NJUkdyZUdvSGJtOHduMHQwc1J0RFhvM2hBL1B4N1JPUkppTlVm?=
 =?utf-8?B?WFdLd1diTlNiejlWRFA5cEJTeFM5M0xUcjVlOXdNckZ3YzlEamFGdWhuUGtQ?=
 =?utf-8?B?Tk13STVhZlYwN3pFTGtTYXRQMlIxUjFqQ0lyOTI1d1hHdVkyUU9xMm84cGNE?=
 =?utf-8?B?dk5vUFZMWHZKZE1RL3lNYStyOVFyMU1sb2s1OCt4VFE4bFRMTExVUGUrT0Vz?=
 =?utf-8?B?NGVVUVNISUNDNE9MNVpKNkh2b3VFbVpyYWdiWW9hV2dDU1pCU0tDTTZQOU96?=
 =?utf-8?B?a3hIQXc5Q1ZWRzZTcWdMS1lyZ0tGVUdJYnVoS1VnVlo0L0ZWY3NMelQzc1U5?=
 =?utf-8?B?YjdKdzZkWE4yZGdjZnhhSzhydS9yRFJNRTVLb3c2TkRkdUp6VStzMmtYMlp6?=
 =?utf-8?B?Z0RWZm5aYXNteFhOZWZ6bHdhdWNPNUhCeXVLaVg2d200T3BtQkt5bFo0UEZY?=
 =?utf-8?B?YldiaWJYbkh0S1FucG01ZlpJdk53WE5yb3NNZHF4M3IvNGg2ckdOZE82ZkdP?=
 =?utf-8?B?WnFqd0gzRkhwdC9idFd3c1JaajdJTHZLK0Y2Y2tlbGVaa21yRHlBT1c5T0JQ?=
 =?utf-8?B?R0ZsanpDSWxjbXFPV3RFL21JNVkxNERmeVcwME8zc1BIQUxmajJyVjVMSEI3?=
 =?utf-8?B?RFpLUzZYbFBlbk9PM0lxMVlxTFhKWWM3UUQ4WXlEdTltZnZYd1EwN3Y2OW9T?=
 =?utf-8?B?ZitiZjZDNnVFV2swd05jdERQZEtIMEtuYWNPaUFJeWlYUWhjaUdpRWhZdW1M?=
 =?utf-8?B?OXJCQmRteFRaditXczJ3VWlPUllWd2VHMHhWN0FRbjJWM2dIbFVTWUdoSDBP?=
 =?utf-8?B?ZFN5RTFMNS8yK084QldYTDFQekNrV2dNS2xxaHM4VVJBL25WbVJiRjBGc1FG?=
 =?utf-8?B?S25jeG5lVEVFUEZBNXZ3bGNTOHNuY013WEdoeWNCOUsyVExWbEJ3bHpHWjJj?=
 =?utf-8?B?alJ4ajJEbmE1L2YwcHRmUG8xbkxRSzZkTXFNTkZNMFpMTzdERVl3VVFEMExI?=
 =?utf-8?B?clFhWWcyZUFSeXRvekVCM1lqNWJjSTIzOGwyRHZZQlRhcUlVT1VvNjdPVkdl?=
 =?utf-8?B?OHFYakVOZVNBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80695629-a1fd-4481-c394-08da066ae8d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 10:02:27.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qblN0KyOHvc6gCAcZW1b2zu5yarimfTu38JkfJVXPkbC8VQ2xHxSIJxRQnz9qT5Tf56eG2HfUWFAU6zzh6GjIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2244
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 05:32:45PM +0100, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 11, 2022 at 04:43:22PM +0100, Roger Pau Monné wrote:
> > Sorry, maybe this wasn't clear. My suggestion was not to just do this
> > fix and call it done, but rather to add this check for sanity and then
> > figure out how to properly handle this specific device.
> 
> Yes, I agree. Having it properly configured is preferred. Linux manages
> to do that, but I'm not sure how exactly. But ...

I think it might get the interrupt from ACPI data, which is likely out
of scope for Xen. Can you take a look at ACPI data from the box and
see whether the interrupt is reported there? (search for a _CRS method
belonging to the LPSS device)

Sadly the LPSS spec doesn't contain any help regarding the usage of
0xff in the Interrupt Line register. Out of curiosity, can you print
what's in the Interrupt Pin register? (PCI_INTERRUPT_PIN)

Thanks, Roger.

