Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D045C4289C0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205599.360958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrjc-0002aj-Rb; Mon, 11 Oct 2021 09:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205599.360958; Mon, 11 Oct 2021 09:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrjc-0002Xa-Mx; Mon, 11 Oct 2021 09:36:40 +0000
Received: by outflank-mailman (input) for mailman id 205599;
 Mon, 11 Oct 2021 09:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZrjb-0002XM-Af
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:36:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb36f369-2a76-11ec-80d2-12813bfff9fa;
 Mon, 11 Oct 2021 09:36:38 +0000 (UTC)
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
X-Inumbo-ID: bb36f369-2a76-11ec-80d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633944998;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8oYnSQASnE692X/4zab7SEyteYJXwkCKrqzyWv9SmVc=;
  b=L+ykvX+VgGnUwTbzUgGyXkfExQkHGHJqdYX8uJqs4+ZjcHFCOizTQ50I
   Zk2Q6re8gsX0aYdauveIH3DitpH10MdPDjwLxUnwMILz1BsKu893Pv7Fn
   bGkzzN+N9bvCW6VNT6G3nCrq/bRu7z6QXH0yNVMc9OhhSIGORg+Rj7m6q
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rYCD38Q+h/qYXvJp8YeMfRp4yaVAzHAsNU8i8ZKBezsLcrowyxyicontAu9rJMoWab4WsBdHZB
 srMEdRfZhSmGwDjD+UGXj7VrhxE4T69G83jSnoWUAN4aioYLcEB7IfINiaCqSgPo+64J4ZmxxJ
 ZZvy30ysePmLb3LlZ7vJtSw8+xkV6TGl4hIg4QWgssFtneGZPn8vux/BbsdmCuBsU8PTI78ukl
 q8B4KzD9Dpq12wujtueRiNHebE3ZwPJC9Vmcb7JXwcTiDbmRSfKmrDfQx/5FBwK41uH/fdFEgR
 nYHTs4/HWBS3aoBzEKFKHcI1
X-SBRS: 5.1
X-MesageID: 54892491
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:P4KL86qPtk2P+spdIQEF6dkp1cJeBmJFYxIvgKrLsJaIsI4StFCzt
 garIBmBaPaPZWH1ft1zaNm38RwDuceGxtBhTgc9qSgxFyMR9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncXgFSQofZHDo6M6aDVbKgxRGY5Iw6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0STaeEO
 5tAAdZpRCbxPToUA2dONJIVubuIuHagTBdShk3A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZUh1mUyn0WGQchf1KxqvmkiWazQ9tab
 UcT/0IGoaEs+WSxQ9L6Xhn+p2SL1jYeRt5RHusS+AyLjK3O7G6xB3cGZi5MbsQ8s807TiBs0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIM5gw/LT91jOLWoldCzEjb1q
 xiVqAAuirNVitQEv5hX5nie3Wjq/MKQCFdouEOHBQpJ8z+Veqb8N9CL6Bvn4s0HC721TWCsk
 1wnlfOBubVm4Y62qASBR+AEHbeM7vmDMSHBjVMHI6TN5whB6Fb4ItgOuGAWyFNBd59eI2ewM
 RC7VRZ5vccLZBOXgblLj5Vd4ijA5ZPrEsj5TbjqZ95Kb4kZmOSvrXw2OxD4M4wAliERfUAD1
 XWzLZbE4ZUyU/0PIN+KqwE1i+JDKscWnzK7eHwD5077uYdynVbMIVv/DHOAb/oi8ISPqxjP/
 tBUOqOikksEC72vOnaOqNJNdjjmyETX47it8aS7kcbZc2Jb9JwJUaeNkdvNhaQ090iqqgs41
 i7kARIJoLYOrXbGNR+LehhehEDHBv5CQYYAFXV0Zz6AgiF7Ca72tft3X8ZnLNEPqb04pdYpH
 qZtRil1KqkWItgx029GNseVQU0LXEnDuD9iyAL8OGJhIMU6G1CQkjImFyO2nBQz4uOMnZJWi
 5Wr1x/BQIpFQAJnDc3Mb+mowU/3tn8Y8N+elWOXSjWKUEmzooVsNQLrifo7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpESyTPVSmA79tOFec2sxLuvEfz7NVo1LuC
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCIupeiJS0RfORWImRdxFrotPdN32
 /olte4X9xe71kggPOGZg30G7G+LNHEBDfkq78lIHI/xhwM34VheepiAWDTu6ZSCZtgQYEknJ
 jiY2PjLi7hGnxeQdnMyET7G3PZHhIRIsxdPlQdQK1OMk9vDp/k2wBwOrmhnElULlk1Kg7BpJ
 2xmF0xpPqHfrT5nif9KU32oBwwcVgaS/Vb8ygdRmWDUJ6Vyurch8IHp1T6xwX0k
IronPort-HdrOrdr: A9a23:NBXfmqo2pBq6plvsnUaNk5caV5uwL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHK9JbjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 xoWp4Y4Y2mdfVmHp6VMt1xNvdfOla9MS4kD1jiU2gPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54892491"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbWSV7XKBzXf6Idm3hG8ucN3ic5Mq/rcRRYVcikJVNVPrmDMzEZZtL94N30e1SLLRGSDWNppr//8jtcVkAzBjEqugdLOGO5iSjO9PiVxDR66uV2b+cn0Tzo1SPj05gKy+GvwyYx3JIQORA4necOb3b0md17D1RSgQqYvGlftxV6mVPec3Tcay3YDE4F9wawVqAPnBRR07Nm2YID6J5rcmFea0fktMuuMQwwU0c45otluS378MmGm8L3NyzsYOE5hj4PI5ZRae8eBkk9kQd8IIipUINysp1GEd5vzuxOgLf0z4D/+yJyk7vLNsRdzmpwmp1qF2TaYNykoEXSk3GOFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLTaF30ZkxvE+d+CBtqBT0O7KfyZLu145KDxRJ+XJkM=;
 b=JdJsHjYXvbFidH+T/oH4m+aijH/XhImsL5pt1Z0lmtetI4DbyAnrQXOr8ovzr/l9zHFSTi2CtXogbQlozjNm1mdA/ca/uqpH9r7EGjmEQDyxT/EFn8IcQZaGeWkrKpsKKPcMBNI2vxh9+Xs+tQ86rV3yVqKTqxD1OXLVa7CBtv6xC8IKSk0GglUapEmz+4H/9dICDoDtAe6TSur1nhjukDild4eRLvUByCwudrj1sciVtGkYKffJZxWvaFySeOd/J6NJgJSoJVzSB3j/habQQ1otoNK+GmYmfNbxrLR2mXdaixUsH44voEBS+19lZEwuUYt5V4jdUrHE9KJ+S/dvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLTaF30ZkxvE+d+CBtqBT0O7KfyZLu145KDxRJ+XJkM=;
 b=eFDkX+jyUGhPLlVO8sY0ap1XcPIqy2v1qrAFrFLzIfyIXr0DqYiK97hfQWoMt9JhfJVr4kdBrlruA+uvljH2GjlV1i3E1tJCEZOtGwQyqn0oqYTcS51VoI0Ah8HxXMtgsGUA5YnICSCHmMZAk0uFb+DobEL9FZud6E7LmqeffOw=
Date: Mon, 11 Oct 2021 11:36:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
Message-ID: <YWQFj70MRWHEeOd8@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
X-ClientProxiedBy: LO3P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1672a772-477d-42ad-0124-08d98c9a951b
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3481586151AB069E9113E2338FB59@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: doSvl5BN1iFB48DRYPpl6uldCzFx0JtSU2Ue8k41SkL+bDHUK7yuAl0wa5d7Q4ydIBN3x/w6O5bWaEFmso9c6QbBkSIjl2NPJ736HEslahp9lKj4abuxoqTTwzVGyMHN7aexo0SH5RlQtQgjZci5hyLp407ArSHdJ9FMVUVzhp+TkTMw/cqIo/KzuVgD0g7RsxYe6l5Mat/TaZMY2ulbN2uJuTRdvp186rPlzWNrzDBd3ThqsJyP+e5Aam6WTOHt558FMFn/BDTeT033PXd3hoZi3/UUCoiqlC0X1s2DRRmO5vFL0ukyuLUfUNFp/VmahvUwcgOe7eKS8iHq07v5GBuewU4aztmFa9obo31Vmy0M3yCEvCCRR5lGAb+1kmY1X38yYUNTmxLOBl1e9jlRbsDK/4MU+S1V3yi/zkHy+VGy/GwotrIwX9sjMfjat6My2cXClKUyznt+HMvyacAKAkeiIQWQghgLLGVmJBU9KxynBFdRtZ24jEA4HGCj4mVer4NHBI7DZ+UkhofJz3P3TtpCobpRskVbMuSL6J28Z6bh0tlRlDs1SeH8yFAahAawLudvaB6zP3fmtG8w16TBlIayLfOhsvUXCFl/gTpKiouPqs70uWgUkgM6v2S7LrMGiUnu1GExRyQSoKXVPz1ZEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(186003)(38100700002)(85182001)(9686003)(26005)(54906003)(86362001)(6496006)(6916009)(956004)(83380400001)(316002)(508600001)(6666004)(6486002)(4326008)(66556008)(66476007)(5660300002)(66946007)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FmVC9LTXBUQ0w4NVVIY1hXbFpZMGZ6VnpDL20rZlFRWWp3RkRXbHM1TVpN?=
 =?utf-8?B?S2VNc1NUNzlDdjU3Mm1UQ0RuUGdZYm9xL0FERE9vTUMyN3BUMWZBbFM4QTJI?=
 =?utf-8?B?eTNxMFdYUXJHMk5UTzhUQk9FcXdITXdQYXcxRnROZVlXZ2hvMlBPdUU0MXlo?=
 =?utf-8?B?bmIvZlE0R0tQYTlqUW56RWVZTUFXY1ZGTkYyU0tseC85VkhPbkxpVWxyQ1FH?=
 =?utf-8?B?aTFlZFRZZlU2aXdtZXVKc085S3NCUnZjTktGci81ZDlHV1d2elVkOVZCakZp?=
 =?utf-8?B?OFNZKzV0ZVZnSCsrMDB5ZXVEMVlSWlc5SDFIMlZaU3poQkJzZUpRazdzeUNN?=
 =?utf-8?B?QzBUSFJSeG9sL2lSRXAwTVdzQWN3Ni9BRkJKTVJ1b1lkTnEwOXFSL3RzUndq?=
 =?utf-8?B?NGEvaC85RklTcVRtRHFnODR4SHRSdCtocWRMY0pCaXhidkpmSTVTWFZHc1dt?=
 =?utf-8?B?MU5WWUlyaXAzZlNzVTNyd1VjSWt1WUtiQmZSSC84UWUrbDRpWXpNa0xRcDcv?=
 =?utf-8?B?aStSaXNDaVM1MXZxRWMraEJTMmw2RGJHRkNEYnBXMUtoblMxNE01bC9iVDNq?=
 =?utf-8?B?UkJxZVFzN1ZucnRPMGp4UHpqaG1icE1ZTDF3cUZFNDFiWm1pUVVEOHlLSnhH?=
 =?utf-8?B?MDJrRHFzaTRkZE93cXgraksyOE9TM3I1c2I5akFzYVk5c1dlblBUUTc3SURJ?=
 =?utf-8?B?RTN4eERsaVhYeUo4RFZIQjBJNzJqeXh3dkwzbHF0dTcyc3R2WlJQOFczSS9u?=
 =?utf-8?B?UkJhY1ZvUlE4MTJiZzlHTUdrTmEwYm85M1lRN3g1K2M3Qk9TaXZXSERZRWJw?=
 =?utf-8?B?U0MwbjA3WUJEZ1BOdW4xM3V5MDM5VEcxOHdMcmovZEVMK1ZkTUVxRjBaY3Z0?=
 =?utf-8?B?WDZ1UVJjbng0aXZ2Z1Vqc2xoNUFNMzJjWkFta0F5YmxWaEJJWVJPeHYvUjZH?=
 =?utf-8?B?RCtRWUNVaWZ1U2czb0o4VU45Y1BKUW01cjZzVDRxWFdtUWNYK1VjcS9DaTFY?=
 =?utf-8?B?VDJxQ0VINmNTSTdLekI1QllybTZabjNHUjluY0ZMKzZISzlaR2FIMzhNQlV6?=
 =?utf-8?B?RVdJbjJFU1BUT3NVRnlGK1FMbjVpY0hycTJqdloyWHI0bm5vUm1GQWY0aVZq?=
 =?utf-8?B?R2t0b0h6bWUrMTBGSm90TGNOL1hxVlZxY0huWGlqZmdWSDdWVzBmSld2ZXBV?=
 =?utf-8?B?M2FuWkIvRDZGVzdqZTE5RldvcEUyWUVodkdsQTJGS0g0Nm5GSHRWZ2RBeWlH?=
 =?utf-8?B?YTQ1d2dZOUh1UmVWL2dFMWpPRHRQZ1UyZDh4KzRIa2ZFMW9CY2gxOW9jV0RG?=
 =?utf-8?B?RDZtY2NCM2NPY2R1MVNTMHVoN0REeTFmcHJUVzNteVdvdWpaM09lSXVkcHhD?=
 =?utf-8?B?eG5mQ2tiV0tWS29TYXZPeDJXL0JNcDZhVWNraWJELytPVkZGMlNwTkFSd1pP?=
 =?utf-8?B?ZW5ya1NHNnIwS0tuS1F4eDBwMDQ3bEU0c252VVFWOEhEWTRacXJGMHJYcHVN?=
 =?utf-8?B?NWVkQjBCanN5Q0YzQW4zY0lkZEtMbVFBdFBzdnFEUzdINEYxcGVCL1N0Y3A5?=
 =?utf-8?B?eERTb2ttWTZpa1hoR3FmNGJINzNoVTJ3MWhnbDV0dC9hN1U0dldTeEwvQmxI?=
 =?utf-8?B?Y29TcHI3elhTajF4NlMxaWpGR2NBeDBLSTMwSEZNVzQyNVJDekUwVkZPeGYx?=
 =?utf-8?B?aEw4akNPUkhXdmxXR0dpZ3l5UnFLVk1WbEVpOUhYaW5LZ05GNHpnYks3WTJp?=
 =?utf-8?Q?tUMOBd/lmyWNEWH+bszQLjMOJVBHqKzkCTpkP6Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1672a772-477d-42ad-0124-08d98c9a951b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 09:36:20.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMGmDvHWwfqBFJowZWWEMmVVwNFXQpDJXRssww9n1IkXzMdCKVnQQ4o4eGXz9MpTI2I/9kjGvLYnu0ny8r0u0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

On Wed, Sep 22, 2021 at 10:21:17AM +0200, Roger Pau Monne wrote:
> Hello,
> 
> First patch on the series is a trivial change to xenconsoled in order to
> use xenforeignmemory stable library in order to map the shared console
> ring instead of the unstable libxc interface. It's reviewed and ready to
> go in.
> 
> Patches 2 and 3 allow setting the host wide command line `gnttab` option
> on a per domain basis. That means selecting the max allowed grant table
> version and whether transitive grants are allowed.
> 
> The last 3 patches attempt to implement support for creating guests
> without a grant table. This requires some changes to xenstored in order
> to partially support guests without a valid ring interface, as the lack
> of grant table will prevent C xenstored from mapping the shared ring.
> Note this is not an issue for Ocaml xenstored, as it still uses the
> foreign memory interface to map the shared ring, and thus won't notice
> the lack of grant table support on the domain.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (6):
>   tools/console: use xenforeigmemory to map console ring
>   gnttab: allow setting max version per-domain
>   gnttab: allow per-domain control over transitive grants

Ping? The two patches above didn't get any review in either v1 or v2.

Patch #1 should be ready to go in AFAICT.

Thanks, Roger.

