Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF942EE24
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210055.366766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJqM-0004wM-Tp; Fri, 15 Oct 2021 09:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210055.366766; Fri, 15 Oct 2021 09:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJqM-0004uI-Pp; Fri, 15 Oct 2021 09:49:38 +0000
Received: by outflank-mailman (input) for mailman id 210055;
 Fri, 15 Oct 2021 09:49:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbJqL-0004u6-7C
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:49:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 217f509a-11ef-4de1-ada6-6dd28b3bbaff;
 Fri, 15 Oct 2021 09:49:35 +0000 (UTC)
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
X-Inumbo-ID: 217f509a-11ef-4de1-ada6-6dd28b3bbaff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634291375;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SIkgIASlfSkqjS+gLvXwnBuUOj4B3sLNfYc2MyBFnxc=;
  b=WaSoi/7LCdjtM7BPl1pG4GyeVvwKwbx/M02RSm/xVOU+qk1LWcC4mF9R
   XRisEb5HzXLiXcbCxveOJmQx0hKuTWucO+rRnbJcJ+eL/SHrHBTG52yPW
   YOPOQnJb1iJ+qtNQrI2yDLSrek1XHyUCtLpCBwS7V6g8WLciwoIAnlMyi
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I+tspSi9GQrP0fA0L0GLpR17a8BP/spomo72hD/hL05EttME/FZDUf5EZHzEcYQm+LMRVTgndr
 calYYnbMAUBlXhJMe4DXXyExwUUv/lx32u9rFvuxgNyjpe2c5ezFt/Hs2fdYfFDBcWhS7rbr7k
 Omk1gvJu0o/5LoTEH6t3V+LaD55omXIDXCFCLfv5Qj5mpHno4FrkW7JpokU18Uo8MutoHCg6jn
 zUF2hoCDYiigOLPC9f4BQlWIicoKBDDhfHnGA3TxxiQNaAtS1abQdmm0I5wnbsrWWHtZDFI3ge
 /NmGLoS++m5itXVEBj948GIk
X-SBRS: 5.1
X-MesageID: 55303274
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9xtCz6zT6fkuzh3linZ6t+eYwSrEfRIJ4+MujC+fZmUNrF6WrkUHz
 WAWCDjQM/qONmemKNElPtyy8UtXvZPUyNMxTABoqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dk2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/4sy
 vZ0rLbhcB8kOKzog/s9dyZ6FhgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIFh29r3J8SdRrYT
 5EeWwA3VgnPWDZSH0wwDZwllb6Jv3aqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW66/prjVu71mEVThoMWjOTufCkjmauVtQZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0cddKD/cz7g3L76PO+huYHUANVDsHY9sj3Oc3Wj4Cx
 lKPh8nuBzFkrPuSU331y1uPhWrsY25PdzZEPHJaC1teizX+nG0tpjySTPVaCYTkt8X4HzDU2
 C+qiBccgoxG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f3sQaDvJ6sOK7cFwPb5
 CFVxKBy+chXVcnV/BFhVtnhC11ACxytCzbbnUJ0V6co8zCg6hZPlqgBvWkgei+F3isCEAIFg
 XM/WysNu/e/31PwNMebhr5d7exxkMAM8vy/B5jpgiJmOMQZSeN+1HgGibSs927silMwtqo0J
 I2Wd82hZV5DV/87lmHsHLpEgeV1rszb+Y81bcump/hA+eHGDEN5tJ9faAfeBgzHxPLsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBgba0aX/d/L7bZSiI/QTlJI6aIndsJJtw094wIx7yg1
 izsBSdlJK/X2CSvxfOiMSs4NtsCnP9X8BoGAMDbFQ32hiZ5ON3xsf53mlleVeBPydGPBMVcF
 pEtU86BHu5OWnLA/TEcZoP6t4tsaFKgggfmAsZvSGJXk0dIS1Ob99n6UBHo8SVSXCO7udFn+
 ++r1x/BQIpFTANnVZ6EZPWqxlK3nH4chOMtABeYfogNIB3hoNpwNij8rv4rOMVQex/N8SSXi
 lSNChACqOiT/4JsqIvVhbqJppuCGvdlGhYIBHHS6Lu7bHGI/meqzYJafvyPeDTRCDH99Km4P
 L0HxPDgKvwX2l1NttMkQbpsyKs/4frppqNbkVs4TCmaMQzzB+o5cHec3MRJuqlc/ZNjuFO7C
 hCV591XGbSVI8e5QlQfExUoM7aY3vYOlziMsflseBfm5DV69aasWFlJO0XekzRUKbZ4Pd93w
 eolv8JKuQWzhgBzb4SDhyFQsW+NMmYBQ+MssZRDWN3njQ8iy1djZ53AC3CpvMHTOosUakR6c
 CWJgKfihqhHwhuQenU+InHBwO5BiMlcoxtN1lIDewyEl9etaiXbB/GNHeDbljho8yg=
IronPort-HdrOrdr: A9a23:BYeiT6mJ0Dl3DupugAu/D/qZs8DpDfOximdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOdOEYbmIK/PoSgjPIa+rIqePvmMvD6Ja8vhUdPT2CKZsQlDuRYjzrbHGeLzM2fKbReq
 Dsgfau8FGbCAsqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72weBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlFXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbdrmGuhHjLkV1RUsZmRtixZJGbDfqFCgL3a79FupgE786NCr/Zv2Uvp9/oGOtB5Dq
 r/Q+JVfBwndL5jUUtHPpZyfSKAMB26ffv9ChPgHb3ZLtBzB5vske+93Fxn3pDhRHQ3pKFC76
 gpFmko7FIPRw==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55303274"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+vVdV/1pepwjo6raDik3KnFPO61x8rA+b/hIfDJSfwGBldYltgEAZZkH7JJyfsklJMnqjG1H/8S5YexH4c8r11w9pLbyP9G7SzoAWYh9EY2NE2IWOjI4PF1jysAmRV98UjFEFWVp6WTZ1QSXqi80mA7hcs7itFMMPq5+j6EeeWxjwJU2FUW05imTd2XQfbeIviBweeCnoxdHs/mJf131g3komvggwZgNoepRilDnLCBMnpbFa4PWOHBP4bqW1rv5+z0NJlNB1ej9HxXuWyO9daUDzw1m3+NFJPWl+PXHjUFAsKuPWApvwUAOFxJ4EI2VurrtWBs7f0iOGrxO/3alQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVEuiwYQwnseWpjmazVcr598DjTpv7Cf9Z3K7ZXzXiA=;
 b=PtuIsN/Lv6OpQ3Se0ybF0U6T5aOFp8anuQrkHZv5HIc3+7U5u8LKu6EN5vPP27jV+zV+oIHUsXiC4kGLx1dMzeuItgjgqSI5eTt9mpfMLOiuZSn9IOnwDOdmbcvJhP2vH+dFIc1KAY494KXtqDGZa8qdcE1E8oDhsrtXgFozhkw3EyK4RD7glG0cltRiGXvUv96RfhspIGo5ouC/vKuyQaiZ7GisVRUn/HhEOK0VB1X9Bj6AVOSyh60O3gWizB0exDH6d+0QnYOUuClsTXlCYeRDJS2UEAzkrf6hA72mEL3z97uz4K3aiDPM/Mdd08eJblIth/PSlntUKd8CRBWh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVEuiwYQwnseWpjmazVcr598DjTpv7Cf9Z3K7ZXzXiA=;
 b=a02EbU8ov2dUeN62JYhqQzpKMquhGZvXpAd1p31GJXCOKNQbYdt4IbAvm+cExdFWqsunNaEFZNG9QG2SPUp1oD4L6Vm/o88ZQ2tmmP9uMfomfCcOvq8NxYoRUnxEhtkma3KGMfU7PGCg/eorjIp7FDsB9JAs7c/AhatM6/ukPw0=
Date: Fri, 15 Oct 2021 11:49:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ian Jackson
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Message-ID: <YWlOlK82Ko4Yfydw@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
 <6C71E132-0A78-4DA4-AA52-E62833912145@arm.com>
 <8a7d1370-ee58-8e95-efea-8e4162e1e5f7@suse.com>
 <152124C4-9A34-4F5B-B6C5-CBCC6A175665@arm.com>
 <9f0f8e0b-c989-d2ae-39eb-6784446fa6c3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f0f8e0b-c989-d2ae-39eb-6784446fa6c3@suse.com>
X-ClientProxiedBy: LO2P265CA0428.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea4675e-8ca2-4939-0530-08d98fc10b3e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4762C984AA0238FE7F9A5F098FB99@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TV9sDthe1GIbbd7QET+H6qzidtRZAjNRHNZ4/paTIPzeGguYMCBuYxeQen3PVy6P5PhBieEVWhaeB1GVfDgxhe4Gv6Gh0FmUjQswVH8RaUkU5XCOvRAYP4eC4TOByflsjWzSmuvwsat8vwQURA5VDcVnY2dFgTBfTlLrOaz2MYzPPiOsUSLewGNbdNN33Vf3Q70xoydM8A7c0cNl6ruDd9pvovOa460vc83IVTruRMP9Dpxn8B2G9865fH+T2/h0MQpi6pb1BEuhUdIAQnWiSX+AUVeqsXgln7D3PlAc+RsLZAZnO17PV95JmDqPVbcZ9TBB+mJPogFzMXE7Fd473G5X+LIuuXtXfSiAD3QPdAIiEirMPiCo2aPz/bvnA0nakAvEX0EgOedmNH0vl+mRZvwM2KooixLqTGqc84YfCA9r5JkFQc2bcJS3uhVIANjJ6Suoc0mxllEwjc2d5ZBCJ9EomkLXk9KpZDO2wfhsOWnjGE8bDt8BSiwibzIAcXUER/4znjeP5WTcKwzRCypJvg6QIguCUulKChxjyp8Db8klPIp4sOtZcVUECxOxzdmLVQN9A98Q20SLAaI1ctCmVu+YABAVM6jgbGKBvLi6oRoWIKe24k5v5atfgpFiZ9vsy1gtvnz2CCb9mS29qoeQpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(82960400001)(86362001)(4326008)(316002)(8676002)(5660300002)(508600001)(26005)(66946007)(9686003)(66556008)(6486002)(54906003)(6496006)(66476007)(83380400001)(186003)(8936002)(38100700002)(6666004)(85182001)(2906002)(956004)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWQzdnhURitRSFNtVWZhR3lzZlVyOXFlOG15VVVHaXV1NTBGbnhOaythVGta?=
 =?utf-8?B?eG9lL1NYWTljbGFIRTlyL0hqZEN0ckJiSEwvOWo3a3dSNElITU00WDAyWXNx?=
 =?utf-8?B?Rzd0dXgrNTJIZ25JTE9jcUhBWkxKbzdrSFJEMVpKeVc4aS9GVDhxdEowVnZj?=
 =?utf-8?B?THk0STNyMjNQTUVqQ1B2OXkxbFdHSVNoY2tjR25xekorWVo4OXpMRk8zWk5z?=
 =?utf-8?B?OXBhTnZ3TU5HM2d1L3ROQ1N1ZHcyVk92cVJLczZwSWNaQTFjKzh5Z3ZzYXlR?=
 =?utf-8?B?NTdBSGpTQmtOaU5HZ1lqdVZuQkNRN3YvdnN2eG9RT1ZYNVg2TG1xSi80YWFw?=
 =?utf-8?B?bW5ISHVwRzBlMHV2eWJmekRVZGZFYkkyYUtwQXo5RTdoUDdONGtsUFdEZGI4?=
 =?utf-8?B?b3hqWTFWTVlJUUE3RE9lcWdpS3E4ZFpVNUZSRVpnc0hpazRvcVFvdnlYdndL?=
 =?utf-8?B?c2M1T3V5OFNMQ0RMeXVYZ1Q4eHdKQi9ieTlBWFhJSUEydVpuSjNycU0zcFRV?=
 =?utf-8?B?QkpqMFlPTW8rRXBzaGdKZjhOTk1DbkNYMjVadXhEK3R2ZDgyNEdCUkNqZmlm?=
 =?utf-8?B?Q1NKNWM1VVZ2ZUk2VFZweVJNWjQ4YUM2STd3VHhQKzlsYTQvckFFbjROQjhM?=
 =?utf-8?B?cjdkdHczYW1zV1FDNkdaaHJGNUlFdUxmbTFkd0RTNFViaC9PRU55bWEwVThU?=
 =?utf-8?B?aVFhWDRXZ28wTWp2Qkh6dTZzdnU0VFJ0SjdsRHNEQmlVek4wQ0x2OXc2cDJ2?=
 =?utf-8?B?T3F6NXJJUVRsb3hBZTg1T1NNS293Tk1YcVJJV1NZYk5lOEE5bk1DeGZDSkZ6?=
 =?utf-8?B?U1p5NE12YSt2bWhudHVKT01xdm9nLzhLR0lSOE5kVWFkOExTL1E5V2lHZTR6?=
 =?utf-8?B?K0JMRDhLY3JVT1lNM2FsU0UrRitNVUNEZFhib09hZjk0a0RkOWs5Z29QUzJ6?=
 =?utf-8?B?ekJQQmFmSytCSlJ2aXFRS3ZEVUd0Vk5zeTFubGxEdjNRYkRJenRTMUJEeWs1?=
 =?utf-8?B?RTFHMmVjRitUWS9uMmloU2diSWZuOVFVUkR5cVQ2SStZQlVYd01wQWVXMDVI?=
 =?utf-8?B?VDVPQ1pscXV0eG9VdEdiUWMyb24yTCtFK0tNcU9MMEl0T3U0bkFFY2tBL29q?=
 =?utf-8?B?TzlBSUxQczdKYytSRWkzVTZvcHVkTFBueXMrS0RGbENYTlNKV0RtMWJCNFNj?=
 =?utf-8?B?ZjFlT1dDeFBCNDUrakdJRktaaUtqaUhNcDI5VTZqMTdPeUxvbTlEMmo4NStJ?=
 =?utf-8?B?cmE1TVRLTmcxeEJINzlyZ0NVVnlGcWFEbGhycnlPNDhXN0owZGpuejFja1ZY?=
 =?utf-8?B?Q0lTZGdna1VSVWhnVUlSYTEyOVVscTNNWmhYQVNGTUNHVFdteWg0UE1hVmhk?=
 =?utf-8?B?TVRRY0g2NzdDNklXVHluMkppR1VSK2I2U29vM0xtNkpPQW81ZVFUTWVxdTZ0?=
 =?utf-8?B?WjRaeHpzLzBTL1h6enQvRTRkWG9ZUXI4Z0pYaUFBeE1URmtZVDFDdWluSW8r?=
 =?utf-8?B?Vm5mb21GZjdIU1ZBN2tXd0V1MWNUVm03VElIK3dDNUFoVjBkeE1sVkprL1Bw?=
 =?utf-8?B?MWN3d2krajlKNGpLWHhmZFhBVUhTVGY1dEl5VGtCeVdOZ2RwMkNiT3BUZlYw?=
 =?utf-8?B?Z005RWhzekxhaWlnUTdPRWFYTkhxemhINlBrTkgxaHd6N21GK2MxUTJaeFJ0?=
 =?utf-8?B?TDd1MWdJZ2cyNm9GUGVnMGYvY3JEYXgvU285aVJUazk5aEFSY1Z0OHBBd21W?=
 =?utf-8?Q?O471Wzro32b5Pfxj3iZ6XGNaBm5xPmdLuTFhb6e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea4675e-8ca2-4939-0530-08d98fc10b3e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 09:49:13.1770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA3bXFQrrA/8j90Mp3zGAcRkywgGqWMMupHXxHS8l/uJ/IVrDYAAg9nZEkNC24Ry1ztA04YFnU7uu7wEEIyLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 10:13:24AM +0200, Jan Beulich wrote:
> On 15.10.2021 09:37, Bertrand Marquis wrote:
> >> On 15 Oct 2021, at 07:29, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 14.10.2021 19:09, Bertrand Marquis wrote:
> >>>> On 14 Oct 2021, at 17:06, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 14.10.2021 16:49, Bertrand Marquis wrote:
> >>>>> @@ -305,7 +291,7 @@ static int vpci_portio_read(const struct hvm_io_handler *handler,
> >>>>>
> >>>>>    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
> >>>>>
> >>>>> -    if ( !vpci_access_allowed(reg, size) )
> >>>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
> >>>>>        return X86EMUL_OKAY;
> >>>>>
> >>>>>    *data = vpci_read(sbdf, reg, size);
> >>>>> @@ -335,7 +321,7 @@ static int vpci_portio_write(const struct hvm_io_handler *handler,
> >>>>>
> >>>>>    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
> >>>>>
> >>>>> -    if ( !vpci_access_allowed(reg, size) )
> >>>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
> >>>>>        return X86EMUL_OKAY;
> >>>>>
> >>>>>    vpci_write(sbdf, reg, size, data);
> >>>>
> >>>> Why would port I/O functions call an ECAM helper? And in how far is
> >>>> that helper actually ECAM-specific?
> >>>
> >>> The function was global before.
> >>
> >> I'm not objecting to the function being global, but to the "ecam" in
> >> its name.
> > 
> > Adding ecam in the name was a request from Roger.
> > This is just a consequence of this.
> 
> Roger - did you have in mind the uses here when asking for the addition
> of "ecam"?

I didn't realize it was also used by the IO ports accessors. Strictly
speaking 64bit accesses (lenght == 8) shouldn't be possible/allowed
from IO ports, but that's a red herring.

Thanks, Roger.

