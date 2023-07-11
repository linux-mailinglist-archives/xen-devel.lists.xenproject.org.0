Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E274E9FD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561630.878081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9SG-0000KQ-RZ; Tue, 11 Jul 2023 09:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561630.878081; Tue, 11 Jul 2023 09:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9SG-0000Hu-Ov; Tue, 11 Jul 2023 09:14:44 +0000
Received: by outflank-mailman (input) for mailman id 561630;
 Tue, 11 Jul 2023 09:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9SE-0000Hl-UJ
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:14:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c697210-1fcb-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:14:40 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:14:37 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5476.namprd03.prod.outlook.com (2603:10b6:208:29b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 09:14:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:14:35 +0000
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
X-Inumbo-ID: 5c697210-1fcb-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689066880;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IO4p+DLQDhuJT3ucqtr4Iw7ZVOPThfHcZM1+E10P38k=;
  b=grkrj1VLEpkEqQWmrv4WIAlD/CcIQl434CKEMncsuYDphAg8cIV8Nq8p
   KBFEtNtnocD4ASlCdM4I2pUegiwfymZBSBApMDRfqsZ8OKIWCUIewM0PT
   kq+XDTnFowh+Yz+vZLBAceU7fWH/9g8Vc1ejhEFrdxG+pdYmg9AtmnHUf
   M=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 115820306
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5ahtmazYJVjg/Njjpal6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 2ZODW+DbP3fYWCje4p/aITnoExQvJPXzIA3SQQ5qSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKkT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWhz9
 u4SMTY9VxOGisLv7JGkQ8ZKqNt2eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVIhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aSzXmjA9pMfFG+3t87hlSdyDIzMx0bSleX5r6210iPZvsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoPSlID6ty6+YUr1EuRHpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:67idF64ROz7DM+Dn9APXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:5AC3VWF35q51Jz+UqmJuyU0GENkjQkTeyXrwemObFm9GbpOKHAo=
X-Talos-MUID: 9a23:dIsn/Qn06KrbWtMi5Is+dnpDZcFh7arwKHsNnIoKl47DOnF2Cgq02WE=
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="115820306"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejjRm69GjpF9tMGNB+ZxkyEFBkemt+JlU9GhVE0N+XU6u3zyGWIF3uWLdhIzQmk6mS560FULlWo0ordXcN+9FG+4qcdOOOekRCO61+UKVztDUmLTBWqdHI941C1K2DzevGx5hnRGFhPFb9RD2L9zsPu/BFPcFeostCoPOGf2yGbbLkB0h9WvFE5muttCDbDZKi765jG4KFcpECZGlQPxSJGzi9qKmfYWUPbYRCzlyLoLY9D0/r7BLwb6hZFPAbBFJF9PgjLnOPXKqjR6Nk0vfd6P1NCGIjojSB+O9AUIrJkFruMNr5VE7DoZLe8baKO1qr9wddFr2ULKDJzp2GS/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+waXIC4Ec0IEes6IKMtmlXuM00CRnZGiWTjMJ49sBE=;
 b=V1NjPm+mBe58aHCDY24vKI5a9Qflrr2t8Ymu42jgTBRkv2egpg1m9WEEO6IbgzDN3YvosbUt9YEDXvarIEMHJRi6h0r6hli3FoIuxHVqfpYF9HvGN2F/iXHJCvE3lESiyrD/lgTga72tbDmI8UkZxx+6RI8hM53O3tLKlZhwUdMEn22eR2rfw7QrAF0E6G+37aDhzWTNyCN54L/JEVB5Xs6HzUsOAAaXplxHC8Oh2oPXocwZUcTVd+uMgTakmY/BjBOVyrGWhWzVHmrekZSmSj3iEAgBOlS+kc/g764jr0lc99jvElBgtfaygliPak5vgfzbGA+q2zVP+3Oi4FWqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+waXIC4Ec0IEes6IKMtmlXuM00CRnZGiWTjMJ49sBE=;
 b=jvYEuk3nukIxU60b+nr5hPlbq1V+gQ1seQQ7Ux1KvW77ZOHIekdzphNKW6UzEue1raJfhCi7kyoTA1M6S5NGJZiE1JMV+w6nB1oQ7bEtj5g8R611eRD6+sNj1AbvS5kY1TlBEEuw/s3VRsAuCQAsfZxaXcewrSaAvvVRJlWZIDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 11 Jul 2023 11:14:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] cmdline: only set ask mode if vga= is present
Message-ID: <ZK0ddKXx13fu1yfX@MacBook-Air-de-Roger.local>
References: <20230710141238.375-1-roger.pau@citrix.com>
 <9827433d-54dd-47e6-1f74-53612da21c14@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9827433d-54dd-47e6-1f74-53612da21c14@suse.com>
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5476:EE_
X-MS-Office365-Filtering-Correlation-Id: 44be8f40-3e56-4f25-fdbf-08db81ef3eab
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YdTd3l4QFxvi7rzO1EokdSenYS134y1s8O27+Z6Dwh4myzSFWIeHVxj5kZLruKO1SzFP6iisCa0oqF4AciP8adyIyJX0X8Blq36jOH4ZCJ2flZsfJOwbeUKHA886v/ippZ5yRsIFwDziZ9hTY+UvfpeX5urVmN+CGXY7IswpDdONlGmzwOflqTV8U0hJY7XiD9Z03U6um9xMvvXBmCfUV+I3BdYO6NpcMhxSV1nCzdNODv/ZgcBBEtul/QVOhAOF6PgVsL3lUvHXdUCd+gEcXpy7O+fhBlxdeWlDBGik1En0a6FxkHmngRO+p4wVcTKk2LtIqNRnBjJRR1jN29MP823FTS5JcWqt4H5FIcRCqfcOj6jsndu4gEqdhxu4Kg4ZyMcJpE7WYRAhiuCmNVqNqGyu9wiW0xZHRPCIojgrNbr8hjMSHzjChQpJjFHg2p1MmHOG95pVrEesOqKKp2BFHY7CErYwvxwcbuMg+bawOJcl2PbvxdyZlJAlbPXKla+VdHff9K+tW3LxWO/PiJFbFSOuG2cbIFrKQvg/KOnzfdXR+4RD1PHPllma+sw+BHuE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(6666004)(6486002)(478600001)(26005)(6506007)(186003)(53546011)(85182001)(9686003)(6512007)(316002)(2906002)(41300700001)(38100700002)(82960400001)(66946007)(66476007)(66556008)(6916009)(4326008)(86362001)(8676002)(8936002)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1JCTUJFN2ZPaVpVN0JvY0RPZnlKWFRDL3FyQ1hDZ2RyR2tyWU1tZUJwZEtq?=
 =?utf-8?B?cENrUHU1b3V3djRpWGk2T0hTSFhIWjV5MCtwSFJvUTFoNG9DQXRlZUgxUTRj?=
 =?utf-8?B?Qkkva012azNYTDBTM09vNVpVNytTd0t1U2o5WWRvR3psSTlRUEx4eHpTd3pV?=
 =?utf-8?B?c1N0Mk1xbWFTbWVPMnVoNWtGRDV5NjhMdEdYNUwxRFRXWjl0RTEvU292eVZL?=
 =?utf-8?B?Z2grTVRZR1M4Y3oweGdVbFBDYmxZT2RYbWJ5SlQ4K0w5ZDVoQlgwYkg2Qms3?=
 =?utf-8?B?NFc1R2dqa09Nbnhmak0rRGpKa1p6WnZ2RnY2TXJGd3dibzEwaHRJZGpha1lt?=
 =?utf-8?B?ZEMzYmlTOWEzTDF1S3NRZTdMaS9ucGtkSVpaeG53cFk5ZFZqZ21qaU9jOElJ?=
 =?utf-8?B?TVF0SitOOGc4bldKeTdxOHFNaUczSFRra2QxL2RXdFR1ZnlneEFZVjdYWHJS?=
 =?utf-8?B?MnNSNVJBeElRUU41YjErUDhBQ2NaUmNwR1VpRFNPYzRoMHBRUGt2alVxaXlP?=
 =?utf-8?B?VW9TdWw3REdwOEdmVWxocTNHUzFCZ21ScEhVQUpNY3JhczBCZkhCalFFWEtJ?=
 =?utf-8?B?TVRpVm1sTVJHRk50MnljR2pOMFYvcGUrL05MN1llMVVXOSt3Y1ZhYVozQSty?=
 =?utf-8?B?Z1hScVhKTldtMERvbklLZDFWRUZlbG80Y0Z4aHFXVEZDVlVBZWU5cU9aRFRQ?=
 =?utf-8?B?cTdCWHMzOUV6VlppS0xYNmJKeXpyUUMvNnNzRGpoNHIxOGJvR2dsYVVNTWpV?=
 =?utf-8?B?YnYydWhkTXR2OHhYWGx1NmVxL2hMV1ZLbEdDNUlsWVNNbWQyekdYVFRzQlAv?=
 =?utf-8?B?Wkg3OFJHV1V1bTF5b0FYTGhIaCtESmI1RDNBVFMrR3B5RERJdzBiRFROOHlT?=
 =?utf-8?B?QmhXK3dxQ2dYNk5TbGg4WS9Wb0x1R3V2ckFDc0dZSFlmV3NWUStRSzFpdENm?=
 =?utf-8?B?Y0JIbFQwaU1XRXNDZGNtSmRQdU91NVE4UmRlNk9zVjFOdFlvZFdYMmd2RDMy?=
 =?utf-8?B?aEU4UWVIRkpnWDJRRWU5UXpuTkFBSFJ6dm1iRE9YaWYxUEtKMlJIWllubEhB?=
 =?utf-8?B?bm5ZcjBNYVpxTnl1eGZzK1FpbVErODlPQnVpK3RubFhMSzBuSG13S3lTcXM2?=
 =?utf-8?B?MCtzdHRLS0o2ZzFFWEU3OUltanEwNDd6M0hlcERXbFhVa1U3VnhQNHdENENY?=
 =?utf-8?B?eVZFQUFZTFVRL2lYQ2FRLzQrYXFCaVRiRE1tTUZoRTNwcTNETUxFZmE0T3JD?=
 =?utf-8?B?RWFEOWRBWFYyaWtBa25BNjNvSlhKdkpLc044bi9kWW1JdDdjZGFkVjRENWV4?=
 =?utf-8?B?Wm5pdmVoOTNueE1jYTdjZHptdGQyN2ZKTGhnalpZWUErbE5kcXE1d3lwQXJi?=
 =?utf-8?B?ZlVNL29YZkRtd29wM0FEY0lBMkhrQ2k4azlaU1haUmFXRjBlNy95YlRGeEw4?=
 =?utf-8?B?RDllb1J2VWEwdWlmZ2M3ZHRlRjk4eEFPb1QzUHlpODFERHQ1RDhMM21oSUQ3?=
 =?utf-8?B?TmlYd2ZNU0d2N2NrQmpVWlY3TVZyd0pjaU0wUGk0aVVBanFvLzdoWVh1MWtQ?=
 =?utf-8?B?OEd1Zzg3L1dSNHVWVTNOdTFzRmNQMVN5V0RiS3NsYTBZMjQ3SFBhWWc0MmFl?=
 =?utf-8?B?WWJ5MFRDd1FvVGZrRGZSYnNOR0l3WTFGQjkzZmViV3U4cWhnV3dDODVhaDhr?=
 =?utf-8?B?aXU1TkpZWHRmUjNDUW82NGRCZnArdHlVM1hHakQvQjAvYTZUbGZTaUpHRVJM?=
 =?utf-8?B?SmlNUFRVb2FYMWlGN3dneVh6Y2VnaU4xTktIYUZ1VUNQekdhK3FVZjRUN2lT?=
 =?utf-8?B?SytjcTZWOGxXTzcxOTg1ckF2amV2ampzRTRrdXY1NjlvdmgvVGtwSlNNazdL?=
 =?utf-8?B?YVVUSEtRSVZ1VEFzN0MwMGE1d2F5UHliZ1lQdjFJbXFnaFNLZE9JeE9NYmlJ?=
 =?utf-8?B?Y1Q4VUdSeDBEV1BGZGlmbC9VWW9xUjhaaXdkQXR2WWhGUHowZUFnWUl1NDJa?=
 =?utf-8?B?OE9KUjhRNXFrU1hKdEp0ckJqSWVZNDhScGtKbkQ2TlZodEpFUUxZbG5uUXF1?=
 =?utf-8?B?NldIQTRnTHFNNWJNMSs2RUY2TGMwVlRuaFY0NEpPRjNieTkzMGxFcmptdm9v?=
 =?utf-8?Q?WMoJYUAlNfUYe+bfsREFG52rX?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l4eDfvYW57BJseLiFYEJzdVCxJ6mdqonrd2xFVxnwrL4cmSkgRMlzkTQIqct2CS/3eX9cwnJaBkqYThByVvyimCdrK7yKYJf4wcARk/koJCm3dUp0ihPDKKG3zGvze7sTKw5iH9vUzL1bALv0eiuN4iqBUrUkLsVxfvkrxVYZnYCJIe+D4Y9v5UTTzElbLX8jJKMekSp8dpXirGId72dRZReIVyoFSkLLtksHGDKjwDWWnrp8flgkU/9Py/Rw1bc8cjHsGkktq+IzatC2mTIWQECpEbNtdqjrc4Y4MBDcmclfgTwcnyQoKXAYBWxt642Qkt49tRI/4vw5nqUPJ7SA0jzBuaFszXbgZ+O3pOVEZkyf5yz60RmanGpQoMrjFhbUTdYU/oUh+etqmuB6v1JIr3rqNibOh7bpr/JAyDrfWaYUyPfx8Kw2EdoUk0krnpTRNSoRWe9oiXwdn89eWTne2oLx0TCmdtckwK1zHKoamCavIaTjouBevW4A8ARasbqmGh1LkQrtzEgETarZyEpIADIg0vJeYeflKE7OxOHQcgUH2F5xuWB30vca2JiWl1wbhF+MLp/yzqQjfHZvqvZqNoJOd+2vPX6V6MYS+Vf/8m1ga+wMV0QdUGtuJhssR1CdR8dY24qJf5psTESeMzKJ2eWwU2sZRaVizVX3YECTTSD+PaOSdkjFOM0K09pOlCOgQnAS4wfuZFGuzd66ITnJS8jn2dr+C8VmWgpIMY04j8wiHlfsGo7iKePFSqpfTGUE6G/RPW3Ach2SGW7KZvyUgMQu5JxLDIRUqWs9l45zcV+F5RAqo//KIn16OCaP4Z1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44be8f40-3e56-4f25-fdbf-08db81ef3eab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:14:35.3340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz8nqblZaeCONVB6SgBTOGRa7Uxj4qKF3X5Ryv5A9b44zR4kreKUfV8T3mgMPacE4z1kTtk0bAeMYd/+j17bWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5476

On Mon, Jul 10, 2023 at 06:27:06PM +0200, Jan Beulich wrote:
> On 10.07.2023 16:12, Roger Pau Monne wrote:
> > Commit 9473d9a24182 set the ASK mode without checking if there was a
> > `vga` option provided in the command line.  This breaks existing
> > behavior, so exit early without changes if `vga` is not present in the
> > command line.
> > 
> > Fixes: 9473d9a24182 ('cmdline: parse multiple instances of the vga option')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Should have spotted this during review; effectively you're (almost) undoing
> part of the earlier change, just that ...
> 
> > --- a/xen/arch/x86/boot/cmdline.c
> > +++ b/xen/arch/x86/boot/cmdline.c
> > @@ -279,9 +279,13 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
> >  {
> >      const char *c = cmdline;
> >  
> > +    c = find_opt(c, "vga=", true);
> 
> ... you use c instead of cmdline here (and I'm heavily tempted to actually
> make this the initializer of c).

I see, yes, please do.

Thanks, Roger.

