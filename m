Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056E7CA9E5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617581.960297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNpm-0008N5-11; Mon, 16 Oct 2023 13:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617581.960297; Mon, 16 Oct 2023 13:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNpl-0008Kh-UV; Mon, 16 Oct 2023 13:40:37 +0000
Received: by outflank-mailman (input) for mailman id 617581;
 Mon, 16 Oct 2023 13:40:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsNpl-0008KZ-4G
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:40:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 941788ef-6c29-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:40:34 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 09:40:30 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SJ0PR03MB6698.namprd03.prod.outlook.com (2603:10b6:a03:401::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 13:40:25 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 13:40:25 +0000
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
X-Inumbo-ID: 941788ef-6c29-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697463634;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NUpW2Q0zd/reHswMQCDdMTUE5CBPOExnXchq41OZF+4=;
  b=RKokarn/5aFM5tI5HGXj+dYnpewRaihZfN1XmFHRjkn+erppS0azqpqn
   zATUC+8NQT2cJrf1Dgz7Wn5JBxjZjjCUoOA4CbG3TiuXbp6K20O2mVJuh
   e+qfZC8DvG7o4R3EbsP3XJNXFVTjkIpIeqKgKoiw+bE74tnZXMhWZmuL4
   k=;
X-CSE-ConnectionGUID: SiiMYeHxRpe25mKeSmCT7Q==
X-CSE-MsgGUID: gohBbLAiRtC9CG3WVQTw7A==
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 125703803
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ceVqc6psCj4a0ELTuLhsoCgfWh5eBmJQZRIvgKrLsJaIsI4StFCzt
 garIBmBOKnbNmv9e40kPNni9B8EvpLdx4dmTVc//ipmRH8U85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzidNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAsMbzWyisKm+qq2ELRppckYKeLXY7pK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKMEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhPS+XjpqYx6LGV7mMUCDcccXK6m+WS22WRAO1hE
 nALpQN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq1/7OZrzq0NTISa3ELYSsJTwwt6N3kvY11hRXKJv5hH7S8itndEDT50
 TeM6iM5gt07lscN3r6n9EvGhBq2r4DVSRQ44ArWWG+o9AJ/a8iuYInAwV/f4PVbLYffTUSbu
 3MEmM+24+UHDJXLnyuIKM0tEbez9rC6OTvTqVd1Gt8q8DHF02W4YYla7TV6JUFoGsUJYznkZ
 AnUoww5zIBXFGuna+lweY3ZI8Y3yantE/z1W/aSacBBCqWdbyeC9SBqIEKVgWbklRF0lbllY
 M/CN8GxEXwdFKJriiKsQPsQ2qMqwSZ4wn7PQZf8zFKs1r/2iGOpdIrp+WCmNogRhJ5oai2Pm
 zqDH6NmEylibdA=
IronPort-HdrOrdr: A9a23:eB4G0K7QyUo/m+kHxAPXwD7XdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsyMc7Qx6ZJhOo7+90cW7L080sKQFg7X5Xo3SOzUO2lHYT72KhLGKq1Hd8m/Fh4tgPM
 9bGJSWY+eAaWSS4/ya3OG5eexQv+Vu8sqT9JnjJ6EGd3AaV0lihT0JejpyCidNNXB77QJSLu
 vg2iJAzQDQAUg/X4CAKVQuefPMnNHPnIKOW297O/Z2gDP+9g9B8dTBYmKl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3AOGB472rcX70CWqxIkWCcBZvmUfskc1jswVfAGVe?=
 =?us-ascii?q?1Uztsa7CuTHSsp5oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AZiwtbA/Z6BUY7Gs90RZE3pKQf8hv446kLGkMq4k?=
 =?us-ascii?q?t6uKrbhNOAguC0x3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="125703803"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdT3O7Lie5rLAXWk4jqnx2yuRVb3PxbefQIFkvcgHMjJAi/wRH4e6T+jL8DBi17FxlNrU+wxWi7Pg5bhEE9WtIatBRFDH1uMDmUYS/J4a9o5bC92SdIu2lkV3u5AuqBKlI8cdInnXIAkTRljlhXwpoWzr1A0tn+QlAF6JqHweXsc859/ekI29lInkk3uZMCw+SWQ7jLxWMqv+1caR0q8NiZSqKKu9Altd6XchVY6vCJ0xuybcli8FTbJkDouJ48snDWwKTgctdlA7fv66R8aqtTSzs4TaIIBw1Q4Wkf06LsKfk2fc0J9VqH35YAtBJF9tODeuQON5uTVUHc9QZ6Kzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DWtfsZ/w1ncuaqwetCo4dV9h3I+NrmN94N+nh8cra0=;
 b=IpwP+gGSNqzPsymik0GaQA9G1T1U/KmNySjjSk9cHI8oSa+dfS+ll1TGGaCHuvM0KRYjezuCZQa9R1nX9B5dNV6urjNbIP6v1MfBJmS1fRNOL097LhdtibbSzBzhbYFgqL6goiIjucJ7e+eksSt2SfjanSjk6CxMy9UnwnpwyE6eP4O3jYJSHGbhImkmosSJ+ZQI+iMb/vf1//O/Fnp8QoN8yC3jikgc+v7KwGxTNm+YBX3WSRtMpo/aI5g7Hd4hrUmyxDbt+qm48EIgY82XPmDbcwX6YAigeEsmHu2Bszo0irC95y90IiGDVPXKVqV3dzqKowmDxvF2UprTTpNqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DWtfsZ/w1ncuaqwetCo4dV9h3I+NrmN94N+nh8cra0=;
 b=ZsvxEz2Ry+gx7OBqm3dyO63YLxBERyNqVMleR6DJrqF2ro5SvYdJrG4P4TrJIkC6wlrCIpxwN+b2cdDW50iHzv21shf5C8pniEy6aI6MQfREZjPEVvww65+Fst//Xna7jhNNPqd9Kn+mwaYezE/wICnf1L8TlQ+yZF4QXwRyGIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 15:40:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Julien Grall <jgrall@amazon.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a
 common Kconfig option
Message-ID: <ZS09Q8DU-1_ATw1j@macbook>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
 <ZSAnX3xjM91-tYbE@MacBookPdeRoger>
 <ed43fb9f-590a-fd39-ba87-b45acddd19a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed43fb9f-590a-fd39-ba87-b45acddd19a9@suse.com>
X-ClientProxiedBy: LO4P123CA0563.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::11) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SJ0PR03MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fa3190-a6d4-45a4-18cd-08dbce4d7382
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	41yf0JPfn+h+WOHKt2jhwi9CC3A15ObP4uiH89FJVsdphblBupz4reyLz7T4E+itsl6E9TALFdijR8TtIHGxAABi477ZHkqndxjMfm97lWHG5inb0s9pFZoMysBDw6KErZL34Nqtgv1g4LUQ1Oe8i2ZuQPtc1rwbIiRYpD+wR4s8hWTYfksgHQtUOBjnJAp4pzzVCKtiEbnmltW9C97seuDqcEKdtEzY0rKcCYadNLyMBOT36vtvH/EokCf5QF9VGpuabn+tJpQjwbuyRSV586JsUghYcsrQZGnnU9tbve/raDra5lev5gijPOgJKSbZjSKizEiGO6p6SeNuoYvh7moQvKTijc3QC2eq2vVLLUtB0D8oxUZCg18W7GM4fz7zchKIYtWZyq7jsb4rjA9PaFSMdHi5RIivgxobDtPpIPDxLXWs0w6gh7FXQcz6H3WCAHySunyfp1Gv9Lbc9TfZDPGBHiJYYUFab1Zhzm2gpYEHGSAHMrqqrGDZn/s2R+dHeNgQ16tMQk16f6NJpOvDgb+uJcGa3fe62I5WWE6vgeDEOZ7QkLsb8JOMkVWe4YS3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(85182001)(8936002)(6506007)(5660300002)(8676002)(26005)(4326008)(86362001)(53546011)(6666004)(82960400001)(33716001)(316002)(41300700001)(83380400001)(66946007)(66556008)(6916009)(478600001)(6486002)(54906003)(9686003)(66476007)(6512007)(38100700002)(2906002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9BY0R5d3RtK2x0WW1MU0d6MTQ3cTJVa0Z5cUpMYWJTcGI1d1lsL2cvbWxT?=
 =?utf-8?B?UjFpWDNmQis5Z1FidzU4VnRGTUtaQXNiV1ZpVjdLK1RNR0NaTXF4azV2VWlH?=
 =?utf-8?B?L3gySGQ1dTQzUXl4ZUpCV0VjVUVzQ2hLT3MxMGRSTGF1WlMxMzFMbUl2eFhS?=
 =?utf-8?B?a2g2cFRxdzExY3RNd09ISXNzbWZFRldsNWxhWEt5WThJeXZmNHBDcTAxcEdN?=
 =?utf-8?B?ZGt6QVBDcnpTR2ZuTUVrMW5YWEJ6MGw3NUxMajhSbUJPcCtydmVFMGk5cC9R?=
 =?utf-8?B?NHJnekFjZ3RSZlByaFRGVG9wdExMYTU3L1VDc2NydHBuTHYxQVlMM25qMmxa?=
 =?utf-8?B?VjI2UjRsSWlBb2tsOHNKZ1VhUDBNYk1ZS0ZFYTVlY0s5ejNNU00rdUNIOGVy?=
 =?utf-8?B?bWNYN3hRYXh6VytWWEU1eEZkM294Z1lMUXVqZW1UQTdSbHNaL1pweEd3dEVS?=
 =?utf-8?B?c0lsNUt2aDQvQXM3U05WR3ZTS3R0RzR0d2hXR0NzbzRQWVFlMGgzb2hoSHpP?=
 =?utf-8?B?VzBRU2NTVDBCcStuSzVUUFA4enZxajM2TmJFZXBhRjdWOW0xL0dnYTN1SWxy?=
 =?utf-8?B?TnIvc1dZdm4rVjhOR1Nibmx4Zld6alQyeXNDOC9YN29GQ1BCbzE5L3B2d3lU?=
 =?utf-8?B?WVlsejRHUUd1UG4wNmFTSElybkdrc0RaUndUUTBGNUcwTDZ5bWdoNE5MM2xj?=
 =?utf-8?B?b3hmRWFsbldUMTVDaFFCelZFTFo1c094MzVFaDJFR3F1N0NidXUrMU1ETUpr?=
 =?utf-8?B?aXBXTXE0L2xPU0NoQkJLSFdoRjR6dlhHSHNDTmh3MklKQnhnakpOUHNoTmRo?=
 =?utf-8?B?ZlZ0YWFhQ2xDYm53WERyS1lmSWxqQUVlbWlBVzMrakgxZ3BSN1huQnp0SDRZ?=
 =?utf-8?B?Q3dlMWNINHdIczZiK1VBY3U0UEpnQnVmd1RlVVVFOElnTGZzSGgxUlh4Rnd3?=
 =?utf-8?B?OWU4ODN3L1hEYjVyZE5kUVBackE0SldleHhCUGNWQzFBb01JeWZza3gyMk9M?=
 =?utf-8?B?RUc3c3pFQ1JJaWFtdW8rNGY5RG4vaE5lcWpkSlQvSWUrYzM5RWFDcUpDTEJa?=
 =?utf-8?B?SkpOQ2l1K3FzcndBVWczL3VaTkdGVHgvUnI1QUhyb2VHVUt1Y2RJK2tPT0lp?=
 =?utf-8?B?dUZxUElOSDQ0QlQwQlpLT25hRnFEKzlRZHRDNkF2bC9lSmtLUmpnKy9aZW1C?=
 =?utf-8?B?UHNOWDYxa25DWDZSL3pPNFlzUXBOM2doVHBkaXl0THNKVUJsOGlxazVvMFUw?=
 =?utf-8?B?b1ZqUjJ0Q3pwdFZRclU0L1JLVjlTcmFPQk1IU3k4QVFoY2pPUGRIbS95bG55?=
 =?utf-8?B?NXZqQUFmNTRaRHdmN1B6aTVEcmZ6K1hZWTQ1NFlrZjd5aVhnVG5DcGdscVNZ?=
 =?utf-8?B?U3R5Zmt4dm9ZeGFFenVnNXdaeENidWhBVFJVV0c1NU00WXFyNkk5YXp4SUh2?=
 =?utf-8?B?MCtHeHBjNWwzVXBtemFienJNMmtVR1ZzQ2VhektUdStLZ3pYOHduTzhLZTlV?=
 =?utf-8?B?RFZvY3U2Y2FkUWQ1Y2wrMEJGZnpRVkZqdWxoSXVLa0J4SlFtNmxPVU9QNk96?=
 =?utf-8?B?My9IL3Vpck45bGc3R2EzRXAxcUxBQ25kZEtYbWtiTEtyWGh6UExHcW9FdVEw?=
 =?utf-8?B?bGRzc3pGSVE0TERkN2lacElLWnBoWnRDcnFRYWw2MTZrVm42Nzd5QnJvNnht?=
 =?utf-8?B?ZEF6QW1ZZXc5TnRSNERNYjVocGNjY0NwTVl2dVorL290VXNYb3dvV0lJVW9B?=
 =?utf-8?B?OHBDbSttZkxVUWJxdVltL09qNVRQaGZMd0JFZDRNQW5UaXEvVDYyTTNKSVlS?=
 =?utf-8?B?ekplQWdQQ1gyb3VjUEo4ZGpDZ09EZDdlMERuUFVLTTFiNUFWWnBGeFVJQ3g5?=
 =?utf-8?B?aUZtT3ZLeWlDTzZ1dnF1YUNyYTNhak5QeUtnZ3RFRHFLWXdXeVFDTHowRGZY?=
 =?utf-8?B?MGRyMUd6dW5IUklMamsvL2dZTlZXaFBsSloydUp6eW9hcGhqN0EwN1Z0NWJC?=
 =?utf-8?B?MCtIOS9qaFB5QXhUbEI2M2J1SzVYK1M0cVVPbzRueTI4N2htUmYzaklJNWRi?=
 =?utf-8?B?cDN3aGJKY2Zudkx4M0cvZW93RVpTL3ZWcUx4MkR4aWtOZmdneFNSTkxiN1Rj?=
 =?utf-8?Q?D0SjGgRDE/9NJ7a7HA43QFBo/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?STkvSnd2eFhvYnJGdVIvSEtYcU0vRndQb1NhcmJOVE01U3dJSGs4UXZpRWQ2?=
 =?utf-8?B?NzZxTmdoUjJ5bS9rMWRCYzJiVDdDZXRKL1NnRk80UlZCYXFlUi8zRGFJbEUv?=
 =?utf-8?B?QllNTGhIdE9udE9VZG9EK29PTC9CcHo1dHlwZ2VRVGVKQlZaUitnRUJPSm5Q?=
 =?utf-8?B?YmF0amNnZGtmL3pLSHcxeHBpeDhZSHN5WmlyMWdGbVViOVBQY0pnRnp2clRJ?=
 =?utf-8?B?enVhM0lvVmU2VHBBZTNyVjBwM044dVZjSW9DK2pCVEFDblZuZXVjeGl0YXdR?=
 =?utf-8?B?ZGhCM3p4Y0xYaFhMS3Y2ZWYyWm14S1FsZkY2WkM1akRYbzE0QXR4U28xT0xu?=
 =?utf-8?B?RUZTK3B6bW9zKzlFUDRjMGNmWVFkaWZpUUlrWm00SzU4aEhUQ3FsRTJ0cktP?=
 =?utf-8?B?dTdKRnJIUHdobDMyZ0drai9zUkQ0K211d2ltZERJekRSMWVhRzFSVU1RcENu?=
 =?utf-8?B?NTlCVVJNb3BQMklETlRRMHludHlKOEMvTWZFUkkyYURzYkdDenpheC90aVBY?=
 =?utf-8?B?QWxwaVBJTHR4cnlvOXI2OE94dDJJUTNiR1ZLTVVIU0ZzaXM2NHA2NlF4YUlK?=
 =?utf-8?B?d3RENzlzKzdtMERBWXdPYUVtMHpjK1Y4ZFQrRXJPY0RSSG9uSFNZemdudjh4?=
 =?utf-8?B?d1czU3VSQnFkYW1MaEQ0SkMvNWdDQmFwSUk2cTREWVlPTGlVUVNTbjdra0tI?=
 =?utf-8?B?SkpmajVoeWc2TDV1NHM3akdKd2NnQmVTSW5YcnlPZURhaFpFUFduY0dyb3BN?=
 =?utf-8?B?cXJnT1N6cDg4VkllU1hSd2YyRFd1NXdZajFlMkNwSjV0eXBQWE9ZUWtyZGpk?=
 =?utf-8?B?MGR4cUJTM3E5N1c3VVBkTHFPdmxFY0NTNE9sSG9QbkMvQ1ovaDlldi9GMy9m?=
 =?utf-8?B?Y24wcnVWdjNrSzBHSzJvTGxzQTYwV0RpNTQ3VmRJV1psMVlnV2lYM3lrbTUz?=
 =?utf-8?B?SFczTzFSblY1TlorZDhHU3ZXZnFGSmhaVWU1amhLQmlsT1k0RE1UUG9xN3d5?=
 =?utf-8?B?OUc3c2dIbVh0dWFLMUxwa3FUd0h3YlVEdzhxcXNSVjdlc0JZM1k4TTVJOXlN?=
 =?utf-8?B?YlY2MW9PcEVoYnZ3ZTdOWFJxdWtnbERVaUdtUW1ZaGVoQ0FneGtHY01lOTNZ?=
 =?utf-8?B?QmI3T1JOT2h6RlZtUGZNalk4cE14Mkc5MWhWeDc0UHJlSUNHOUwyR2pQeFZy?=
 =?utf-8?B?SzljbHVHR3haeTUwbjEvRGU2MEZYKzJyTnY5Q2pPa3NTMkpEUlpPNFRhdjZo?=
 =?utf-8?B?bFRvc2dHY1ExMkg2bTNTZ1VzdDFYeXViSHJQbVZDV1RyWHpQeG9lQU1PMHpu?=
 =?utf-8?B?dkhnT3Q5dkF1SUpJMEdtTVQvWjI4T0J4a3VEN2FiL3RUWHFFYU0vUWVYQitj?=
 =?utf-8?B?dXBydVVsZ0x4cXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fa3190-a6d4-45a4-18cd-08dbce4d7382
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:40:25.1193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hP67+ToFTwsvAlOd5O+P3yhav2eMnsf+hCJeMW33/dcDEzeU7Har1TjkyiXoExhUjOlwizzLwAI9Kqkfi4jHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6698

On Mon, Oct 16, 2023 at 03:19:22PM +0200, Jan Beulich wrote:
> On 06.10.2023 17:27, Roger Pau Monné wrote:
> > On Fri, Oct 06, 2023 at 04:09:19PM +0100, Julien Grall wrote:
> >> On 06/10/2023 15:44, Andrew Cooper wrote:
> >>> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>>
> >>> Adds a new compile-time flag to allow disabling PDX compression and
> >>> compiles out compression-related code/data. It also shorts the pdx<->pfn
> >>> conversion macros and creates stubs for masking functions.
> >>>
> >>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag.  Despite the
> >>> illusion of choice, it was not optional.
> >>>
> >>> There are ARM and PPC platforms with sparse RAM banks - leave compression
> >>> active by default there.  OTOH, there are no known production x86 systems with
> >>> sparse RAM banks, so disable compression.  This decision can be revisited if
> >>> such a platform comes along.
> >>
> >> (Process remarks rather than the code itself)
> >>
> >> Jan is away this week so I want to make sure this doesn't go in without him
> >> having a say.
> >>
> >> While I don't particularly care about the approach taken for x86, Jan voiced
> >> concerned with this approach and so far I didn't see any conclusion. If
> >> there is any, then please point me to them.
> >>
> >> For the record, the objections from Jan are in [1]. If we want to ignore
> >> them, then I think we need a vote. Possibly only from the x86 folks (?).
> > 
> > I would be fine in leaving the option to be selected if we knew that
> > such x86 systems might be feasible, but so far we have seen 0 x86
> > systems with sparse RAM.  That said, I don't have a strong opinion, but
> > the hiding on x86 seems fine to me.  Interested parties can always
> > forcefully select the option, and a case can be made to make it
> > available again on Kconfig.
> 
> I find it odd to demand people to change source code for aspects like
> this. The very least I'd expect is that BIGMEM configurations (which
> I've never seen any production use of) can actually also engage PDX.

So we expect BIGMEM to have sparse RAM regions?  I would have expected
systems with >16TB of RAM to still be contiguous.

Thanks, Roger.

