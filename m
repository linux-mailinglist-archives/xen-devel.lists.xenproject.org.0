Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8C55184AE
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 15:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319586.539884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nls9N-0001Sg-0R; Tue, 03 May 2022 13:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319586.539884; Tue, 03 May 2022 13:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nls9M-0001Q7-Td; Tue, 03 May 2022 13:01:08 +0000
Received: by outflank-mailman (input) for mailman id 319586;
 Tue, 03 May 2022 13:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nls9L-0001Q1-Aa
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 13:01:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14a76436-cae1-11ec-a406-831a346695d4;
 Tue, 03 May 2022 15:01:02 +0200 (CEST)
Received: from mail-bn1nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 09:00:57 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5647.namprd03.prod.outlook.com (2603:10b6:a03:279::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 13:00:54 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 13:00:54 +0000
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
X-Inumbo-ID: 14a76436-cae1-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651582862;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Q0917hcEFf1HWW3DvxSrw2xDs9UY6p3OuHnVBDbWZsc=;
  b=JlhGDS5HwFAP21Rgznfxjso1qJIfpl84/UczY5jQEVJAAgP3G0VcRbzh
   t6fpq9xky+u3M1YcQbkZx7U6QK6C6a0tPEenuFcwGHoZt6esO4dlBWCzF
   HagAo5/a2j5Kry2Aw7eWXRLQvmwSoHGzapsX7cFsD5l3U3Fl6m0U/HrNh
   Q=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 70485292
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1PUgr6ycqYAzeiiB0Y56t+dBxyrEfRIJ4+MujC+fZmUNrF6WrkVRy
 WpNUWCFP/jZMWqhctB3O4Wy8h4P78DdmIdjSFdoqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12YPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqZ60SBcPA/z3uttNAhAICHojPq5CweqSSZS/mZT7I0zuVVLJm68rJmdveIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeGuOWvLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianL20F8gPPzUYxy2KM5RJP0b3vCsr6dtq0VcByxkmgo
 H2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM+e8CMU/4QCJj6DSugCQAzBbSiYbMIB/8sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46T8ZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:4wZ186F9Z2fi8tt9pLqFdJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+zLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfgWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkloJk29Tpb+CUlpAZ/yHsMceg62w
 36CNUYqFhvdL5jUUsvPpZ3fSOIYla9MS7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.91,195,1647316800"; 
   d="scan'208";a="70485292"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEC4jlbQi+UNUHO7S/aLtTstnl9davxZ0JdiaLK42nFTPZpovnlGH1Zt2kBkqUZzGlSMAEex60Iq0dH8jpjnBTR/oLn2xKAtalIshPtSLeBBQuErhtTIBgkD9U9Gg8rKuDh6OrNDYr7rT2AhQ8s3M0xyaCx+GiL9rEPY6QUi/ewsnJyzhje49IeEVTYPh7Lr1oxlwoSejD7hm2Rio3GS42hIJq+DSOznZ8E+x6BiKo6+aBlp66hpUjukYIVz9+B6K8t4YSGpG10SlPy/O4DHt2pXb907/BurRlXsG4PK3A7IJmSTZs1jDhNuR9/+0KoKfx/KgDO+VtcWJ7mTG1XYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP9Kd6HB6JoaU68ixnaQiyaoUqKOto2Pm+UKhzdX9o8=;
 b=a6g+SPwdpNbDuCqJXEo2EDAGU3DpivFpExKekp5dXAj6AbXc0/mHfkIakv74Ygi8/TORDv+f/oOP6N4ac4Z6zRo13rrCHPgkVPlGZnSrv4MFyTTHvQT6E+kvmJiLaJRpRJCB9KOORUbSzowo+ULd8sL7bz07oxhDDQASFn42GlQbzOXaZrW1SkasABvOV+Hr4PvaJCgFlIn2J2sGNs22Uzv1eolMXEEn1W4WKsC0kFF68fRePmqjpJyewIcfGMhvd3sppioO3wQ1d8V3DlYo24iVMJ8huT3ZTgJH9e8RgZPNEgjYpp4lrVeU3d0AZaNZo+H7yy30j35PK3yp+52aOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP9Kd6HB6JoaU68ixnaQiyaoUqKOto2Pm+UKhzdX9o8=;
 b=nfU4/34Dua9AF136DVND/OmapUk6WL5U1ioeN+FdoBMOQoePbZlnZED0JopjtRwF84ccA7jiVflVUF01IzSQNQiQhXoovq0N1zMSNrEqaSSYTKIKGMcHIzUQKcnPH7eayBH6kDF/DK/2KNCD+6PeMV9GkLRgydTQXuL3HJ7KPj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 15:00:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YnEngsDG9BiiyzXj@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
X-ClientProxiedBy: AM0PR03CA0045.eurprd03.prod.outlook.com (2603:10a6:208::22)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a43d982b-e33e-4243-e5d4-08da2d04f521
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5647:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB56471266F3894424E0B2D6A68FC09@SJ0PR03MB5647.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yuSzHA9ycBVWLJzUxPXQKQ0QlSRMDLbxBK0ybOO+Dmf7DlkLTYNMtFOPmuIKzx/qf8eBuF9pXzNAaf3yb/1dnEbtlUK1Nh3n3I+mjb08nfGRUcwqatHWGaSCO+2t3c9ySpkVFeA82K2iRkDX7vkbOvtmDF4LVzykXYruRtBP8ZkBm2+j4ZYIAqiCxMw8BfyZ3pZx9wdPjt/XvfqukRyDZ2PaWgHLkIPeSNKIms7lVSIrsfmIu1/JGB/tOWUqRKpppf94cWhJ20BXxy8N7fMrTfa8l3zB+q7I8vMNHJzbKK8Czw02L/dM3t6BS2a6/cWq2Q3pUDmN7Jj/9z9aE+Iqcu/lvUM6ARnVWduYDyHSI9rG1Xn1W+oqEMaE7vR9gta1W5JzqYQVQeo3FoyRDOI63TqmXSw45AwOxvcCLwAS9NMULPN9OMszm0ir+2+M61h3YxJttHIBpYxAar8eaFH2g6D0/7Blze8y+rHDDBJ4FJdDl/20FQUOyDZzT1poeCAmDS0Pc0HGcFaQdlzEJRDoio1zOeS4DOKaHkOVFoemr5Ccg2fY3njXUDGXeVARwGxa77zSZeYqSQBtqf3XwKYMwfcth5yfMw3+VQ2wmwUbgubRTVqHMRCMFmXgbjBpR00f/79goNGkO1qIqYoGhAKy4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(54906003)(66946007)(6916009)(85182001)(5660300002)(9686003)(66476007)(66556008)(4326008)(8676002)(26005)(6512007)(83380400001)(86362001)(6486002)(316002)(186003)(38100700002)(2906002)(6666004)(82960400001)(8936002)(33716001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V01IamtDUTl5S0lWSXJpSVVjdys4dHFvMXJmODE5WHJvTlBSQXgzUDlGL1lh?=
 =?utf-8?B?TENwRVpzaXN2VDJwbHZoWWc0Rm90UktUZlRqc0pUdjk3KzUrR2hjWjNQSWc3?=
 =?utf-8?B?RjAvSkJqWm5SVEFCZnJtNDdzMjVFVUF4dmwwd2txV3dpamZhYTZLQ21YdDVx?=
 =?utf-8?B?Y1pMTUlmdTVTYjk2ZXJOTW84M1FsdmIzVFpWWFFESjgzU0lUbG8zMWJsc28w?=
 =?utf-8?B?eXdEUjR1L0U4UGxwNnlrMlBWNjBYUWN4d1hUZm9VeGJXVE8rNjNid2M2dTJl?=
 =?utf-8?B?Z0R0YmxaREp0VUFzVmw2VFE1RkZXZVMyQUN4T3VMbHQ0aGZaM3A1aDV1STdX?=
 =?utf-8?B?OHd2V3NmSzZ3SGJIU2tqbWh3L1NzbUZDSzlhMDVKOTNZRnF1UjUrVjdYdDFk?=
 =?utf-8?B?TFluQnFpUnhHVS9CTzJCamlHMjNDdk1nV0JrY1l1aklwTnJjTUU2Z0NDYlVG?=
 =?utf-8?B?U0FmVHhzUFQ2TUxvRXg0Qkt3azJVL1BXZmdXcWdPaXFkOUFZaklJMURrUllU?=
 =?utf-8?B?QmlmaWdYd2ZoaDRYZWMxbTBYMVFlYXI1a3RFR3pmRWJQS21YL09JUGtxUEw2?=
 =?utf-8?B?cXQzYnNNbXpSUEJ3cjhzVFRUZDc3RUc1RzEzZnNVTFZCL2EzOU44ZTlkcWdz?=
 =?utf-8?B?ZU8zbkRMNnB0LzRRaHdwUnIxS3RmbEc2WnpJUHBaci93SFJFdmpTU1RwbDAw?=
 =?utf-8?B?M013SnNvalZCUU9VUXE4TEYyRjRyY2lkc0FsNDFPdkN1VWMyeGRZaWdxazR0?=
 =?utf-8?B?YzZWeHZzYXpodDBRa2NPNjZiVk40a0k1NDc4RFIwWXVEZXlqNVJ0bVg2aU5S?=
 =?utf-8?B?SGowYUhYS3V4MVVaalVtR0ZJVWFBZHNVeERzVUw0Q281Y3k0MDhtMGRYTitX?=
 =?utf-8?B?QUd2djJFUjkyNVZNZUo0SHl1MEpMZkIwTG8zQnYyLzI0MzhYdUltU2tUempv?=
 =?utf-8?B?TmtsN2V4dEhic01GKzJsaGVLSGNGS2hWNjZQTlBPSUIwd2hVc0ROc0x1VTIr?=
 =?utf-8?B?dFRJKzJtYTVwSUs0Q21jSm9HZnlaRDVhcDdZM1VKenE3ODM0R1lCVjlhYUhu?=
 =?utf-8?B?RjljVzJaa2h5dTQ3VFNiRVdEdlZnTi93eng5RTlkWXlyak03WEZtUk1SY2p4?=
 =?utf-8?B?T1R4dWIvZUNTazRlYVBHRTNTQUR3QnBybWZUamdUZE9WdHNOdVNMdTJadU5J?=
 =?utf-8?B?MlhtZHFTM0NOSzFKNk1xejVBQUFEUUdISDIzYlJtZjlSSmxxbGt2d1Mwa1Rr?=
 =?utf-8?B?a2JtcEtxek5CYm13QmlIY1NtdGtjWnAvZkRvWk1RdWxXNU1IckpyU0JaVStt?=
 =?utf-8?B?OHU4bUFpbEJoOTNXZGIvcUI2cTRubFJMWUtUYkt1Snk1WkdHbjdkTDMvTDR2?=
 =?utf-8?B?czhiQU9HS014K1pYQksxL3RidE1XNllXNVVKNDgyZFJVSGp6K2dCNjBpeFNh?=
 =?utf-8?B?NElmdEpmV0trd011RzhaTHF4U3dGUnhQZlN2L0N0YVpiSEV5U0QvT05KQmV3?=
 =?utf-8?B?cm5LZ1dVK3VIbWVCSVdoR3NINUpRUGwrL0h0TkFNcTBqWm1YZlV3MFhYM0hl?=
 =?utf-8?B?TVNTeDdrTU5PRUZmc3dyVTZjQ0RXUWtEckpra0p4REdqWnNBVU9mTzVPUkhw?=
 =?utf-8?B?aEFNZU14ekkvTEtWcTJ3dU52N3NFbnlBYmVhdld6dXh1WWdKaHovaXU0MS9w?=
 =?utf-8?B?aXlyemJNOE1tQmNMUkZBNk9PUXJrOGRaS2h6cmxDVEdPMU02VS81dlhsSHNo?=
 =?utf-8?B?TnE4UFNoTzNDS3grUUN3MVNqTUt3ZW8wTkptTTRzcFJKdTFQUVBDRG1yZkxW?=
 =?utf-8?B?WWpQL0dlUkRzVU91RTZIT1V2Q041WTdiejZSTThIOHI2Sjk4ZW93bWN5dlR0?=
 =?utf-8?B?cHVCdGc3SjVPdWZQdXhVV3M5bmIrRmRKOFVlQ2o5TFJlTVo5ZzFTWGRLdHZ6?=
 =?utf-8?B?QUd4Wmp1OG50MCtZQXhEVlhsMCt5QkhMaDlmelZPNENobEdlNzVkdkNFc3U1?=
 =?utf-8?B?WW1hZm1Ea0VJOXlVeEtxdjY0Z25TTlQ2YzQwaHNtR0YzVnVNSnVWMlNuRERw?=
 =?utf-8?B?WitpYWdZUTAwKzFPMUltaDVYVmtlQVFxUDFuVmdPWEZvSzR4cUxPazBDSWJN?=
 =?utf-8?B?aTZYMWxWNFBYVWdoQ0NFbG1kM3lkcGhPZjREdkljc0JtaTZMV3RBbWdZaFlH?=
 =?utf-8?B?TDBmcE01VHBiQU9xVVZoU2ZaUWpYM0xyOWJuVElnRzJ0M2tNblREYlQ3Z0xV?=
 =?utf-8?B?NFNBc2dUYVcwMW82VGwwL1hleWxNcXBMejNHc295VFNRTjYxblRZQ0doQytL?=
 =?utf-8?B?KzZHL1ZSRkhqcU5vN0l2eExtdGk0b3Vjd3JWdUcvandNcXoxVkRJM0lHM1V4?=
 =?utf-8?Q?biefnqreBtYo2EQk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43d982b-e33e-4243-e5d4-08da2d04f521
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 13:00:54.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0oUNspAuqOCdz94Hz09eK4QiVV8pW8LF9H1/Pl0YOou0QJXQ45iC0NMYabEEyUxr/QD0b7TplUJLbFq3Is0PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5647

On Mon, Apr 25, 2022 at 10:34:23AM +0200, Jan Beulich wrote:
> While already the case for PVH, there's no reason to treat PV
> differently here, though of course the addresses get taken from another
> source in this case. Except that, to match CPU side mappings, by default
> we permit r/o ones. This then also means we now deal consistently with
> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> [integrated] v1: Integrate into series.
> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
> 
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -275,12 +275,12 @@ void iommu_identity_map_teardown(struct
>      }
>  }
>  
> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> -                                         unsigned long pfn,
> -                                         unsigned long max_pfn)
> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> +                                                 unsigned long pfn,
> +                                                 unsigned long max_pfn)
>  {
>      mfn_t mfn = _mfn(pfn);
> -    unsigned int i, type;
> +    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
>  
>      /*
>       * Set up 1:1 mapping for dom0. Default to include only conventional RAM
> @@ -289,44 +289,60 @@ static bool __hwdom_init hwdom_iommu_map
>       * that fall in unusable ranges for PV Dom0.
>       */
>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> -        return false;
> +        return 0;
>  
>      switch ( type = page_get_ram_type(mfn) )
>      {
>      case RAM_TYPE_UNUSABLE:
> -        return false;
> +        return 0;
>  
>      case RAM_TYPE_CONVENTIONAL:
>          if ( iommu_hwdom_strict )
> -            return false;
> +            return 0;
>          break;
>  
>      default:
>          if ( type & RAM_TYPE_RESERVED )
>          {
>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> -                return false;
> +                perms = 0;
>          }
> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> -            return false;
> +        else if ( is_hvm_domain(d) )
> +            return 0;
> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> +            perms = 0;
>      }
>  
>      /* Check that it doesn't overlap with the Interrupt Address Range. */
>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> -        return false;
> +        return 0;
>      /* ... or the IO-APIC */
> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> -            return false;
> +    if ( has_vioapic(d) )
> +    {
> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> +                return 0;
> +    }
> +    else if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> +         * ones there, so it should also have such established for IOMMUs.
> +         */
> +        for ( i = 0; i < nr_ioapics; i++ )
> +            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
> +                       ? IOMMUF_readable : 0;

If we really are after consistency with CPU side mappings, we should
likely take the whole contents of mmio_ro_ranges and d->iomem_caps
into account, not just the pages belonging to the IO-APIC?

There could also be HPET pages mapped as RO for PV.

Thanks, Roger.

