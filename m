Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC887AD4C8
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 11:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607733.946013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiBA-0004C3-Cb; Mon, 25 Sep 2023 09:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607733.946013; Mon, 25 Sep 2023 09:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiBA-00049Z-9A; Mon, 25 Sep 2023 09:47:00 +0000
Received: by outflank-mailman (input) for mailman id 607733;
 Mon, 25 Sep 2023 09:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZBI=FJ=citrix.com=prvs=625423c2c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qkiB9-00049S-9p
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 09:46:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7661eb64-5b88-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 11:46:57 +0200 (CEST)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Sep 2023 05:46:53 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7091.namprd03.prod.outlook.com (2603:10b6:510:2a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Mon, 25 Sep
 2023 09:46:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Mon, 25 Sep 2023
 09:46:49 +0000
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
X-Inumbo-ID: 7661eb64-5b88-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695635217;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pjUYHuu3ISBEQKSy++w8oy5/+HPEcqiNkT2vRoMNQCE=;
  b=Ju/YG3hhZovj9TduBTHSwxA9yNCIWxWpqqBJIZH1hxPju7KB3sCebL1T
   kuDXODDZ3pC8MAgNZQcuF6zPl9/UGwA67ZG7opWxG6ROTX1cB6iUt0hdt
   wSGl7vE5fXuAHqI+wBshiAcSgqqFTtna8UCI6/xAU3oJQuDxyG1XGJXkT
   A=;
X-CSE-ConnectionGUID: CwTOjojvQ36wrXvB+xgNeQ==
X-CSE-MsgGUID: rfGW8DtbTLS3g71lB4sWWQ==
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 123702348
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:TJIiLahk+khE5m+dPZNqxVmxX161AhAKZh0ujC45NGQN5FlHY01je
 htvCD+APvyCYmWmftkia46x8U0BsMOHn9VjTFBoriBgHnwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyp0N8klgZmP6sT7QWCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQzNwwqbBeBmdvtnq2hevdGxdQsCsTSadZ3VnFIlVk1DN4AaLWbH+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMqluGyb7I5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhA91KTubkppaGhnWJyEMsWDEKX2efmqK21Re6cY5EF
 HMtr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaMyUPMXULYyNCSAIf+sTiu6k6lBeJRdFmeIaLidnyFSD10
 iq9hiE0jLUOjuYGz6y+u1vAhlqEuZzhXgMzoALNUQqN7AxjbYqhT4Wt4Erc67BLK4PxZnmMu
 mIV3feX6u8mBIuI0ieKRY0lFbWk5f+DPCfbx0BmG50s9TOF8HqkYIwW6zZ7TG95P8BBdTL3b
 Uv7vQJK+IQVLHasdbVwYY+6F4It16eIPc/sUPnPctNVY59Zbgaf4CZ0aEif3mbgnVItl655M
 pCeGftAFl4fAKVjiT+pHeEU1Od3wjhknDyMA5fm0x6gzLySImaPTqsIO0ePaeZ/676YpALS8
 JBUMM7iJwhjbdASqxL/qeY7RW3m51BibXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:fwaRg6p/Abmhsp4popZYwFoaV5queYIsimQD101hICG9Kvbo8v
 xG785rsSMc6QxhKk3I9urgBEDtexnhHNtOkOss1NSZLXzbUQmTTL2KhLGKq1bd8m/Fh41gPM
 xbH5SWfeefMbEMt6nHCWeDfurIi+P3l5xAzd2uqUtFXEVhbql79Qd3CgySD01xQ2B9dOIE/b
 Snl7F6T43LQwVvUizga0N1JdQqhLDw5e/biV5qPW9Z1OHB4AnYloITXXKjr2Qju4Ej+8ZfzU
 HV1xH87r+u9+q20APYygbonuVrscqk199KHsDJlcQPMDXrjW+TFfRcZ4E=
X-Talos-CUID: 9a23:ELVuCm9zf3WPPTM3RaGVv2ULJucndX/D9SyOPFWIF0wqWLKzRGbFrQ==
X-Talos-MUID: 9a23:+LktJQR4+uCxUGLORXT2ih5dZOt06ZiKMxsCzswCkZWfChNJbmI=
X-IronPort-AV: E=Sophos;i="6.03,174,1694750400"; 
   d="scan'208";a="123702348"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMB7lvIplLW/BrsHRdegmYBE1dfyoOvDq3/qztKmon1jxA4Oripd+zeodetJTAOF7lflqmhKac2MWRC5qECf+JMtzEzgY2IaXP4ZWXbIKWoyGYOBFac01IFa8i1tv16DaAR22bL7JMg84ldOJNUprTKP6l6m6emwvsDiGPTI04dVcA3gQ23aiZ8c1NF9aBn5q6zmUQvLnnFG/sACY2QD8mCPNBvgmeCCeLXUhOimds7O1cMKSQYpQeT7XsKWCSazhIBuyaFJQTlfh5brUX1/zWGj974cZww9zMtwOFPIV0O3mjyhfrl+fHBZdcEwYAVMN4qYDxURr2CKM2J7gGIo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVC4/YVXjTRU1z6NZv9YDCFCTz6txPE0WbZ8eFg7mPk=;
 b=j8/WPWtGkJUb+zCT+DIsiz4apTNZE/Bit/4E2IHGNnjH/kkZbdyz8Y62AnSqhr0JCaqnq/lsgVWNodTXG7K88ZaR05izAVBXVLDgxrPlmS58IVmBGgMJMm9zqjCaI8dEfifCDVJYcEXhwp+8zOXASYeG9plOs1fLQKxtsy226ABbNqAIPIz/TVc5V5pzl3DnaVRP0hot2eAJUL0/b4EEeEMDr1Qk8e64FDHV7bkBjQjeCpf2TbjoQc3LYjh+HkM1/IjTm6CFGUbYy35CV0xfy0Hia99GErIzbMQOyqVCUfn5nuULX+bBLYx8oHyXnidZx32lEoLcSqEQQJGPYfpUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVC4/YVXjTRU1z6NZv9YDCFCTz6txPE0WbZ8eFg7mPk=;
 b=BN1pMw5U09G+rL3Woh4rTd+vW1Fmy81KgUoS1GZ+m6QIm8loElnrgnrsQsEWb5o1NJ+Qw+Iu9Y3oIo17+TMKt4afh/kmi8im+hWx/GnZ9sz1UjFgjPYtFyw348Tspn9rOcrmsIEwxgOVb2GuiQvnqkgQKfkjDdhFbHCzTquolMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Sep 2023 11:46:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>, Henry Wang <Henry.Wang@arm.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Message-ID: <ZRFXA0dUHk5Rmlan@MacBookPdeRoger>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
 <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
 <b0296908-5081-5d34-8487-b8293eee97ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0296908-5081-5d34-8487-b8293eee97ca@suse.com>
X-ClientProxiedBy: LO4P123CA0475.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: a89f73d4-cdee-46f9-370f-08dbbdac56be
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wur8LI3G0eklWlJNvazWkvjrC4n75oFeXc0OLx/12p2zxcPTll82srvWIK35aKZ5z+7x9f0+Y8wKy3EoKocNZTiK1HMWgpR7T1PIm86jpQofQaGsmYEBey+YihFIBEKfYVoxpjQqdTYFyg0fcYzHqWYpNMJ4G9R5WTakV+waqQZz2rU9A5bO2oXbakfthrSWgLCEt9jX2++ASeVadVN9uHjx8KTReAt9SMfopmADXIRed7Sd97wSi6qXkaXXyNX53Z6EzlBBSH4lZ80G/Kdj2+4Ks2OYje7O8lMjs/MUNQSKootoUHfbOlO6WlOY/TpkxE59VC5j5ZHihZ7lSiZYYH02+RASP1bSBhSBnjpVyYHHwj+drAL/KuHwB03mzIw43pBET5VP+ZGD9WEM3bMEXQGaLbWHsVkvY8hWYTmQvdX6Z+e0uGtF2uBpHqJ0050fc/hgBk+vaUmn2eU0GS9Jta/Uk2z56d5Qj1Iw/atWIwOsMfnICRgi94oDyQMkeOpj+48yDzvNMO9y6WE/tendS+PIHc6O3T2d64epIAisci8wxIlbZK17DFJewiYmH23i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(451199024)(1800799009)(186009)(86362001)(82960400001)(6486002)(38100700002)(6506007)(6666004)(478600001)(53546011)(66946007)(316002)(66556008)(54906003)(66476007)(41300700001)(33716001)(6916009)(6512007)(9686003)(4326008)(8676002)(8936002)(7416002)(26005)(5660300002)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlVuTERlQzRFU3hJVEZNL1A2L3V6RUlGM0NnV2VSaG5nNGROVDBYeGxEc1ZF?=
 =?utf-8?B?bG5xUlFVNUJTUGVWMjJUa0M3dE51b3ZLVUxMVHZHVVdwSUgrU0paWlczUFo1?=
 =?utf-8?B?eTRWTHYxTUZDRGdRYnlGV2JUYWI3RFdHdGJ5S0hnMkFLYnNnYlNGM3JJa1Q0?=
 =?utf-8?B?VEhOd09KTzZ4YlRKaENXSFp6VUxMZkNvNGdRTmtBSUdiUmVGMnNoQUtkMkVt?=
 =?utf-8?B?NXo2Q3lGWlVDQmU0dko0bFVNOEdQVHp6MWdzODBxRS9UMnpDb1pydzVpaHhu?=
 =?utf-8?B?VFY2SXdPclZ2TEN3UWdrOUgwTkFFSFZvN1dDc0Q3TS9CZnVwY0RXMCtQeDNE?=
 =?utf-8?B?NXc4bndzbDVIU1FPN0ZONCt2VHAwNXZuRnhPei9YbHVtUHliamJ5ZVZVWEVL?=
 =?utf-8?B?UDlzQ2dtckhVUStQQ0VOZ3hKVzBQa20zWkppWWNDM3FpbW1iSzc1L1ZZMmJV?=
 =?utf-8?B?Z00yNklYTjZSMDgxNEZOY0tXSWVLeUY5bWJNeVVOajRabHBkdWFweVlBL3Jk?=
 =?utf-8?B?K25NY2gyUGVlOXJwaGtJMjFyN1MwTnN0emV2Q2ZwQjVyVFZ6MmVuSnJCWDM4?=
 =?utf-8?B?dnNqTEp5Y05wM2NXOU9yU2syNzVTY2xxcFZJN2FmYUpCcGVjTjZCbzZHTkhX?=
 =?utf-8?B?YVA1R25SV2xhQXlJR2VaeHFSVVFqamhNcmlFdG5LRTRiOWF5aU1XSWF5QW9m?=
 =?utf-8?B?OHNHdFl6dVRSWVBXS0JoTnp3azZOczk0WlVodWJJcDl6S1E2aHJKR2IxcXFP?=
 =?utf-8?B?SDVqRUw4UWJaTExxK1Vvbk5USnFacWhzbUJGNVZoVm5TdFRJRkFENHYyZkhm?=
 =?utf-8?B?T2ZrMlZHY01ydmpOaEtHblFTTkw2MG5penRVa0wwdlBadUZZMW5oMGc1S1VZ?=
 =?utf-8?B?L0JKQ2lCQmd6TExaUmpVdHBvcURwaG9IZzFqRElTdVMyQTcwTFhuZitsdFhV?=
 =?utf-8?B?YkZZTitMUzBud0ZML1ZLSFdRLzdBaVdvaksyb2NKd0JBWENNT3EwekpKVDlN?=
 =?utf-8?B?RHRGL2ZmNjExRWZjVUNqVjI0TWgwNU5kakJ5K0xFRmdIZGlMRFBKTzNMUGwx?=
 =?utf-8?B?eTBlYmtZdkVhS2lHK0FGTDI0SUV0VHp2K3gvaE1wcndkRG9zZnZaVXB5YktY?=
 =?utf-8?B?dDJLYTdNNVhnTktVTU9ZYWxFZnBhUFRTREM3a2ZabnV5UXJWWHcxcWNoTUM3?=
 =?utf-8?B?bGdzanUwNU5vT2ZweW43ejZ3eDE5eVBvSERkMmNmazE2RUhiWHUvd3dtdzRo?=
 =?utf-8?B?Uys0MFVHNmxzR0hvbXlMWGswNERGeWZjWUNla3VUMUZ1dHlBTEVVd1hiaXow?=
 =?utf-8?B?YVl4MGM0WXBlRzduc21kTkNHZUt0K1dLcXV3RHJZdnJkK2svVDJ5U0tSQ2Fr?=
 =?utf-8?B?emZkMWhVRUdvR1pjZ0ticGt4TkZpODlDbk0rVUtVQUJvcjdmcUZGVllLRGdj?=
 =?utf-8?B?Z3FkZXZJYUlXYjlIYmJmU0d0T1Vyd1lqcExlT1RvWTVjTVdFcUgrWkFBd1FN?=
 =?utf-8?B?Q3F1QW9RZnFsdk53akpaOFM2ZjV2Y3Zsck5nNE95N1kxVXZzN1hvNCtMZjJJ?=
 =?utf-8?B?RWxmU2FxZzFnb21NODZVem9BNUFvejd1MXBKa0JRbm9QekFQZ1FXWWc3NnJQ?=
 =?utf-8?B?cTJaUURvNGlwWnIvV1hRV0tqaDl3bmEyMjZLV3ZvZVBVMjF3RHhzdEFLYWs1?=
 =?utf-8?B?WjNuT3ZYTy9WdytvL2h2NlBSRlFhTkFxSThLQW1ZS1FPaVJobDFFZC8vQTRZ?=
 =?utf-8?B?SzZSV2FoT245Uzl5K1dmaVJVMGcrOXM4V2hsb05XYU9FZU9RVCs1Z2o1ajJ6?=
 =?utf-8?B?c1MzVGZPWlFockRGOElyK1I2aE90WkhEOENVU0JJTTRMT3hQeGZOeW12S1hZ?=
 =?utf-8?B?V3NWcVdrcFByb3E3R2s5WDhmb0lIWElaa3hOT1JLcUNNaUdjcDhLRzFCOEhX?=
 =?utf-8?B?TlVXdGV2YjRUMjZZSzFCQ2dNdXlTeS90Umtwa0FIUzViUE9VVTRtZzZZcGNy?=
 =?utf-8?B?TDYvTEFaVjFhM2sxYlpqTnhpdG5iZm5LdWY3TXhJUFdydTZYNTN1SmpzZnVI?=
 =?utf-8?B?NHpIUWpNaVhzclZIRHpraFR2OEhyUm5EWW4xNkl4NWFaUmRlUzRrSG5LQ2Mw?=
 =?utf-8?Q?/DfsldD6/ex2O8nq60l1sXLVP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?b01oRzJod1Q3c1VaUmxkeWVkS2tXWEVxTXJ4YUlFRDJuOGFwRzZLYlp5TlU5?=
 =?utf-8?B?dFBkdUdQMFY4SlZrVGFNZDVRWmpJQWMvQXJ5Z0FWdHM1aHBtaDR3QXpGYWVt?=
 =?utf-8?B?c0lQSkJrQllRMTVKaDB3RzhKM09XVEpIM0NuR3dwSk1IK0EvQjUyY2VSdmpP?=
 =?utf-8?B?VkZHc1ZOYm15VjNBMzRtUEU3RExKNUd1Rk45N1BpbWJLWllicXd2Vmw5d2E4?=
 =?utf-8?B?Y2J4dmgrTXJxZHhUTDJiZDZkZ0JZcXE5THM0VFRaWFB5UmtycURrSXhDeCtQ?=
 =?utf-8?B?VkRUS2QyTGhhaWFqYzR2c1ltVklsVTZYa0I0Z3J5aG5ZN3BjSWYxR1ViM0hL?=
 =?utf-8?B?ZGVEU2E2c3hrMnliUU1wQk4zKy9IWnY5a0NDdHkyOFFnTy9BTE90b3VBM1V6?=
 =?utf-8?B?YzF5bzBpRm9FejIxVE1OaGtlNnNzT0RvcHVaOW5FeEpTaUJzYzFKcE16bEFC?=
 =?utf-8?B?Y2ZMdWRXNGQ0bnNDaU1uTlUrcHlKNFJZN2V5TUNrMkVnUmwzUnRxT1FxRDhq?=
 =?utf-8?B?SWZHVEtucmJUUkxFZ1dQZUhNZDhTa0NnU2syS0wwUlNrVGlrWko0TWFIdUNY?=
 =?utf-8?B?c1hjRGVYdGRUNHdoWWJQTVFoWXF6NG9jSHc2Z3FTQWFLOWE2VElEdVNPOWc1?=
 =?utf-8?B?Ny9OVjRLZ0djbEtLMU45ektraGxSTGZjTXAzUlJTNlZrTENpaUsyN09OV1NU?=
 =?utf-8?B?NFpTU3JuZ29TVVF1ckl4UUtqeDNoVm94ZU9nVmpnRnB4NG1HaFhFVVNQQm9n?=
 =?utf-8?B?VGRKLzhDdTZqMlVaYm5NMFRNNHFKcXgvcVptNDJPSXFyR3VXRHJYeTRqZWxj?=
 =?utf-8?B?eWwyU3BRcmdTaWZ1RWVJZXFzT01QNVVIMTJPYWs3dDNvWDdOUDF1Qm5Dbksy?=
 =?utf-8?B?SHRkRGU0WG02NHREZG1FNU5vb2tISXpwL1MrVGRqaTRha0Z5c2ZqZi96MWp2?=
 =?utf-8?B?RWRjVEdaMDdRczhUYnMvRysya0ZwMGlZckRPTThDVFB0V3Fad3pINnNvdnBn?=
 =?utf-8?B?Wk94WkRGblRYdDJxRnlZMTBmaWhGRHUxaE10bW9wdGt2aXk0SzJuZ0UvKzJa?=
 =?utf-8?B?akswMU1TZ1ZEUmRpblpyTGdjdGNQUXRJUWljdWI3VnBnWWxOUHhGV2I1OGRq?=
 =?utf-8?B?bEU2M0xaZXUzSERhR042YnJXVnpFeHo1STFteEV6K1JBNFd6OHJlcUFPd01E?=
 =?utf-8?B?b1F1QjRQdjc4OGFqVTh1ZS9nKytaSVRKQThubStlb3dsNHlIRlZTUGtmVEI5?=
 =?utf-8?B?SFpabm5aV1J0amlrd29ZVElCMjhYZnlTVkZ5ZjgwMFZmeE0vVjAvbkFqSTBV?=
 =?utf-8?Q?TAvj7oJwtbl54eHklHe0WlTLDdgfOw/v2U?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89f73d4-cdee-46f9-370f-08dbbdac56be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 09:46:49.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rsz8Kec4mTWFfE9B51kSR7oIgYIA8JfL+c3PMM6t1eB87s+PPDZ0fMdcGXSJDUXuJMhBcr8Ukt3dmBDgIghuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7091

On Mon, Sep 25, 2023 at 08:36:03AM +0200, Jan Beulich wrote:
> On 22.09.2023 22:03, Andrew Cooper wrote:
> > On 08/08/2023 2:02 pm, Alejandro Vallejo wrote:
> >> --- a/xen/common/Kconfig
> >> +++ b/xen/common/Kconfig
> >> @@ -23,6 +23,16 @@ config GRANT_TABLE
> >>  
> >>  	  If unsure, say Y.
> >>  
> >> +config PDX_COMPRESSION
> >> +	bool "PDX (Page inDeX) compression support" if EXPERT
> > 
> > This still needs hiding on x86.  The minimal hack for 4.18 is "if EXPERT
> > && !X86".
> 
> If you insist on complete hiding and I insist on allowing it to be used by
> people who want to play with exotic hardware, then this won't go anywhere.
> I think I've come far enough with accepting a compromise, and so I think
> it's your turn now to also take a step from your original position.

Just because I'm not familiar with this, is there any x86 hardware
that has such sparse memory map that would benefit from PDX?

Wouldn't anyone doing bring up on such exotic hardware also likely need to
perform other adjustments to Xen, and hence commenting out the !X86 in
Kconfig be acceptable? (we would likely make it selectable at that
point if such platforms exist).

Thanks, Roger.

