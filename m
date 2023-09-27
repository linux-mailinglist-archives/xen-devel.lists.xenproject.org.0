Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053347B081F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 17:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609102.947971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWPO-00072z-1R; Wed, 27 Sep 2023 15:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609102.947971; Wed, 27 Sep 2023 15:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWPN-00070O-TT; Wed, 27 Sep 2023 15:25:01 +0000
Received: by outflank-mailman (input) for mailman id 609102;
 Wed, 27 Sep 2023 15:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlWPM-00070I-GZ
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 15:25:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 033a44f9-5d4a-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 17:24:58 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 11:24:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY1PR03MB7216.namprd03.prod.outlook.com (2603:10b6:a03:533::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 15:24:45 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 15:24:45 +0000
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
X-Inumbo-ID: 033a44f9-5d4a-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695828298;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=X6scQgBPzJ/pU+FSz0VZl9VVL609G+81lhsYqWvUjGE=;
  b=U1HZXFXzSbLOC6t5Q89ZclAGVxx2fLi5jX8pNSLkfb2IZGC59VgcXFv/
   cQ5qnOR/ZkCyiY3EuCEm14xnQpSdVEiO72pzBxHl9u1O7/9HtQ5CDsqa5
   ZlmPTTkcSe15SjQgr2Glx3k/16OAlW+JBhiXIwXm/6bfhCLoKDz5LEUeE
   M=;
X-CSE-ConnectionGUID: 6aotJQo1RjO9IMRgHckcTQ==
X-CSE-MsgGUID: ErDtSfRNRAyqkC8N4J/NAw==
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 122602136
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:0xS3y6/t2gojM2JGeSzPDrUDTn+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2oXC2HUP67fNzenLookOYq0/U4DuJ7Xm9NlGwM6pSo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdmNKoU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkQ/
 PsECgkKNyqBoLOX5Yi0auJvjfgaeZyD0IM34hmMzBn/JNN/GdXpZfqP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeLilUpjdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVx32jAttJStVU8NZHmnGP/WIpLic/REK4iqmf1mz5fftAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+ITXOQ8J+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXqHRngz
 jbMqzIx74j/luYO3qS/uFrB3DSlo8GRShZvv12KGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:PqqlTK21EZ8cbMbUeI7N/QqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-Talos-CUID: 9a23:4SUlfmE3pd7PbHlRqmI5/UkIOPkiK0ff6ybxBnW3KW1qQ4GsHAo=
X-Talos-MUID: 9a23:z56r8gmmnkPBVdLLOFZzdnpPLut02KqULnokgIwFkJmiaQ43HR6C2WE=
X-IronPort-AV: E=Sophos;i="6.03,181,1694750400"; 
   d="scan'208";a="122602136"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQsrlgQuJL2J2VmaUw8le02j4dHSG9FE8mcZl3BqtTeBjlTlzzjivcYc3Esp9s5njiqy1h4Tx2CTFR9hDE5ELvMaLRWd+oOSV66d1IlDanUTGB4zoaJRHXz0bP/73EMIb9BDuaH682xXCqKtb77MSGkSrP6Sikp3P7LKD8EQIrEFLEGIyRrR0Yj8KSAQ94rRSNqJi742Ec9lSKat3B6wMPn75V8kNhawSyIZfKUrIXumtjIQM3jfdjvn7IZmi49DOdeZyS8nihn/RnYDmjVFe9UadmzMuMqn023DA+eIm3nSp9sm85l05RdyZr32Vv9F/DcW72E3IcASyiflmjdJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QH8bWQOQixbauh0wVdBOpR/O1L3xaTNjpr8J5tngBU=;
 b=TF+e6rEJISkqf4m/Q1cbQd0pSntYH5qXUxr0inDXIpJV3RYj61mNHTsT9b32o57+yuoo1sbXx0RKNytOeRrRdC9j37OrbOZbgg+ZAIuBEjt9Q/jyNrRt/PlN9xDY2e1iC1nYQlp7gKjm2HhZsMXHn04VKc+0dqamtirxktEdUxgKm5lv8iDSBDN/Wx6NULcTuv1BbVeaO9ZtGHHg7ySFULsPS1j6u+ILefEjidUooyvOQxBZEd9wmnts1gYe8Wup7dyjxyCk6ymSVeNos3//XIfEgT/ZisLWpQ34F1Z/E0e7a6FNaEm31T81SwSPQaLedkZV341j5AvPn/WTL26Lsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QH8bWQOQixbauh0wVdBOpR/O1L3xaTNjpr8J5tngBU=;
 b=xgUYT+c7lg/2XiU+9aPYnWlGiXR6KbdaJ22OIim8A7c31Bn8/ucZrpmHzS17gZOY3BYYm1nRlnCTQAQyRQbjefNzxfncc1QvpUrO3igviRFlruIbJ7II5aJG1ENCatHPd9KWC8ay4E98sw5oGyOfvjXdvZfDAgLzurqxtI2S10Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 17:24:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 6/8] domain: introduce GADDR based runstate area
 registration alternative
Message-ID: <ZRRJNw-B5iT_TGJo@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <bb902943-c139-ec6c-66f9-284ceff3995d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb902943-c139-ec6c-66f9-284ceff3995d@suse.com>
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY1PR03MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7259cf-1a3f-46f2-fd03-08dbbf6de0ea
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	03Lt8NrXVs4SA7sUm2rT4UtsQRYj+VKQ1IERqKKt3UvOLPrDMBeSlK8neuFuOnTUDTPpMK3JxvGfqdyCll60Ru5vfyodWSzUk7UHzIL41C/5+/PlnLvLWV1mqknVtoQvY7TwslzXNGd0MEF1OXcU/Myss3MFlzhKGo2pnQzXrfwQyHmSSyePwpNxhVRasp/bt8zcSwcgUragCZWI1k5t/mI8e7fQtGF9QzWC16M1SLZ2DIdY8Nn3XV3Ac+D7rmLiOXua62RJPybxmsOB/eIyOfU6dRageSHoBD9/mFQ1N+rWrTQ2em7H5wNW1WihAQ5gThHvjfp9YBQNiK36xW1Qr7xBQ0PpOqyN27WYmsx3YqUWVYl1Pwn53lW4P0/d24YBzgd5ApplD58kwy4VDeFcyMOgt0W6SSB2O5gjmkTYY4PMHljCpR5a738GpDuVuFjDsKKddUonaixMqXNAwFtHglPvM8rNA5uP3HNPh/GHUTYLlUv9LWLshU4SoGi9BUoHbJLgnq+clTVdts8rt5ugeTl4U3AZhJDNtrkVbJFYD1+2QbVQ7jWi8xF+1GhbALIz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(1800799009)(186009)(26005)(6506007)(9686003)(6512007)(82960400001)(38100700002)(86362001)(85182001)(316002)(54906003)(83380400001)(8676002)(66946007)(5660300002)(8936002)(66556008)(4326008)(66476007)(41300700001)(2906002)(478600001)(6486002)(6666004)(33716001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHQ4ZXpRZVVDNGVKRndidDNTZlZqVmxxaXZsaFYrQzlWNFlKNWVPVEVrQTk5?=
 =?utf-8?B?ZlpHNE1DNHBTSUU1YW5BTFdVazNneUlVSkJMMFk1TkxOdWttLzAzN0R2Y2Nz?=
 =?utf-8?B?elI2VEIrZFRlcXVqQzVEV0s2K2pBN2EvL20zUGU1V25Eb21La0lFMmY1MWk2?=
 =?utf-8?B?SnJadVNHUjFleFVEZmlYaThLVk1ObUtUcHcyNXM1V2hXU0JhQlVFMU5tNzRo?=
 =?utf-8?B?dFVDTGpIejlYRkxrQWpYTWdWQ0dZMW9XaUoyY05ieitGVzBaMTJpNnVXQnov?=
 =?utf-8?B?ME5jcFZYL1hDbUNUdHlOZ1pFc1g5YStVeE9wNTc0bDI2OFlQU2pGbFpsVE1y?=
 =?utf-8?B?cno1RTJkVmV1amlzTThwM2NzQTRaRkc1UERSdDhZVlFmSGlVTFpnMnhHZlRn?=
 =?utf-8?B?OXhjR0E4cnUwLzlZVnczS2lrUnFNQ1BtZTNuN0JIaUY4UERMT2hPcmVhb1Vm?=
 =?utf-8?B?a1MvSTB0THJtMFAvZVpJRCs0UDNCL1hQa3VUYUpaaVBMU1VhNjlDSUxSTDN0?=
 =?utf-8?B?ZlBmL3hsWlF2R1NqYW42YmVYSnRWbGhmRHB0RTBHdWZibURIN0JOUDJ0eTRv?=
 =?utf-8?B?eWtBbWxUODVXQTZPK0Y5NjlpandkbFVpTWRUSkJUNWNnd0kycXN6K1ZzbDBn?=
 =?utf-8?B?SXJ0bUV6NVoyRkxYcW5qMGJ5TmVBSmZhZllqek40TWlML3Ezc1JtNFpnbWVJ?=
 =?utf-8?B?N1BUakdsZ1ZFajFKNzJYeTA0bjZ4WWxSc3JrbDFFSEZ4WVp5M3VvYzJXcDZG?=
 =?utf-8?B?SkRQSlNCbEdsWHBPcGI1NkJKQXVCck84ek1VeU8zRzlwZ2Vvdk9EOFVhajZM?=
 =?utf-8?B?akZhOEJxU0RrdnJKdk9ES21EaG1iOSt0QnBWU3J6SXk4SnpQaW1FNHZMbzFE?=
 =?utf-8?B?dXFmNE1vMGhVU1kwTnNHTXprakFxT2VLdWxPRmdHRGhZVlFBU3hpT29HeXdp?=
 =?utf-8?B?TzRSb05xcGY0U0FabUptZ0dHRGZ3eGI1cmt6Qi9WQTJOMzlVczBGWjVXdWl3?=
 =?utf-8?B?d2ZYbmdOaHplS0VMaWhaVVpEM2JCeWxCSGNvcU5ha08xRzhJQ1dValcxSUpp?=
 =?utf-8?B?TGNNMVg5NnJ0UTNHZ3U1TmR0SXhGQVg3aEVEUzRXdjhOeGxnaTdVYS85RTBi?=
 =?utf-8?B?QjVpdWdTcWRJd3E3ZldPWWowSVJOUWw0Szd2ZXhoUHE3OWZGR1V6a3ZIbGRy?=
 =?utf-8?B?SXF2dUpmWU9vSzE1RnQ5NVZ6VmdTNEFZMTUybFR0VVVMS0kySjNVRkJBZjJK?=
 =?utf-8?B?RVNqNDBPUnp4NWFXVnQwbmtGaEFEZkZxblZXYVJpczJBcWZLWVFjWEpCNGli?=
 =?utf-8?B?K2dhRkRlWUE3SERTZjIyWWNqUmtvZDUxeWdWRUcraitVUGxBTkFRNHNSMHpO?=
 =?utf-8?B?cEpxcGFhNlpKMVlXNlpYNjMxbTFhWVQ1QVVkZWFPdFY5d0VUOWJydGF3WXE0?=
 =?utf-8?B?OG1iZmZkZy93K1FVZkVYRmJGSVVXMHdnMGE5SEZYS1NrS3NXT28rU3pJd2Jv?=
 =?utf-8?B?enh6Rk5nZk0zSi9KenIrMDJ0ZHFoaDNsaFVZeC84Q04yU21GWHJqL20xblZX?=
 =?utf-8?B?Mlg0bmZiajJwV25CWFk2MWFIOUg0YWF0QUMvOGlIbzhJcXkzZGY5SGVianJi?=
 =?utf-8?B?b2l5dFlwTTQrWndPd0hlUmtNaElvMEN6YTR6VWJoWWtXY3c0S25NYUdiNFJr?=
 =?utf-8?B?cHBtVjBxWFFyVis1T3I3cmVSOU0vb2Z2clNIcHUvQ1BwYWVjVHd2NExMWkhw?=
 =?utf-8?B?dXN3N0dYMzR2aTZwZTBZMFZGaXlLRUtZbi8zTkVaWDc1QkwrRGNTYkovKzhn?=
 =?utf-8?B?ZzlIcmsrTlg2QlBqV1VNRlVPMm5HSCt5OG5oRkxjTnlFVFpnM2ZsUUlkNFo5?=
 =?utf-8?B?N3NQTURLeDRSZCsrdU13ZmIvZXdLUUJob21BZjM3NUFBWDlvakVGb1RLZGds?=
 =?utf-8?B?L1F4cjIvZ0VINHRlZ2RSbG45SmVDU25IUEdjNytIK1RqY01SbEVRTHRrOVor?=
 =?utf-8?B?RHNpUlZBblVFaE5VYnpjRWRSd3MvQjR6TTlzbm5mNkF1ZEs2b21vTlNIZjRu?=
 =?utf-8?B?aHNETUlLODFhT1VOQVFGZFkzWTEyait6Vytacm1WcDBpY0oyNHA5ZUVxdWY5?=
 =?utf-8?B?MWRiTzJFd29yVHZNZDduak0zR0hBaUhQa2pWblRlblZqUk9vRytJeDhhTExL?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OxqgLSyXT7dtI+TWcLMi3Fr9Avghla2I5kzlWSBZTgpQb3x0lxfgRpD8FPDMeF5ER4Vh58QCVt8/dVh1KQH6oNzCavEpdRnV7lQKS/Sj5er0yZeiQ4DbPbg0K33T35RUr8dzGTbpxhXp2N/H/b8zHuSsgIiExjPhMIC/SKcuKnbQdZ9balVj2G8n60LDG3uuIdI35pRvZjz+0mzupcyzO5x8+40Lh1KzlmrkDRewT13kCZG20i8O4NMuY38LZ77UGSmG32xR3E2azoyLwezr0GEKE2mO9yVecNghn84H27KWby6fOvIaalT0+oWlMhXad/+yRr5pE2CyAG6X984TeE9Ygrn1y/rp+k5yL8T4pmSmhmeVGamoYm+lkcU+anu8/8ut3DjClTYpxG0BppUTGMtOScivzVFfbnqBSCE+hcMSyX3ct7Cu6n23arZ+UYUddtMLwtz0gc0YU7Wo9unPkqJsOUf3RcSgkBSrs48ezR4/GWiTdo1f/uiMQoluUFr7AE0qF9jjhCNhcLn3OqLMx9eYXyopm+VBFIzxjAyq3v0EM+y/IOmi0r4l0HMDBpXvzZj/eAMp91y0nK/5BRkvB/68aK+vVH7NwP/Q5/Niz1vjyS157FjhefnYDZ88EbUNGSyE3XpYLSokwjnFeXspirDHBKDoXhSK/Ig+PR66h0xu90lyjE43hqjvtIJsXvQBgSnMvuGkyZZMl5i1+yFPOInxjVw6RMzIcAgO/ECcgHspWm1xT11sPyCywzE7qwn+/oObbUiJ9SOkJ2SkfnUIztCm4MVE+ImrFb9ymAL409nNOzVQ7sUXfwGv8FmBqk2nOcy637WiCtFEumMwz+r6cZHDFCTCAY6FmavWl+LcJAs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7259cf-1a3f-46f2-fd03-08dbbf6de0ea
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:24:45.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCFN/DYNyP9NrdcLMEzaAEpqiZD3d3DBpalX1ACVTp6qIRcFk5PB4R1FWJg8WW4Agiq2ZROVgINdzSGw/Y+qBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7216

On Wed, May 03, 2023 at 05:57:40PM +0200, Jan Beulich wrote:
> The registration by virtual/linear address has downsides: At least on
> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
> PV domains the area is inaccessible (and hence cannot be updated by Xen)
> when in guest-user mode.
> 
> Introduce a new vCPU operation allowing to register the runstate area by
> guest-physical address.
> 
> An at least theoretical downside to using physically registered areas is
> that PV then won't see dirty (and perhaps also accessed) bits set in its
> respective page table entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One comment below.

> --- a/xen/include/public/vcpu.h
> +++ b/xen/include/public/vcpu.h
> @@ -221,6 +221,19 @@ struct vcpu_register_time_memory_area {
>  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
>  
> +/*
> + * Like the respective VCPUOP_register_*_memory_area, just using the "addr.p"
> + * field of the supplied struct as a guest physical address (i.e. in GFN space).
> + * The respective area may not cross a page boundary.  Pass ~0 to unregister an
> + * area.  Note that as long as an area is registered by physical address, the
> + * linear address based area will not be serviced (updated) by the hypervisor.
> + *
> + * Note that the area registered via VCPUOP_register_runstate_memory_area will
> + * be updated in the same manner as the one registered via virtual address PLUS
> + * VMASST_TYPE_runstate_update_flag engaged by the domain.
> + */
> +#define VCPUOP_register_runstate_phys_area      14

Just to make it more obvious, it might be nice to add a note in the
comment on VCPUOP_register_runstate_memory_area that `p` can also be
used with the `VCPUOP_register_runstate_phys_area` hypercall.

Thanks, Roger.

