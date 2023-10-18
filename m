Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5EB7CD714
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 10:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618450.962110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt2Jv-00074J-O4; Wed, 18 Oct 2023 08:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618450.962110; Wed, 18 Oct 2023 08:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt2Jv-00071k-LU; Wed, 18 Oct 2023 08:54:27 +0000
Received: by outflank-mailman (input) for mailman id 618450;
 Wed, 18 Oct 2023 08:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4j4C=GA=citrix.com=prvs=648c180f0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qt2Jt-00071c-Sn
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 08:54:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eddf55cc-6d93-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 10:54:24 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Oct 2023 04:54:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5487.namprd03.prod.outlook.com (2603:10b6:a03:284::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 08:54:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 08:54:17 +0000
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
X-Inumbo-ID: eddf55cc-6d93-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697619264;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8++SR9oHWyHFtkBBpz0rUi4XWRaGPqfEb3q/5OOaljY=;
  b=E5cYK0Rr/sebSuyEHf22FrIw5o8Gw5UJ2r6LWFCTx1iiTWQAwtYgy77+
   7XaLF57xmkg+ifdGawCMYcxoxLojx2lmEGHhSh3nvijG0FSSiF4FmChIy
   gLg9LrfXwdov8ZG9GtB3eGajsAUDwgjEF7G9l43Qs1DCxXRQDCSzyjtHc
   w=;
X-CSE-ConnectionGUID: BYuF5mc3RneWSmQcqUDsqQ==
X-CSE-MsgGUID: MaZoInQET2al6rY+YU4RrA==
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 125918281
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:WymQJKrivjQPjL6UDcSZfvhPB4teBmLcZBIvgKrLsJaIsI4StFCzt
 garIBmOa6nYN2GhfthzPYyx80gA75fUytZkGgNv+S5hQykR8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzilNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABo8cz7egunt+rS2ddJpv886EeXwJbpK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKNEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhPReTorK4z6LGV7kkaOho3U2KWnaOwjhCkapFuF
 hAu4AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywWUGGkCCCJAYdoOtckqSDhs3
 ViM9/vJCDp1ofuqQHSS3r6OqHW5Pi19BX8PY2oIQBUI5/HnoZovlVTfQ9B7Cqm3g9bpXzbqz
 Fi3QDMWgrwSiYsH0vu99FWe2za0/MGRFkgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:RbWwNqllndkLsWZZHXR6pGcXFgLpDfI73DAbv31ZSRFFG/Fw8P
 rPoB1773LJYVMqMxsdcL+7Scq9qAznhPtICOUqUYtKPzOW2ldATrsC0WKK+VSJJ8SUzIBgPM
 lbHJSWAeeAaWRHsQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AX64VQmlVi/4sasMFR623Y+NUMijXOVfs0VmNJkT?=
 =?us-ascii?q?jM2Bkd4aQcFSJxY9/ivM7zg=3D=3D?=
X-Talos-MUID: 9a23:sRynsAXtW+fOibPq/BrltjZDMv5F3/6nDB4XoNY3hpW+LwUlbg==
X-IronPort-AV: E=Sophos;i="6.03,234,1694750400"; 
   d="scan'208";a="125918281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brsYO5iSjNBEKiGCRbgPKFzkmPjArELZQh4vRg9uVuxn+ZSTWvCHEFG35ChEOTLcaJTsyoW1PH5h5tN7mPQpJN8OSRam2EKaVwVJaHpB2UwEsCL1Xf5yap1qMP0/5ttO4uWUPqQ+SaZcl8yRUS5T8t7ftyuMnVX7Ywt1FychnRxCGrWXSQUSk4ZYy053+3BwzMEXTTA3gfLEKdHa7jWy5lrpvxoroEzYIKRFNVdT1AmAacHh5/0QjqrWTyvjSzT+4gHyB+55SkNUvjhR8plwzIfRDG+vSJxr6CaI7gkYpOI1SJWFI/BHAdG0zHEau+g3U01EOBAG6r644i4YC+co5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QtnMTXqwQJ4DM3MhvYcr94JiggEW7nNKuuL9H3pcis=;
 b=V/MsaH5bmLjxGkgZ2X3I6CAvenJkqqhfeJwhK6D+AEcCloaAptor1UVx+/PdNIq1QVqeJBhRrs9KMqvRZQ/4F5ev3pbdsUQY7KNpFegMVNYjP+VNMV7lqmDGBnWYdSKbSKJ32lPKxDsG6FPlCh90pFqXg2W0R9C4wxA0VxAV5Xw9DQkecm+Hzup5bKvV/N7SgagQWe9l50sdWTwKUACvAE3G5nHBccdT0kgSNdwJ6zvvAH1qKJD7oOrJxX4mI04jHtdCB2Ky5lBZBw8IAL+/T80vSTDPp1tmRQtzm8cDhcwZywpUwuZ0WOlojuc819qXYXldZskKwvfJvVUfWhUclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QtnMTXqwQJ4DM3MhvYcr94JiggEW7nNKuuL9H3pcis=;
 b=dn8xNlTTZlBGGKTmDImxlu+oYAYXvjxp1HVIIlJswkt05cpyWUT/pi4aqtHSALUj0SmsEl/JVvS9tsePYdY2AvWuHej/lrqSquDb0wCm/EHJfe1o6uwo4pt4f1ZMDoAvYYHZEcqyKtR4W7+I+EEtdHY15y6pId6leuGZdo3jvU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 18 Oct 2023 10:54:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Henry Wang <Henry.Wang@arm.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.18] iommu/vt-d: use max supported AGAW
Message-ID: <ZS-dM2TFYefJ272h@macbook>
References: <20231017130943.18111-1-roger.pau@citrix.com>
 <c6e38ef6-87ef-d1f0-720f-4db6d307f667@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6e38ef6-87ef-d1f0-720f-4db6d307f667@suse.com>
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1284f8-3225-4038-f72d-08dbcfb7cfb9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f8io70FW7CUqrH4yhZVHdPHqiuSzEGQH6DT/MwObomPyfCgG4AYCbHFPkh52UpBQqkrrXwC/xnn2rnkSFca4ugrBAkOvYOVpoy/YGoi5yB0KOVClEmETwstNHxwRExeIV3NH/XkqNff7h/DBs8UF6PyB9HKiGrjfVC4+FWg6WuYrXop/Rv8TjIhKCXv5sK3eaZ97Dmh2EMPwymRIzb71nVMN3jvgC/bkkS0ypqayfFR3AGIuB2RLBlK6TwPW97pFUwf6fR174DaK7RPeTlNax/zpo/1Zg8wdT4tcel6Uvo5KUOQKC/DV9ncpY49hjOU3tmSddPlpLO7Xjsd7v976B6YjktN89bahacC8fuGsZNlZ2EAkhij09rhZQ0JT5pHCXsuo2xqXfSSeds80U3pxo71nix6TWZxgtG76ClyuFAczUvnwHgZ//UirK7+RjjhEzw8G1SImYPATyc7HNesNISRy4EW2aLZNphE7ASUh+cWS+AR3WWid1Udg+y7qIUy+w+jYKrbiEx43bBjBnEcn0ri6CPgV9bq0y5bU0CSGaL4ypYkrq5YX91pWMfOFokHq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(26005)(6666004)(9686003)(53546011)(6512007)(6506007)(6486002)(41300700001)(8676002)(83380400001)(2906002)(8936002)(4326008)(66556008)(5660300002)(316002)(66946007)(54906003)(6916009)(66476007)(38100700002)(478600001)(82960400001)(85182001)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXdEdTFPbkVYVTlVV1NTZWx2eTVkeVdjS2d0T29XdEJvTitDRE1Wbit6V3Vv?=
 =?utf-8?B?VEgxeWRKSElJeTExcGZpYnA5MDFoNEtoUk8zUnBFODN6U29vQXlGT2dSclJF?=
 =?utf-8?B?Q1MwNHliZzBuWE5RUFo0M3kyYldzbStJWUh4cHJEUTAvUTF4RVlHb2xTN2dM?=
 =?utf-8?B?cktLYnM1ZDkrQ2F0aTIxbklVN2hpZkMrVXRST2ttMjB4TUkyOFNtSGVVYjhK?=
 =?utf-8?B?bE82UEVrOUx0dkErLzlsd09qZ3JqVzMwMzZVYjZGUnIveHNiVlBtTTI0VjBB?=
 =?utf-8?B?SEJkcnRJcEc2NkdjU20wRTlEanJBSWo2K0dWSGtjWWhIUWE2S2pkTlMyckhD?=
 =?utf-8?B?YXVHUmJJeUYvZzVsb1M0Q08xNFkxOFg0NjlOZlFOb1ZnZGdsZVJaVENYNWJ5?=
 =?utf-8?B?SmFsREZ5cDczRjRYdzZleUZtcDIvZ1VRT1l5b29kME1uYVFmZGNETGdid1Ev?=
 =?utf-8?B?SWR2dUZWZml2cTcwVVZGOU9sUENMSStNL2pGS08xWkhwbkczdU1sTVdrWkFr?=
 =?utf-8?B?eVRjVjRrOGNYTEpFVW5Ec0JQVDRaWU15SzduMS8wTzVFWWcvZmJIY3N4a1oz?=
 =?utf-8?B?UXl6Wk1yZFVRSUpFMm9aOG1hcmdKVTBGQS9xQitkdndUNjR2QTNiSkNyVzZL?=
 =?utf-8?B?NkVVNzB3bWZHcitsNzNpVnd3anR4Y000cndydGV4bWkxazQ5RmQveWNGc2ZT?=
 =?utf-8?B?amJHRVZTbEZocGF5NDI3UVZ2bEtZRFpqeXFjWnlUQnV1ZjVoRjhuL3dMUmEy?=
 =?utf-8?B?R2VWSDVSN0tid1lRU1NjNkhtdlBlYm53OHZtd0UyVGI5M0JiUzJRSmNScStq?=
 =?utf-8?B?NEpxOTlURUoyUnRZREpac01nSFlBSzg4WjZhcFY2ekJZYjR6QUFndnVDci92?=
 =?utf-8?B?bGVUT1ArYXd3dkdaMnArUEw3Wk1SMmQ5V1k5N3VwSWVGT1dpMS9IZEhwRG1Z?=
 =?utf-8?B?RlRJZE4zcDNyN291aUFLMitmNGhpUElMVmhja0FhVDBWMmNaS2tXazJ0SGgv?=
 =?utf-8?B?VWYvZDFQREFrdVExVXRjNlZReXBtbGpURnhvZ3B0a212eWlzNUdpTkdhc3FI?=
 =?utf-8?B?eXZ0dU40TWsycnh4UkkwV3dqVlNxMmNVQUFna2RzUXlUNXVzK2xXa2JPdVY1?=
 =?utf-8?B?azh4YWRqbCtTWE54bDdtWG1pZGVQVmQ2eGJZeDM3Nm9vNGQ1bkdJekxXZ2Nn?=
 =?utf-8?B?UnU2V014ak9FRjJuZWhxTFdPVHJ4UUNyUklDNC9SS3BsK2ZUZXdvNVlYWURW?=
 =?utf-8?B?NTFyV3R6TnM5YjZoUjVEd3RDRy9xaU1XT0c0YnRWZ25qSll2Mmp3RDZzekFw?=
 =?utf-8?B?QUhmMTNLWmF4SUJ5UER0VmpvcjBBaTBCbWR3bFZROS9FekVYU0FwVDd0cDVP?=
 =?utf-8?B?ZFA0THBaUFlCT285Ymd1eXNFcWlVL04yN05sYStpeXE0Nm01WkJ5NEpMUmtv?=
 =?utf-8?B?SmVsM2xQZEVEQjBQQkRkM1FJMEt2MTQ4R1Y5MTM1Y0d4eEdCcFhyZ0hSdjky?=
 =?utf-8?B?azVIZ1ZNemdhSVR4MWI4UXYzT1lmUmh5dFlNQ2NvZmpJYWcrUXBlVDZiUlFD?=
 =?utf-8?B?UDN2bkRvSVl1bmVpTHFSRjZZK1dHb3FQcUdvS2xoTG5RRGpxK2swQnBqcGk2?=
 =?utf-8?B?a0xSL3NMdEkwV2FCQTNtTjFNa3BqVE4wQm5RRzJwU25kVk1udVJsTGlTdjBx?=
 =?utf-8?B?aXQwcHdNU2lraUl5QndjSDNwc2pkQ1VOZzNTTnQySUYzNlQ4NUJmTmtjUmw3?=
 =?utf-8?B?UUtTckNYeUxUdFJDOS94QVhMVE13WnR0TnhLWGpmb0dGT2xQVjk4QUlqUHZ3?=
 =?utf-8?B?Vm9LK3d3OWx0ZkpkMVhiZHhaN2FML2pibld5QlBodE9ldHlNUkdINEt5cGlC?=
 =?utf-8?B?a1c0NTlwRFg0aW5nWnNyRldxcU9IWC85T0JDd2RtcDFlWmdLRmdYRnZINGhK?=
 =?utf-8?B?YXE2Z28wNWJ0R1AxVnkzMzhSb0tYZWY0NFNyRGprK0g3Ni9lWURoKy9WN0VZ?=
 =?utf-8?B?UUdTM1lEOUhIVkwvTTRVbUttREhaQTlvbk1YS2V0ZEphclpYYU5ZY2NQQjdu?=
 =?utf-8?B?WnhLbzNlKy9sdHBPZWVEa2NyNXE1RGptb2ZFYkgxMnRlU3NVOHZoRjc2MXN2?=
 =?utf-8?Q?CuMA1L8a3I30r1rQRVdFw65tZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tXVLnrSuzYYE9SswO5D7nIUwu4B3CHgrFMUn1b0EcWPW8KR/OB1xiCKGnJIrivVzLcr1eqeGuS9pirzG3bOb/V3uP3AXCSnnZXFJM0ShPwjoYvEmG7MQZb+44hH3VrabcK1TRub0qVB5VkzXvuwMNQNaZ3FUP2F3IweGO6ayd3afS6QZLqkWTZ6C5fi+4cwt5pymi05OBAh42G7yGQtc6I64nPpLHGqXzjrlJDsCkyNcaQpVZQKg/U1cF/9lxawDdI2I4MsvZf7AF0DqPC6WlQprliGpIYmZda8ZNOF6UKzJEB4bXMZPwsHLVdslWK2HADIkOKB7nKoi9TG59/zj+injYMCYIGUBlIw202oiBYZBBTawqHicRfDZ6iu47MdsSUQbLnrGNwdrH1s6AqJvmk4YpWX+hMrrMu1iYz6Bbs548ivuiZNYjMU+8/AYXP/RsJ0OIs00GmI3pbO3PaY2jS0QFXntypkqBksEqsBcple01uTZ7SZPxRBA0w/KfqpuCS+WBjz4dIEYbeEHQIM1FYO9tAs2WfYAYtvSuKz5EniHOBegnD6F6SbdN+OLexkCORSyUj6PZdUZyA4wJLSOzNjf4XQyZxdrl9GepllzIAxzUhsRzCFtsXCXi47bIIlK9iM5LBDy0dixtBxmyiikT10hoyAmS/WzasFLIDjXoOsA7RBVegoJlPEVrVzPyt1shuPL2X9T+q8/gL8hxqAuzLtoz+kqOiOPiwNO8w61p987j/9uAps4OwCYZrXhPNEMgpmw5CdmEvg8N0CSeh2+PGnQw80e9Fy1wdlXZ5ZvHdQl0BuBdji+/FfJ3ZlKavW5RNGDqVJvisO/eassMQAOKxxm0geUAsE9F6ldAsodNBU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1284f8-3225-4038-f72d-08dbcfb7cfb9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 08:54:17.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAu19gdR4yf2IVRpxwhk9FDySBfmszZH3LFLOYT/E5Rsu6i1x4nt6EsEMRZP+p03IQtm9qwzIiTcSGT12hDV0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5487

On Wed, Oct 18, 2023 at 09:54:15AM +0200, Jan Beulich wrote:
> On 17.10.2023 15:09, Roger Pau Monne wrote:
> > SAGAW is a bitmap field, with bits 1 and 2 signaling support for AGAW 1 and
> > AGAW 2 respectively.  According to the Intel VT-d specification, an IOMMU might
> > support multiple AGAW values.
> > 
> > The AGAW value for each device is set in the device context entry, however
> > there's a caveat related to the value the field supports depending on the
> > translation type:
> > 
> > "When the Translation-type (T) field indicates pass-through (010b) or
> > guest-mode (100b or 101b), this field must be programmed to indicate the
> > largest AGAW value supported by hardware."
> 
> Considering SAGAW=3 was reserved in earlier versions, and considering SAGAW=4
> and higher continue to be reserved, how is one to write forward-compatible
> code? (In retrospect I think this is what mislead me to wrongly use
> find_first_set_bit().)

Oh, my spec copy still has SAGAW=3 reserved, only bits 1 and 2 of
SAGAW are not reserved.

> Furthermore, which version of the spec are you looking at? The newest public
> one I found is 4.1 (-016), which only mentions pass-through, and only as a
> 2-bit quantity. (Doesn't matter much for the purposes of the actual code
> change, but still.)

It's an old version, 2.4 from June 2016.  I've now picked up the last
4.1 version.  I indeed see the changes you mention, so will update the
commit message accordingly to pick the wording from the new spec
version (even if we don't care about the guest-mode.

I'm kind of confused by the removal of the guest-modes, but we didn't
use those anyway.

> > Of the translation types listed above Xen only uses pass-through (010b), and
> > hence we need to make sure the context entry AGAW field is set appropriately,
> > or else the IOMMU will report invalid context entry errors.
> > 
> > To do so calculate the IOMMU supported page table levels based on the last bit
> > set in the SAGAW field, instead of the first one.  This also allows making use
> > of the widest address width supported by the IOMMU, in case multiple AGAWs are
> > supported.
> 
> To truly achieve that (with the 5-level spec), ...
> 
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -1328,7 +1328,7 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
> >      /* Calculate number of pagetable levels: 3 or 4. */
> >      sagaw = cap_sagaw(iommu->cap);
> >      if ( sagaw & 6 )
> > -        agaw = find_first_set_bit(sagaw & 6);
> > +        agaw = fls(sagaw & 6) - 1;
> 
> ... the mask here needs widening to 0xe. But see my forward-compatibility
> remark above: It may need widening even further. Yet I'm not sure our code
> is uniformly ready to handle levels > 4.

Hard to tell, I'm not sure we have a system with SAGAW bit 3 set to
test with, will have to check.

> As a result I think we need to
> further alter the use of context_set_address_width(): We don't necessarily
> want to use the maximum value with CONTEXT_TT_{DEV_IOTLB,MULTI_LEVEL}.
> Specifically I don't think we want to use levels=5 (aw=3) there, until
> such time that we support 5-level page tables (which as it looks right now
> may well end up being never).
> 
> Furthermore just out of context we have
> 
>     iommu->nr_pt_levels = agaw_to_level(agaw);
>     if ( min_pt_levels > iommu->nr_pt_levels )
>         min_pt_levels = iommu->nr_pt_levels;
> 
> With fls() instead of find_first_set_bit() this won't be correct anymore.

I think this is correct as a long as the context entry address width
field is forced to iommu->nr_pt_levels.  min_pt_levels needs to
reflect the minimal paging level used by any IOMMU on the system, even
if smaller page table levels are supported by the IOMMUs those are not
relevant given the unconditional setting of iommu->nr_pt_levels in the
context entry.

> Yet looking at the sole use (and depending on the resolution of the other
> issue) it may be a mere matter of renaming the variable to properly
> reflect its purpose.
> 
> Taking together perhaps:
> - nr_pt_levels needs setting to the larger of 3 and 4, depending on what
>   hardware supports, for use in non-pass-through entries,
> - a new max_pt_levels field needs setting to what would result from your
>   code change above, for use in pass-through entries,

It needs to be a per-IOMMU field, as I would assume IOMMUs can have
different page table level support on the same system?

> - min_pt_levels could then remain as is,
> - for the moment we ignore the forward-compatibility aspect, until the
>   underlying principle has been clarified by Intel.
> 
> A possible further complication then is that we will end up switching
> context entries between different AW values. That's not an issue when
> we use CMPXCHG16B or transiently clear the present bit, but our best
> effort fallback would likely be of security concern then.

We would need to update the AW context entry field unconditionally in
domain_context_mapping_one().

Hm, it's likely more change than what I was expecting to perform at
this point in the release, but I guess we cannot ignore the fact that
SAGAW might now have bit 3 set and hence passthrough mode is broken on
such systems.

Thanks, Roger.

