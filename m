Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2DC6C2F90
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512323.792259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZaw-0007YZ-2e; Tue, 21 Mar 2023 10:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512323.792259; Tue, 21 Mar 2023 10:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZav-0007VV-Vv; Tue, 21 Mar 2023 10:51:57 +0000
Received: by outflank-mailman (input) for mailman id 512323;
 Tue, 21 Mar 2023 10:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peZau-0007VP-SR
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:51:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 636fa344-c7d6-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 11:51:54 +0100 (CET)
Received: from mail-bn8nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 06:51:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6871.namprd03.prod.outlook.com (2603:10b6:510:168::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:51:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:51:37 +0000
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
X-Inumbo-ID: 636fa344-c7d6-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679395914;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4vslB0tTKMsZlt6+hf3BpgdH/Ju4JrT4X+OEl1YRGmE=;
  b=Pl7qDt3ZOr4GIZ5pJhJ4PYWtSzU3XE2haSOnFJpMrAbcyLj+J4U7ic2c
   be1eCpme3MVX0sf0ZgX+YOTWvA5OLtVb2JI27odHZ4AD3kra8PnHxU5K6
   PQRLA6kBHzX02ItbSIy67529iLaDu9+6WOQ47fykK4o3bNT2Jr6qfLRRg
   M=;
X-IronPort-RemoteIP: 104.47.74.46
X-IronPort-MID: 104101751
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b6dXt6wG9TyE1UEyLld6t+c+xirEfRIJ4+MujC+fZmUNrF6WrkUPy
 GsbCmGEaf7bNmrycoonYIW+8RsF75WGnNFhGwFo/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6kT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTkX5
 9kTdCgAVUqkpeGT5pObR8p1pst2eaEHPKtH0p1h5RfwKK56BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDSVkFIZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjBNtKTeLlr5aGhnXPm1ZNJww2SWGaqKLhl23jA4JjB
 FELr39GQa8asRbDosPGdxyjqX+HvxhZV99RD/crwBCEzKbZ80CDGwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRutPQAFIGlEYjULJSMH7MPku5oblQ/UQ5BoF6vdpt//FCz0w
 juKhDMjnLhVhskOv4254FTGjjSEtpXPCAkv6W3/RXm55wl0YIqkYY2A6lXB6/tEaoGDQTGpo
 HEBktO28OMKAJeChSGJBu4KGdmB7veeOTzYiHZlHoUt+jqg/XKuZ8Zb5zQWDF9xM9wPcDvga
 lL7swJN6JJdMX2mYLUxaIW0Y+wo0K6mE93mX/LVa9NmY55teQvB9yZrDWaT0n7slg4wkKg5E
 ZadbcuoS30dDMxPxTC7Q+AAyrg17jgi3m7YWIr60wXh2r2bDEN5Up8AOVqKK+o/vKWNpV2J9
 84Fb5fUjRJCTOf5fy/bt5YJKkwHJmQ6ApawrNFLcumEIUxtH2RJ5+Lt/I7NsrdNx8x9/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:fUBB66nRG11mAsPJLSZFL/uO7o7pDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="104101751"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kks2GbL/NCXvSl4mWY5/YGwe1chpJcNv0ndbDcHD26P6Rlfg718E9Yka2zYNsmpkisV2fT1z8PTAOd3uE8Xo+jo6b7ySeqDVTPRF2p6qP26RdA6q9kHpOSFntEdRDrdLKx1++6aI9aKSnDSCl9kD2V0CViSBr6gwawSmr/Nhr1+s0Wx20FVkvVWNq0zD6GF3J9n66aFesi3EntNBU6BI0sb5ZSvuynourJ1yduQ2x0JjNcLoJq7dpPV/Ti+zAl93OPR4tD5PKhPXIKW/MNgR0ePNK/FBh0nXwph7Yim8wCIsDiN5GIXykbMm34JNB0qMSCl07p/2KxtwrcGc7qlFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuO4yvFDd0U8oYpY90zXZiyXZhPKJMpiGHyQ7KKGbzs=;
 b=L+ZIFN+HasQMCKm23HbjdQKvOETTkFgKmfmkyBlN0pfVB+ddUveGu1I9obp/kcUMZMi9lr3AKWgVH36Zn+pZOnP+YyuGZUUNwdzkLcclj3PAViW1Jrsjh7Rex5QG4kjVm6xekpdVFR9dN+1QZYdlf6P8U7QWWvZ119ndVY9z3HTrvvvymuM66nLPqJlVcUpgpPK2KdVhWYXVk+4oJ9qrnUChEAbEal+XjHHG0KpnYKatNlr2oLhlVNs0xWlahVO9DUEpohRdIgjO/61aJ9VoIfeBlo/vvtU1uVRChFMUkMaEkwH7geYcdpow0brr6j30Hp99soJoyjyAy381503Zuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuO4yvFDd0U8oYpY90zXZiyXZhPKJMpiGHyQ7KKGbzs=;
 b=IJU6iQkEPFZVH5Vt4qz2xVSS7/pKwm26Og+yG6Qo1LqRT8Fsg4Q5E/c//OFkc4HzOftrkk03hZ14sKoJuURjtlFFbyx+f3Gg6w7b64mGST/qt4v2Ts6L6uV85j0Jqwx+d9/Qmmeaq7OZ6NAxUk2q0iWGYWiCLUkHP1cLI4qSg2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <61f94060-010d-2b28-d947-e5790d6d57e6@citrix.com>
Date: Tue, 21 Mar 2023 10:51:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v4] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-GB
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>
References: <1d3e2081fba9a1ce07c3e2a28eddcd6f51d52854.1679348946.git.isaikin-dmitry@yandex.ru>
In-Reply-To: <1d3e2081fba9a1ce07c3e2a28eddcd6f51d52854.1679348946.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: cbeb3ced-c12f-4bb0-1a2f-08db29fa3e9d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JPKpK1Y5O+bHHWp7d+ZXH44Ou0NPfrqrcDocD33WoDXTA2/AqH9n056YDPQF/3iKlSYDDKQSuNm+x+JyuIGYY4cgu0YSq7TQl0/GPMHuNMghs6vu4sN1PLJf8cMyd1hNgD8FJIxlW1PRO39E7b1p2p3ZpeIpuJDM0ABW6GJSzPqa2/iUCJR/rwLtsgDJE6kyCoyx2RxNQt23x8kxfVmctndFe3vJw6TXzp7puUXasAlxw00jCnDEM8sh6zcVjCUHe582r/Q2K06S347HXpWFekUzVyxGKpzsjcFlXWJBPQfWelUFQaiwYMo7sMTWEJ+uDPsBGnH41bPHiiReIi+ylWX513GtU6/YmlA9RJYXyS+TFc31UtkQynHChrRkh4020wPom/dygakhLCYtPtSZOHsk/0VDZfDuwWJccYQyS83uHIWKHNJcaU3n8hzyFHitViishbVACXNXnhNDXgb+brcyOAGlFilCnNXUH0XHOVNVxDXogtC9d8eCh6PhtEOWiTxa6T2MlaDJvV5mSifBhWQaDuUpsQax09xYFc6/WfR11FFZVPiBobjK5U9c/TI2QRtOrM0dGDgtqjdf/p7biEk0VDbkNZV7YhsAc3u0x6cx1WtvdTzLSPHMm08aPXTx0d7zjwYl+OgCEGiWfXZT0yVne/c5cKcj4pidU1JB4+se2hULgL+DsU4OxsjcZYGEQ07wTqAG9wsM4OHDLac9pU62DZq0FjptRD2vXyzCjNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199018)(31686004)(2616005)(54906003)(83380400001)(478600001)(6512007)(6486002)(6506007)(7416002)(316002)(966005)(26005)(5660300002)(53546011)(6666004)(186003)(31696002)(86362001)(38100700002)(82960400001)(2906002)(66946007)(41300700001)(4326008)(8676002)(8936002)(66476007)(66556008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnU2dnBZa2hDam9VeXN1OUpTdWFiTkkyVHQrNUg5SlR1L0grQkxST1kwdW1u?=
 =?utf-8?B?bEVMZlBkMVVrR3BKWkw1Lys2eFRRZmZhZ1V1b1VpU2dyOWxVTmRTV0ZkTUtp?=
 =?utf-8?B?VVBqMm5uZWtsRllXMGdiblFYQkNFeWc3YWZqRDdDN3NpQUNzK3BpUU44bEd0?=
 =?utf-8?B?TVpvYW82RHJPWDR5akszL0diOTgrbWJIZHR4czd5ZDFmUXFuSmZvSzlrRGUx?=
 =?utf-8?B?dmRObVV4N2M2VWtDbWdVbFZnUjFsR20vWFZycDNkd2RZSndWM1B2WXNXSnpD?=
 =?utf-8?B?dGxJK3phK2syU283MTZGNFkvSG5sWmQyOTFnZXZMZWVTNzBIcWRPOW16bmo5?=
 =?utf-8?B?TENNTkdzV3BERXY0SWhBYUpKbmNmeHpGamxtWlJwMDRmUExrRFZHNWJwajlC?=
 =?utf-8?B?NGYwanNlQ1c1Q01VWjd1TjR2VElJTUF5U1Erdm5DL0w2Vmdtb1c2VHJXeEVS?=
 =?utf-8?B?Tmd6dWVHQ0RzdlE1cEY3THU1U1FLVXorbmdlcVRIZnY0TGF4WlZybXRPWkd3?=
 =?utf-8?B?NlFNNzd6VDg3aWhUbGcyVWtJVWpwWjNobnZiM2JFTWRYQVY2MHJRUFZESWFv?=
 =?utf-8?B?QUtKOTN5MmhRMzA1YXlvc3RQNEpCNXRrMFM3VFhvZnVYRG9QdFhpTngxTjVl?=
 =?utf-8?B?YVVzV1RmVGhMZkNmUnBTb2dFWkNNeTFuSFhOcndHWmpMRFhpQ0gxVHB2N0JK?=
 =?utf-8?B?Y3BqbHZpWmVRalA0YlJNQ0pUZ0p5MWs4ZEdpRVdEcEJ4MmZ0M1JzODNiMVhm?=
 =?utf-8?B?ZnRCV3E2T3VOazU5UGFrWkwvemhsaUdqbHI0UUFVaG95ZzRIMi9wYlFZWEtv?=
 =?utf-8?B?M0FXTzJrVkZPbGNEd0YxL0tqYWxFYWY3U0FQUkM2eVdtM24ycitvRndlT3pa?=
 =?utf-8?B?d25icUN0M2dIMHNwemhlS0xaS3Z1SFBNUXBQVWZ0RFlqZDkyYzVMNHhyQWVz?=
 =?utf-8?B?UlVmbk1OQkhKWXkxNEZhcEJhZ2hicUNDMWhCY0FWdFUwOHIweFpwS2tqUGJj?=
 =?utf-8?B?UGoxT3NFU0EyWDVzTVN2UjZvUWJKaGlVOERQSmpCQW9UZnhCcGt4cVcvdTJh?=
 =?utf-8?B?b2duRU1rVEtjM1N3UTZySVJnNTdsbmJRdERUQ2lxQTE1UndRZWZLUnowQUIv?=
 =?utf-8?B?QzY5Q0ZXb29GVVdWOG92Mkl1UUNZcmZHRVFZWXVuamwyMGxDMDgrKzNRMHB1?=
 =?utf-8?B?MnN4THVMN0gzRldhQWJ5bUZqODBOMHZ2RldnTldZZ1l3TUNjY3RFUGVTYndK?=
 =?utf-8?B?c2RaZHh4RzdNYUZCM3JIWjIyVUR2WGx3T214MXVyY040b2Zqc0Q0WmxKMFlS?=
 =?utf-8?B?cmNyT0lZYWZ0SHFtbTZiT21YR2Q2MFJDRWNXSjQ3WEhNRkFFcmFRb3FuZHNm?=
 =?utf-8?B?MXhMVHRhWS9GakpMNHRsUGJESG5rcFRMWnh0c0pHcTBxUkpEaGxGM0gwSG9R?=
 =?utf-8?B?a2lINzJONVJoL0lCK2NRSjBib1I5c0xXczBTcHN5WWJ6cUxjU20vaEEzazk1?=
 =?utf-8?B?d3BpMGl1WXJoUlBIdXBhcldaYVV2TVNIYnl1OEJISTRsaEoyaVhxRFJaOUVO?=
 =?utf-8?B?U2psQ1VrdHE2OU5yWDJrekNiRGs1R09vUkprSkxCZzZ1cDNEMjJVZ2Mraklx?=
 =?utf-8?B?UlNhcTFpMi9oWDlNRWxINUt0VkZrQS9IMWFHNjNXRXBOakFVS3hzZFJaeUV5?=
 =?utf-8?B?ZWJjNzl1bS9mVzlZc2Y1SWhYUGtPeW5Ncjd6cmg4OVFwODBtQVdTdEtFYWpY?=
 =?utf-8?B?UXQyMkpvSDB4alRZOFRSbjV6M2Q1clFBOEY1ZSt4Z05JOFM0aCtKaHkzRzha?=
 =?utf-8?B?Q0ExNGswZ1BUUTFjbU42Z2pkSDRLS1lVMVNlWDlLYVFkS3pWYUlUUjBrOFhW?=
 =?utf-8?B?eTc5dTJRMFFVRDl0NU1VNlNoWXFySEF2MVhraFlhN3pmMWgyT3BRUXQrUDhC?=
 =?utf-8?B?T2FUS3JyWU5XSE5aUUJlNG0zNTFjL1ltTGhkbDBJaGhCMWFoTGw1d1FPQ1FQ?=
 =?utf-8?B?Szg2VlVRZHB1VTNFdTFEQXFvSEg3ZkZEKzI0SFBxcUR0S3A3T09TMFFpRURY?=
 =?utf-8?B?Q0Q0ekJtSGcvNzFPMXVSYU5YdlVybnUwVGh3Z2M2UU51eVlUaURHR1R4ai9t?=
 =?utf-8?B?SHczR3RWZGlhN1BtRS9aejhnemo3M3BzSmRYZEJ1OVY2UjBWNEEzQndramJn?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?bG56VGJ2M25jejUzYTd0S2tCNGVFeEdaZGxXUUNuS01SbU0vWng2QXpqald2?=
 =?utf-8?B?SXE0dDBLRG42WUkybkpVaEc0OHRPMWRCZm04cGo4UUYyeWdDWkZma3FGRi81?=
 =?utf-8?B?MFFWZ21IWStLc0duckZTcGhkR1dLUHBJNE5Dd1RKUHFMY054REFDUkE1dDRS?=
 =?utf-8?B?V2JQYjB4TE01VnBwN0JPRGtPY09FTnNXTllUOFNzd2pzUWxwM0FWOENhWkFl?=
 =?utf-8?B?R3dhTWJYSHpPMkFWZWwzeFVQMGJKMVBVK1BnK003TTRoTEhwVXJMRWg0Q0ZR?=
 =?utf-8?B?M0YvQjhvZm02ZmY3UDdqKzFuYWh2cm03VVJWNzFRSThzNVRWOU1EL0FQZ1pJ?=
 =?utf-8?B?M3ZVK1podzhSZWs5WDYwVWwwTy94a3p2V09GNXh3K0ZmUmpiNkJFcnBTVmg5?=
 =?utf-8?B?aCsvNkxKN2hzWGJzTHBVWEluT2d5U3BYemVyZ20vL3ZpWkFTeWJlaXF0ZUFq?=
 =?utf-8?B?UmVjQm9WNUI0c1N4dWNnSEdpdFk2REw4NHhxd3NmTTlMSXJad05uYzdGTUcv?=
 =?utf-8?B?bm1qY3hHUUFsbWpDZHl2RFE2Z3QySDZyNjNiUGxEd2ZrMVRuOWR4M0pmZEZI?=
 =?utf-8?B?LzRqVDdrYjVUaUJOdGNxM1N4SkJTMVE5eEVBL0xhbldlUU9NZ0NseDdCQ054?=
 =?utf-8?B?aEJWSUs4NHExQTVsSzBQWEZkY2VBZThwSmZvcVdyNXN2M2M5Tm5MQ2laZU1Z?=
 =?utf-8?B?WG0vT3BSL1puTGRnMzVCY2ZwRjZDZ3RYb3JZQklmellBQW9YOGdZeGs3S0Fx?=
 =?utf-8?B?cmJOUDdPVi93Y2g2ajdTOHRIQjZDVE9SS1h2a1Q0RHdZN0xhZFZUUkhzSlM5?=
 =?utf-8?B?N084dkNtZzZMSVZpZUFCaXdRYU9yVEpaV3NpNXlGdnU3YjhLM1J2K2RkWWlB?=
 =?utf-8?B?L3hTTHd2WjFBd09uVTloQklKOTR0OGd0bUUwdjcrVVJUVGYxajJvYWt0cmQ0?=
 =?utf-8?B?SWY1amhLLy9iK0wwa3M2M2xINzkrZkpmQjFkeWJwbk9YY3A2YTcrWGxPWDNK?=
 =?utf-8?B?T0QzSUZZZkErTmdMNVprUElxbitVZm85RkNHV0FVSU5YK2FrL1IvR2V2c1dz?=
 =?utf-8?B?akpwd1FWNEFGM3JucGpiMkpndkx6QUc4RW5zQld1eldWaXhLMitxUXI0b2xW?=
 =?utf-8?B?dnFRN1JvaGpZdjJTbTVyR0hRei9rbUdnMm9vZGx5cXdLVDE5RjhGTXEyQ2Uy?=
 =?utf-8?B?cHlTS1k3OHZ5WTZjTTRsSXZIaFp5cXBIVm5OUXRaUkd1YU1qQUJPRE9ScW8w?=
 =?utf-8?B?c2J4NHBuZ1N5SWtoMmR6RWFMTTlpRU00aTNXQzNIQTFKVGRrckJMd1ZLL0VF?=
 =?utf-8?B?Rk8zRGE4NEdCS0dwbjVZeWE0NDM0b3ZycytyLzJ5RWZwVWJiSmJPb05XNTd5?=
 =?utf-8?B?OW5JRk5sS1gzR2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeb3ced-c12f-4bb0-1a2f-08db29fa3e9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 10:51:37.4915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yed3D46V7qc8S6m7qEq8jNsWXk5mFHeETJXeg8l9eiwz2jxEXcNETRh3kPRVQJJlhusQU9xsWHh5c87MsZXlhp8UuXnTc8v/d6LbGO6tR+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6871

On 20/03/2023 9:56 pm, Dmitry Isaykin wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 00b531f76c..0b7a302928 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4560,8 +4560,24 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          break;
>  
>      case EXIT_REASON_IO_INSTRUCTION:
> +    {
> +        unsigned int port, bytes;
> +        bool in, str;
> +        int rc;
> +
>          __vmread(EXIT_QUALIFICATION, &exit_qualification);
> -        if ( exit_qualification & 0x10 )
> +
> +        port = (exit_qualification >> 16) & 0xFFFF;
> +        bytes = (exit_qualification & 0x07) + 1;
> +        in = (exit_qualification & 0x08);
> +        str = (exit_qualification & 0x10);
> +        rc = hvm_monitor_io(port, bytes, in, str);
> +        if ( rc < 0 )
> +            goto exit_and_crash;
> +        if ( rc )
> +            break;
> +
> +        if ( str )
>          {
>              /* INS, OUTS */
>              if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
> @@ -4570,13 +4586,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          else
>          {
>              /* IN, OUT */
> -            uint16_t port = (exit_qualification >> 16) & 0xFFFF;
> -            int bytes = (exit_qualification & 0x07) + 1;
> -            int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
> -            if ( handle_pio(port, bytes, dir) )
> +            if ( handle_pio(port, bytes, in ? IOREQ_READ : IOREQ_WRITE) )
>                  update_guest_eip(); /* Safe: IN, OUT */
>          }
>          break;
> +    }

Sorry for the delay.  I've got the Intel side sorted now too with
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=f71f8e95c34fedb0d9ae21a100bfa9f012543abf

The rebase is:

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 78ac9ece6ff2..7233e805a905 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4578,6 +4578,14 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         __vmread(EXIT_QUALIFICATION, &io_qual.raw);
         bytes = io_qual.size + 1;
 
+        rc = hvm_monitor_io(io_qual.port, bytes,
+                            io_qual.in ? IOREQ_READ : IOREQ_WRITE,
+                            io_qual.str);
+        if ( rc < 0 )
+            goto exit_and_crash;
+        if ( rc )
+            break;
+
         if ( io_qual.str )
         {
             if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )


~Andrew

