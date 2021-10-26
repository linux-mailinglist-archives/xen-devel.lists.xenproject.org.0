Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5694643B0B6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216377.375961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfKCO-00081z-KN; Tue, 26 Oct 2021 11:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216377.375961; Tue, 26 Oct 2021 11:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfKCO-0007zP-HJ; Tue, 26 Oct 2021 11:00:56 +0000
Received: by outflank-mailman (input) for mailman id 216377;
 Tue, 26 Oct 2021 11:00:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfKCM-0007zJ-DH
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 11:00:54 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbbb948c-364b-11ec-842c-12813bfff9fa;
 Tue, 26 Oct 2021 11:00:52 +0000 (UTC)
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
X-Inumbo-ID: fbbb948c-364b-11ec-842c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635246052;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=r0R0FOF+jwvH0mml2ZlwQr1EkJmUnyjPKk6jHtzeQgk=;
  b=KabP234CcODJtyRKxsUcAP1g6Q/nUbOmedn29ihy9s6qWDqKMZL92EYu
   T/5EPPHOkEbrsmkvQaI3B4kz3+GMAM6F0TimkJFtIpE9hZ/Uo3qtlYWPt
   7p03JffSrKK2h3pRRJ6GQLMwMcvArntBRdLrvo+n3dP8op/t/tLOlvoXV
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OfF6JIVv5o287GeB8weKut8Wuqj3WiwXQiWL6xe67Cig4QkxIW34x5Io4cGzsrmtUIaGHDO7pV
 Ymu0LBrMgEkfGU66MAMaIzW5t8kh+HTvcE/TC/jPsPooWUUzSMvgRiQ5o1Xmg7DUXZYu0ebCOt
 T2KHJ10VdM3eZQFJFgjE3RM7yDLjQ/WHG0TcYtvATVP5dQvjIuZMDdrhywNFiVFmZzZN8v4R2N
 deGysvMJtELUDgrGsuvaZU+Ja/YS75/Leb3cGBDC0VcAfi2e7Ansinbize7CPNv/jtjdAgEOR0
 tq5aYFeF1+ZLOE+912qGQpGg
X-SBRS: 5.1
X-MesageID: 55622557
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cNFtjqoqZKsAtRXzvOF08RBlhsxeBmIgYxIvgKrLsJaIsI4StFCzt
 garIBmOPfeINGT8Kdh1Pd/k8ktQ657WndNjGwRu/npmESMapJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaXrYwIOO/fHo8JDXiFSDCEiJ5dW+6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0TQ6yEO
 pdGAdZpRE36biwSHF4YMsIRlc2hr2j7Kj5ok03A8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2AmlqujOLSmSLwWKoJCaa1sPVthTW773YPBRghcEq0qPi0lGazQ9tab
 UcT/0IGqKk59EWvCN7nTRC8iHeeu1gXXN84O+o+5QKWw6zY+TGQAGQeUyVBY9wrsswxbTEy3
 1rPlNTsbRR1ub2ITTSG97GbrRu7Iy1TJmgHDQcGUA8E7t/LsIw1yBXVQb5LAKOzy9H4Bzz06
 zSLtzQlwaUei9YR0Ke29kyBhCijzrDASAIvvF2PBkqq6wp4YMiuYInAwUbc6fFMPYOIVG6Lt
 XIPm9WdxO0WBJTLnyuIKM0KGLyq/P+DPCfrnU90H5Ih+jKu/FauZYlVpjp5IS9BKd0YcDXkZ
 EvSvwJ555JJOnauK6htbOqM598ClPa6U46/D7aNM4QIMsMZmBK7ED9GXBW62kfoykMXt/8yA
 Z2EcZq2N2YZFvEypNapfNs13bguzyE44GrcQ5Hn0hiquYajiG6ppaQtawTWMLhohE+QiECMq
 YwHbprVo/lKeLSmOnG/zGIFEbwdwZHX77jNoMtLavXLHANiHGwwYxM66eJ8I9I790i5e+Ghw
 51cZqO64Aag7ZEkAV/TApyGVF8Idc0nxU/XxQR2YT6VN4ELOO5DFps3eZotZqUA/+d+1/NyR
 PRtU5zeWakWGmSeqmVNPMiVQGlemPOD3lrmAsZYSGJnI84Iq/Lho4eMkvTTGNkmUXPs6JpWT
 0yI3QLHW5sTLzmO/+6NAM9DO2iZ5CBH8MorBhOgCoAKJC3Erdg7QwSs36RfC5xddn3+Ks6yi
 l/+7eEw/rKW/efYMbDh2Mi5kmteO7EuQhYDRDKLs+3e2Ouz1jPL/LKsmd2gJFj1fGj15L+jd
 aNSyfT9O+cAh1FEr8x3FLMD8E70z4CHS2Zywls2EXPVQU6sD788cHCK0dMW7v9Gx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577bA09cCAaB1X5GJ7xvPYJ7n
 ep44JwK6xaygwYBO8qdinwG7HyFK3ENCv11tpwTDILxpBAsz1VOPc7VBiPsucndYNRQKEg6Z
 DSTgfOa1bhbw0PDdVs1FGTMgrUB1chf5kgSwQZbdVqTm9fDivsm5zFr8Gw6HlZP0xFK8+NvI
 Ww3ZUd7ErqDomVzj89ZUmHyRwwYXE+F+lb8wkcinXHCSxX6TXTEKWAwNLrf/E0d9G4ALDFX8
 KvBlTTgWDfuOsrwwjEzSQhurPm6FY598QjLmcaGGcWZHsZlPWq50/H2PWdY+QH6Bc4RhVHco
 bg49el9XqT3KCoMrvBpEIKdz7kRFEiJKWEqrSuNJ0/V8bUwoA2P5AU=
IronPort-HdrOrdr: A9a23:HTiA66ERtHrLsosEpLqFDJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo6j3zEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfKla9CC4kY1jiaWgOKsk8SgfwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.87,182,1631592000"; 
   d="scan'208";a="55622557"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gplc+HtCLxshM0mHI1x6e6ntc7UCljEqiwMfRYgZ1hWVf/ZmO9tXjMPcpTuvCo2lLP8kHorqmdcJ0xRWO6VstnCPEAM//LjOEL2R10XAToxfO+Pma/Er+/64sFwVNHVylELHEiEdeMnVhzvZTtmXVvoyid9YWOxErx+20gnkfwpwqJoRFzEZ+lJIr8itzeTNNCBVZIp1wYmTKULFQffwe9se7JIVFu2omuo1DQZ068Btd8FUib6D+DOrhimsUYeTLJZQxc2/XA1DAi1y6K8D+khy6P6as77NliRTNUhIvJJ1EpTfIbn0APIDzr5DyMUrvl70YxFVjutpzbGv3wXoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkOaU8UtNF7BOo0Q2wWPC+OdJm4CHso6jPBfDUjbrsk=;
 b=ZvNH3Ml4ZcrNNaU+8lFWt+TspGfkqnKCjpzHzfNFOk9fGxwlNRIuKaBMZJagbSuewmm8+a3xOOAV6/WtRbS+TXRxNlq5xiDk9hUJP19o2MBDG93r1zpNrf1i7m8il1XpcxOuz86RDYwBeiMRAvulqgqm6nXD0C6SUFpF9G4GDa8LGP9hSK/enkcQCTTc7DSLE87rrnlj89LrGurJbJMdAuy9yb024vrkxGu3eNo9y2plif8Yg6UVxPYUqahbS1TjiQ2yRIUfjTzn0JDM90z1rf/eOoO2lpPXcqelY7kZ3ciQJVSEr1KhJ66tnmeqA6B8fYB2BaIPwMBfCl9pmowiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkOaU8UtNF7BOo0Q2wWPC+OdJm4CHso6jPBfDUjbrsk=;
 b=EhdHmeSJDrBkzwP5FNEDy6gTFDhBNKN071pCzRViP6Ahc2HBd9QMqSUv3UsKRG3BogjEuegr+tx9Ime5vHG/bTo/RM5vvOdfxUr/Rridxtx8q4eHXmp21dtyTqYlJ7lj7fatqQ4R5UM1ZQ2zBn+/T1Te7wmAogvZbz3uZGTt1/c=
Date: Tue, 26 Oct 2021 13:00:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 09/11] vpci/header: Reset the command register when
 adding devices
Message-ID: <YXff21oTvTm7EomE@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-10-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-10-andr2000@gmail.com>
X-ClientProxiedBy: MR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4158ff7-c888-4755-be1e-08d9986fdd6d
X-MS-TrafficTypeDiagnostic: DM4PR03MB6047:
X-Microsoft-Antispam-PRVS: <DM4PR03MB6047C2BCD6AC48F99320140E8F849@DM4PR03MB6047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9rYzEFaPiypkxxzbzTU3AUS5XvdwFI9T/XzPEArlKXk57zrZfs7FVzNdpLJfJSYQ4aYVulh1p6m8/cbzhzpMWGLa5QZ1Z00L37Zn21KB/atjB07yQcPYFb2E4HXNn2yRg4TyNNSNaUNnlgAgTB5lSULrsuWeVmKJG3MbeheMnLEnt1981HYRZjU3XgJOFqLSfV3NIuQ4j5Yg8/XMVcQO3OLN/clqXV9KUGFh+GHnDkhGudKoUJ6CqKilKEqhzWJ+6/kkt5X7Nfwy6Ii+lfOH1xJ8vybAz2Qo5IJBTSzF0/VyG87rADAdgjQXDOac7NGL2gyh7OPfeFrS5ay/xZt0IOSrJV7nPYDnCthdhTq86SoWZzpuv6+27HmRsq8OBdd2hiE1OoopSxBJO9u8G7ATOTlA3OM23F/xODQs9i7KCDIjo0gg7u9aaN0QreOxoXt6EIilDJY78xlFDBX9L7/amnDyzICJNUympPh3L2HFqEx9ug3RLBONucvz1PmDEgYGC3Dn0WvLiBbPej++hsNqQAOx5cbCLfQHSAjFRaJ2een0gW7JqwSpXh3Pii9Zq0PDpV982mj55ehRSa7i7MjIK+0H91U5rHfRfB6346WbnQ3LCB/ggpf767f31FQ1cUuK3Z0zv9a34AN+hqE69T/vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(4326008)(6916009)(26005)(66946007)(66556008)(82960400001)(508600001)(6666004)(5660300002)(2906002)(7416002)(8936002)(8676002)(956004)(6486002)(6496006)(9686003)(38100700002)(86362001)(316002)(85182001)(83380400001)(66476007)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdEUzlzbUhjdE1YdGlIcnNIcEI1ZzdmeHBMTzdTVEhHM053VDFheVNYOC9u?=
 =?utf-8?B?QWZHcUNCRWlMUElXdlBrNjIyNmZ6RlJNaEJFOGhVMG50YkJ2TUx1b1ZuZnNt?=
 =?utf-8?B?ZHE3VTlpVnpMZU14TnN1L0V1TmdaUzZuLzhlQmsvRFFCb3lKT2pyVCtZcHN4?=
 =?utf-8?B?SjArWEcrUVlpLzZjQnZSR1FudEFNbWxJbm92SkN0bmkzYko2NEtNZzFYS1p3?=
 =?utf-8?B?MjhwSEE4eTQ1eU5DbXJ2ZDVYUmdIdlRPaDM0ZWdJeUlWQnB4MXBUbkxyMHRu?=
 =?utf-8?B?UUNzTTFodVh0WHpWQzFvYXpzWTdRVEhQMGVicHVjNWRVQ1l0ZHpReGJXa2Fj?=
 =?utf-8?B?MnAwRUxvY2RUWW1aUGV5UlMzMnM1VHVxVTZuN0RiY2Ztd1lFMUR1Y09Yc2M0?=
 =?utf-8?B?emc3UlNjcEp2VmlZRVgwcTBqOCtRcXQ0TFJBVUdMVCtpVTRvNWk5K1FReGhZ?=
 =?utf-8?B?enFFS1kwalpUL3pVclNtM1hnRTJCc1dEcklSSms1NnJnRGFOYkZHZEVpajlD?=
 =?utf-8?B?RytUTUhhSlQ3cS9sT1NadE0ybG1YMElLMGMvMFZuZ3BscjZXdktNM0x4L3Mv?=
 =?utf-8?B?Rmh3TmVDVTdlOTlLa3lKQ0p1WmgvQkFmM2RCS3M0NENQZXRVTTgwck9TNmVJ?=
 =?utf-8?B?U1YxTFlMVUVXeWdJOUJnMXlzVjlxM3BUWGZnMVJobDJRNDQ1WDczekZJeDVQ?=
 =?utf-8?B?N2laWjA4djV1bTI2U1Q4SStrbWJIVXlESFB6QUoxUEVOR3c1UmZUeDFOUDhO?=
 =?utf-8?B?SWk3TXR5cmhkRGEzbzY5U0xrRm1pNXFBSXlwbHYzSVY1c2p5SktPYW5KODR1?=
 =?utf-8?B?S2M4MjhpSHFERmRxbWVqaE4zTGdhaXErUVNwUUZKbjhBdjFJM2xSYUMvSFFK?=
 =?utf-8?B?cnVEbjhMNVhuaUhuR3lhSXpTSU05RnBnT21kcWNjTDhHZEp1WURQU0hRVEpU?=
 =?utf-8?B?N3UwOHl1Q1g3cWt3UDkvZHFQajFpcUFFSmhocWNITVplTFdWRWRLUnVFQUor?=
 =?utf-8?B?bnZGRjFMdGJPZ3VYdEtoNkZFdmV5bUZ2ZVJiVG9RM1pGOXF0NHF5NWo5ZVZV?=
 =?utf-8?B?VGxEaGFRYUFGUERqejYvYUVqK25hbWp2SWpRN0lQVHdseWlOdjdsN3NVZE45?=
 =?utf-8?B?MndUVUlzT2J3R2pXRFE1SW92Y0wvN3I0WTdVOG5YQk5zS0d5YU8xeTdhQm9W?=
 =?utf-8?B?YzEwK01LU0JwWnJ3YlBLQWE5RDdSdXJpaWdOVGZLNU44OWoraHRhRE92N1Vy?=
 =?utf-8?B?TFB5YTNkZG5OMnRNY2gzVW1lZ1EwMWc1LzBjSHdOS0NlVU5HRko2cjhVYUd2?=
 =?utf-8?B?NS9HSnB2UjU3aG5rK2FpRlluWmtsMDd1SDBJT2Z5VFJrQ0RhMUdIWHE0ZVpy?=
 =?utf-8?B?R2RjMm91OTF2dWhxTVk0ZHkwMWgvS3FndXYxTmNIa3F6R0hjSjRLZjdIMlVD?=
 =?utf-8?B?VVBQdTF0Z21GWFRuT3FMT1JweWprUk1FMGcyNDF6WGV0MXh2QUhuZHhYc1g4?=
 =?utf-8?B?U0tNWHVGRTNyamFYNlN5aFlYL2Fja1h4U3ZWbm51WEtkaUlaTE0yeVVGK2dE?=
 =?utf-8?B?VXdid2VZRnMycHp5bTdxb2QwL29yU2FMa2dGT0VES1pmenVDV3ZOY3k0WVZV?=
 =?utf-8?B?OVF4VmtHUVRZeThZN0VwSmdESks0VTN4VHltM1pHdGIzT21nVkdMZnAxNDdO?=
 =?utf-8?B?eS9mb0o5ZUcrQTJUTFowcEQzUDlCVmpXWDBLWXk4d2FlTmppVlgvWVlIV3lk?=
 =?utf-8?B?elBrcjVNYTdmSDNzWG5SNU9xUTcvRkN0Z0FOZUVycCt3dmsvM0xOQ0ZkNllp?=
 =?utf-8?B?SXpacWZSMkhZNlJqeEo2d1laRmQ5YlBtZEhXTzhvV3ppN0lOOWZPdlVRWVBR?=
 =?utf-8?B?WHF0eVZUMkpnM0VObWkxcS9xa3dSSTgxaUFzaUFBZ2JrbXZWcHQxam1xZ1hj?=
 =?utf-8?B?cjVCRTRRbjlLclhyQ0x2OGJINTZ2bzdKVm4vRFN4azdCQzgyb1BkTFJSdzNo?=
 =?utf-8?B?bXR5bXVlVnRmZmxkdEJZcGR2SkpOWC9UTnZiemlheG5wS2NZdlMrNjhWMUFi?=
 =?utf-8?B?a1Z5dmM5cWRUelBUNkJEWG9EcjU3NGtobmlObGg1WjNXWlk3UmJScmREK1hC?=
 =?utf-8?B?ZS9MTkxpdzJybzZaN0JuU3R6U2lqd2ZZa1QvWFVvbGVNc3NZSnQ3dEljRjVr?=
 =?utf-8?Q?WVlDT/i5HX6QIt4uMgPYKpY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4158ff7-c888-4755-be1e-08d9986fdd6d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 11:00:47.4300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzQqWyNafj8nsDKgGnZNxnHX4ngzob3bw80rrrUBU9uoJveke0IN0pnAvqW8XNIQyyqIW13Vzsuk0j2AaeP3Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6047
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:21AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Reset the command register when passing through a PCI device:
> it is possible that when passing through a PCI device its memory
> decoding bits in the command register are already set. Thus, a
> guest OS may not write to the command register to update memory
> decoding, so guest mappings (guest's view of the BARs) are
> left not updated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Since v1:
>  - do not write 0 to the command register, but respect host settings.
> ---
>  xen/drivers/vpci/header.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 754aeb5a584f..70d911b147e1 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -451,8 +451,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> -static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> -                            uint32_t cmd, void *data)
> +static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
>  {
>      /* TODO: Add proper emulation for all bits of the command register. */
>  
> @@ -467,14 +466,20 @@ static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
>              cmd |= PCI_COMMAND_INTX_DISABLE;
>          else
>          {
> -            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
> +            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);

Either we keep reg here or we drop the parameter altogether from the
function prototype. Having one caller pass 0 while the other passing
PCI_COMMAND is confusing. The more that the parameter is now
effectively unused.

>  
>              if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
>                  cmd |= PCI_COMMAND_INTX_DISABLE;
>          }
>      }
>  
> -    cmd_write(pdev, reg, cmd, data);
> +    return cmd;
> +}
> +
> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t cmd, void *data)
> +{
> +    cmd_write(pdev, reg, emulate_cmd_reg(pdev, cmd), data);
>  }
>  
>  static void bar_write(const struct pci_dev *pdev, unsigned int reg,
> @@ -793,6 +798,10 @@ int vpci_bar_add_handlers(const struct domain *d, const struct pci_dev *pdev)
>          gdprintk(XENLOG_ERR,
>                   "%pp: failed to add BAR handlers for dom%pd: %d\n",
>                   &pdev->sbdf, d, rc);
> +
> +    /* Reset the command register with respect to host settings. */
> +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, emulate_cmd_reg(pdev, 0));

I think we likely want to unset the memory and IO decoding bits from
the command register, as the guest view of the BAR address is
currently forced to 0, and not mapped into the guest p2m.

Thanks, Roger.

