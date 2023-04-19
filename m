Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04516E7D7E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523548.813693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9BO-0002VX-6D; Wed, 19 Apr 2023 14:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523548.813693; Wed, 19 Apr 2023 14:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9BO-0002Sx-35; Wed, 19 Apr 2023 14:53:18 +0000
Received: by outflank-mailman (input) for mailman id 523548;
 Wed, 19 Apr 2023 14:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDf1=AK=citrix.com=prvs=466cd93b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pp9BM-0002Sr-PL
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:53:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e870c41a-dec1-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 16:53:14 +0200 (CEST)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 10:53:11 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5834.namprd03.prod.outlook.com (2603:10b6:806:f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:53:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 14:53:08 +0000
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
X-Inumbo-ID: e870c41a-dec1-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681915994;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9Lf9L4TIjuPLV+y9efo4rR+Ke087A6RoihdoNsBV/0g=;
  b=PQABCnRSFyj1B0KMPwsStfPU30yY7OGP+ag3nIbxTA45VnBwNLN9hq9g
   zYJdvL+JPK1R6oNFxw/wBs9h4pHSceWaRRcONjh/c7JoJw4M3Id4Ju83Q
   43VfAYBr4wCwZNiZUJlUSsWbm4IkhjIPMtBTBqAWkX0u7vVqtuoedjOKx
   s=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 106011074
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LUbaCayoc2nmoh89QCt6t+fyxyrEfRIJ4+MujC+fZmUNrF6WrkUFn
 2EdWzzVb/eMYmCgLohzPoiy8RtTsJTTmoNjTFM/+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiPKET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXhSy
 vMXFhdSVTvdruXv6aO2SMJAoMt2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANxKTeTgqaICbFu74DIWOCUERQCA+7qf02exZYt6N
 mEO5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOt8gwXzUmk
 ECIm9DBAiZmu7mYD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65uAZAhn1y
 jGO6S0h3bMaiJZX073hpA+YxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:2LfDEKhBhc2sqgRhvr49CyIJG3BQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqKRIdcK+7Scu9qB/nm6KdgrN8AV7BZmnbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-Talos-CUID: 9a23:1yXf6m+YG5J3AvOIPgqVv1cIJc8qTFqC91yOCkjhIHdkSpa5b1DFrQ==
X-Talos-MUID: 9a23:Fs/4SwkrR74cyqeDATZsdnpEasJY27a+U3tX0rNfksa6bAltFi2C2WE=
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="106011074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGiZ0TSar0WaTJQG40V+jqU9MMIQwWQCmaALvVZjHoCt0NnfeTcQ/kLi6CGWN76sqA7/BquGmVxSOQi5iIB4qoSwabtEHUXZ3JvUEn6+rmR9vnWtt6deuiLRhRpJ37XNNyQ8wIHhpIzICV1r25EptBiyl1CkDJ0WNmcexdrgDY8B++unATVTJY/gPhu6wJD8cqaYTulWoaEqZUiBzdolAW5MNWguo7PAVY/VVvR5yFigGVKUFLF8JHwO8YReXL9CLvz9iH0mYfQqEclIF3dnklD6fwNG5ijGK3hIVe/ufgNjs684+GrIToZ+JLp/AlAlnLIW4d1wFCGXTWwWEANPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h70u+VLgZRoQxgBmEQPvknYZq19eftvXA1PiiZMl9Lw=;
 b=d+6W18auxZ7nbqKB7bXwHyxtPAhVzBUNEkLOSYo4CI4LmuPEMXgnKsxAHaJ7adZWkQvJES76fpr01MOcrY0trQRtu4xBfRaf1tExpqLVTVcW6Fjz1lakwoUFBBMwGTaDDjN2fr7d95MfqVkPZYHmBpFg4oGq3KyCWL9LjLex5C8HTZQEYZhNAqGVWBrwFE3Kzm1A09hxBGlsLBbsdLlueh75aBzjbiziyf8iJpjiG58cLwRgAd+UDv5FzQlS9+0XlYgT99ivOaJ4REAOEZ5hDBqzl66BZ603EQ2kYzE3RjEC6S13UlcagbzvWGUwDzRDn5Bp8p80kPJGKR2RFjt9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h70u+VLgZRoQxgBmEQPvknYZq19eftvXA1PiiZMl9Lw=;
 b=BE8e94n7o4U/NCRyxy8dJSg3b9ekQpaMSYee3ylb37CEEf2b0CSukB5z6faDwqAPYYTyN4qk+RWF/Brg/yJU/nZmpn33lkcpQQOXj7FxeCVaIs4oUZ9Xi9IVo62GroIAFqUvYpPBFQFnohjQYunYIfPpVxTaONn/fEm2D6usVtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dc2bb5fe-f440-74ed-5e3e-caed9ca626f0@citrix.com>
Date: Wed, 19 Apr 2023 15:53:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230418111032.487587-1-andrew.cooper3@citrix.com>
 <c2693ac0-4f6a-83ae-c477-75b3f05b938a@citrix.com>
 <226fba6c-aeca-d38b-7d47-07b2f8d6b403@citrix.com>
 <b81f6d44-080a-10fa-3148-67aa23504561@suse.com>
In-Reply-To: <b81f6d44-080a-10fa-3148-67aa23504561@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: d51df30b-2385-4c76-2dbc-08db40e5c98d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hl6OhJd+KGB26nRoZIKDmXfgJUWakEAr3W4RB+gUGMIFj21U/mDuf1jzyWA6q8lsAP+BKclzN0OpIVktKRViTjlYFMH11E35hnx7qG7XNwY/Ej0/3sZMtqu/wjfqJWFRv3VZM2Mdib3nt0AZ2M0S9m9H0P2VoeYmUpF4w2OzHDAv8EUNnG3AoDI0YY2PSmOpzczTeE8O2xtmUVtpf/YQkgPOzGSuK19dzaiBBElQfGX+4FfR/JGRxN3/bNODspvJ6gGVxNmoEXs5lpEfUx/LHeZCtyGbBFv/Vs9C7t0WB8brAdUqvStgSZcTrPEHg4QQST3eXPYoweGDfRMNr/s35u1HRRAgpTkA0G4u2fL96dGjDD095dmjHRY2vfqkkSwEdDoPCV7DN+xX72l7SU/fbifdHPwoFEGNtXT/+pYhCAwyhVwV8MAJ1Ax7RaqHPXg1rB9dGGef6h3bUPYZqU8iacvKeJ5aqZ5kQp24X1jdwQIDFmHRTa8sgaoZ8u1J2hCS8lY8aajFnOjx1EbbvSrWZMeJoj1IfgS+Upo103grCp22CzwnY4k/GkTHl3vp/OJY6OIhqMmb1hyQniM+FluLGjtRqLx+sgTduYd9idtvRSo9oSJPg/8enP8o0IccwTmg6qQw+VvqIOEL+mHlrDDVbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(8936002)(38100700002)(36756003)(8676002)(2906002)(86362001)(31696002)(5660300002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(2616005)(6506007)(53546011)(66946007)(66476007)(6512007)(26005)(316002)(82960400001)(6916009)(83380400001)(66556008)(41300700001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3R5TDVpSGhzYm9zZ2NZV2J0RFlkSGwzcUR0dUZqSTRrYVF5cTMxbzZlbmtU?=
 =?utf-8?B?TEpjdCtseUljSU9mb1doVUZQdWw0TjU5RTdpUmFNY1JWb0V4b0pVVExRUkVa?=
 =?utf-8?B?cExSS295bjBFQUx1bEtqU0FRTllYOTRPUm9tUzl2anpxRWEwaklRR2RQOFpN?=
 =?utf-8?B?TURaSHUxUzAwYTRPNHlJTExmaWdmUE1HTDJOOEdHRERpdmdpRml3REpPUWls?=
 =?utf-8?B?dFB1cmErejJaTzZkS3RCY1BqYXhsRWJVU2xObXg5aHhqYjdNcHFoUk1FNGtG?=
 =?utf-8?B?UE4wSnhUSGo0NWhGK045Zm02T003c2dpY0ZOSDhXSG1NMCttNWI2dnEyT1hH?=
 =?utf-8?B?Z0dRVlNSdkhBTmFGck5rN2k1U3VsRTV0ckIxWTNsc0NnWGhBb3hkeklQdWJi?=
 =?utf-8?B?UW1HSC9DTVFpbUsrN2RSUFNNQ3FmRmJiTTZFZmR5Vk9WaUw5TjRjTGVId0d0?=
 =?utf-8?B?UWdSckZxSWpXbnlqS3VFM0UwckNodGpyaFBQQ3BHcDlPWXZwQlVQZU1yb2Z2?=
 =?utf-8?B?cFRYOTQ1NjlJR2c0bWhIUC82TEs0TUZRSmhOeHFwekVLS0JxNERiSE84dXkw?=
 =?utf-8?B?M1lJclY2aHkxRFN0b2tSSDZSWXRrRm1qb1BzNVJPa0JqSTJteWw2a1VzcFNu?=
 =?utf-8?B?Zk9LMzhsNldzdnNpNGM0ZURPbCtNOHRpYitsdllkaDdUdlFXUlNLOHlOZjBy?=
 =?utf-8?B?RHUyaEl6Q1JEUzdoS0UvWDNTallNUXlHRUZIN1hjczdLWEVSNElHcG8rT094?=
 =?utf-8?B?N3dSaldCY1RMRGZwb2ZEYWd3bVJHLzBYQ2RRbnVmSjZUVytQZmxJeWhJY0di?=
 =?utf-8?B?V3dRREhIczVxV3U5MFlxdmUzWnZjQ3krbmRudVJPNmgxcExoV0pTdEo2YVQz?=
 =?utf-8?B?YzA4YURuaE4vcWNFYW1zV3dMeHZoRTBDNlBkWEgxYVdFRmVsd0ZoaGNlbDcy?=
 =?utf-8?B?OG9NMGhLZk9XRGZZZVJzZE1QckRuTnRIQUpEdnpISk9OYktEMFc3VktQRXl4?=
 =?utf-8?B?YzBPNG9UTUU2bXBoM01EOXNvakcyeFp2dDhDMVZxM3hzTmxjUWloaHFpMXdT?=
 =?utf-8?B?bnBzSW11N3k2eUpoMEhKdjdYMDFwR2FkS25wWVd2R1BrNVUxR2ZGUnVRbEZl?=
 =?utf-8?B?NEk3ZGR0ZUpsRzd4cVNkR24xUk1PcmpndUhHdStYTk1jcWQzOU5VbjFxNTR0?=
 =?utf-8?B?aWpsMXlMTUdadGpyMlFCWURLK3dtdVlKcG1xUHdvdWNYYW4xMXppOS8wbk5y?=
 =?utf-8?B?c1JucUhVS1JJNjk5VnBwSk5OaFNHdzI0K3JPR0pZSkt3TElEaXExRXR3VFNt?=
 =?utf-8?B?dGFUQ0E1WXlUdTQ4SkJEYWMyS0JMMmFBSkNTOUR2S3NuS3BnVFBpUUlKYThy?=
 =?utf-8?B?L2c4NzVGZUFnUlVaejBVZ2pKUGRTV1lXajF5aS9XL3p5UmRnNElUd3U3UkdB?=
 =?utf-8?B?cFF6OGxsWUVPVmdBQ1ZzZm01ZXpISzhkUGdQKzlDNjlNcFJJVGZlWi9Eek1x?=
 =?utf-8?B?cnkwZEwrWTMxZmRxLzYxU3dkOW94bGwvK2kzVnJicUtkYWNVMytxd2MwdG9K?=
 =?utf-8?B?NlVBZXlxeW91Y29UcVZlZ3lBa003elJZWUlUcVptUVU1WWJkWnVuNUpFYlJV?=
 =?utf-8?B?aEZrbGhPcDlDS2h5YVhwZnhEZWxET1c2TXNOUndOclpUeThMb25DZlUxRmdo?=
 =?utf-8?B?WTQvMnIrV0dYWTYxaFpHN1BMUjdMQlNMdFA3aFAybVJFVVZraW1qNFZhTk5B?=
 =?utf-8?B?Z3BwWWxzb0tQTTY0aStxeWZ2ck9EVmxobjhMWTNDUldML09Xa0Z0dTAvUS9s?=
 =?utf-8?B?SWdSSjFyeTB5NnMvMEdtWUc2MllMK1ltaUJoV2NqVmMzaFBuSVlVMEtMYzFB?=
 =?utf-8?B?aHdPUHRyMzgrTktkczhqSEdjU3VzR2I2TkFoRGwxa0Q2UkQzM3gvUWd2UWR0?=
 =?utf-8?B?d1JxTFVyUEw2RmwzY1dNS1NBKy9aZldOQnJ6a1JyZFJqSjd6dlRlNjY2aFdL?=
 =?utf-8?B?WllkdTJKUlA5d0UvVkcwdmFxRzFxekI2VURra1owNEhzWCszMW03K1Q5N2FF?=
 =?utf-8?B?WjFkRjhhV1h5aVdGdThkSkJWaUkvTnhiallmUzMrS2t3VkdMZGluK3h4YVl6?=
 =?utf-8?B?QTFyWE55U1QrRkpPZ2NpY1FiNjQ1eHBWTm94R0dPczhWQnFmdjV1ZUJkRDYw?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lj2NHQMMjxY+PiPtjMhhGGTXga2PzOB3MHmgmePgqhjoUM2U1dpPskKs+6lpmmAYVab/vHeQVXY5cu/QQ5Q4sRUWuYQ8EzgccBM6dkNzCmrl9W5b5sLtTKPRhD0eNVDBl/87ETZhJSdnpd5zRMbL4BJK+58fikDDXpFF60p9jRVYIZ3E/DlusBPOJlLABmFFzOkPb/lTXflXACJ/9T7+U2UULRl5putaD6ANRYv5JL72cfDosPJ/iurjafu+QnHmFe3UmEdw5Ap5MAooC5T5EWhYTDKC18kk+kQB2vbsx/ZQOCX1Mi6TPJRnD8kfC3NXGVmEXRS6y7D6LLLLXepUcmycC+rmURP+7XEA56SZn9MeI0LNhp5sgndhRONIdjxUMMA48dbXU6GTT2G6/42OddEEydtQige6tftxQsVtPy+XJKcT7yMfNDD/DxUkLRxob78YU7bzgW3GlKjXXnT3OsZcU80rO0PXSRBtDmlggKs9ZnS302XoY4mIY19ML/wlANRsDn7qhBJ2VeurVk6b0seZYY/2SkccBtSLBkRX1+1ipBP9ZN7VrNoakdRkLvwhRsmROs/4z7cNOdvkmA3yogsPkvAAq1if9H9R/PPtHB5O8cRIycLKL70ORif82p7D9uUuDfO9+wWcTiSIN29VEiX50w5ogrgOSLRt34fKoRLYfqqC9+mo58fk6waDv4ZCdcgBstjxcEifmWvqiIUSn46xyAV4FDZYcKdyX7stxlTw+Y1mXnIE+a2X3Pb+22k9RySoNz7SEQZeynPK8KKpd11C8La7BZfyiqQ72QtlHJLZJGDoXJPR6UnA8AxgkjPmxk972oTA6Do+A/LS80hik3kbcQFOSHoTALYYQHHvOPY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51df30b-2385-4c76-2dbc-08db40e5c98d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:53:07.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFtLM3M68hwUrAMs2JaHsjaj5M1YYtuE9wclEf4hGh1MV8VU2BRysq0cOmuTrZmMeZlsfE96BIleqaoKjzCXbfEmYI1qvHvBFrtUi8ziq7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5834

On 19/04/2023 7:41 am, Jan Beulich wrote:
> On 18.04.2023 19:54, Andrew Cooper wrote:
>> On 18/04/2023 6:30 pm, Andrew Cooper wrote:
>>> On 18/04/2023 12:10 pm, Andrew Cooper wrote:
>>>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>>>> index 36a07ef77eae..98529215ddec 100644
>>>> @@ -5879,6 +5880,75 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>>>  }
>>>>  
>>>> +/*
>>>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>>>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>>>> + * responsibility of the caller, and *MUST* not be introduced here.
>>>> + *
>>>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>>>> + * Must be called with present flags, and over present mappings.
>>>> + * Must be called on leaf page boundaries, i.e. s and e must not be in the
>>>> + * middle of a superpage.
>>>> + */
>>>> +void init_or_livepatch modify_xen_mappings_lite(
>>>> +    unsigned long s, unsigned long e, unsigned int _nf)
>>>> +{
>>>> +    unsigned long v = s, fm, nf;
>>>> +
>>>> +    /* Set of valid PTE bits which may be altered. */
>>>> +#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
>>>> +    fm = put_pte_flags(FLAGS_MASK);
>>>> +    nf = put_pte_flags(_nf & FLAGS_MASK);
>>>> +#undef FLAGS_MASK
>>>> +
>>>> +    ASSERT(nf & _PAGE_PRESENT);
>>>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
>>>> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
>>>> +
>>>> +    while ( v < e )
>>>> +    {
>>>> +        l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
>>>> +        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
>>>> +        unsigned int l2f = l2e_get_flags(l2e);
>>>> +
>>>> +        ASSERT(l2f & _PAGE_PRESENT);
>>>> +
>>>> +        if ( l2e_get_flags(l2e) & _PAGE_PSE )
>>>> +        {
>>>> +            ASSERT(l1_table_offset(v) == 0);
>>>> +            ASSERT(e - v >= (1UL << L2_PAGETABLE_SHIFT));
>>> On second thoughts, no.  This has just triggered in my final sanity
>>> testing before pushing.
>>>
>>> Currently debugging.
>> (XEN) livepatch: lp: Applying 1 functions
>> (XEN) *** ML (ffff82d040200000, ffff82d0403b4000, 0x163)
>> (XEN)   l2t[001] SP: 000000009f4001a1->000000009f4001e3  (v
>> ffff82d040200000, e ffff82d0403b4000)
>> (XEN) hi_func: Hi! (called 1 times)
>> (XEN) Hook executing.
>> (XEN) *** ML (ffff82d040200000, ffff82d0403b4000, 0x121)
>> (XEN)   l2t[001] SP: 000000009f4001e3->000000009f4001a1  (v
>> ffff82d040200000, e ffff82d0403b4000)
>> (XEN) livepatch: module metadata:
>>
>> When Xen is using forced 2M alignment, the virtual_region entry for
>> .text isn't aligned up to the end of the region.
>>
>> So the final bullet point is actually wrong.  I'm going to relax it to
>> say that it is the callers responsibility to make sure that bad things
>> don't happen if s or e are in the middle of a superpage, because I'm not
>> changing how virtual_region works to satisfy this assert.
> I.e. you'll drop both assertions, not just the one added recently?

Yes, I dropped both.  I didn't think it was reasonable to keep one but
not the other.

~Andrew

