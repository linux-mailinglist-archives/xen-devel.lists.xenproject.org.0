Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEE517FCE
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319267.539456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo0Y-0002X0-72; Tue, 03 May 2022 08:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319267.539456; Tue, 03 May 2022 08:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo0Y-0002Ur-2I; Tue, 03 May 2022 08:35:46 +0000
Received: by outflank-mailman (input) for mailman id 319267;
 Tue, 03 May 2022 08:35:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlo0V-0000uC-QD
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:35:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 037062e4-cabc-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 10:35:41 +0200 (CEST)
Received: from mail-bn1nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 04:35:16 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4179.namprd03.prod.outlook.com (2603:10b6:208:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 08:35:13 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 08:35:13 +0000
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
X-Inumbo-ID: 037062e4-cabc-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651566941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=d0r5ad4K3r4CkLRcWIDa+90V/Ub7pWJBWgKi+1nEoeU=;
  b=G47wjXsS9DrGT3mKa2hRxJnGprb4IGeqGk//BX6zptyB4kkp+z+EZYo9
   wWxEbe9typIEPFRT1aXKt1kORPfshhAeJ4wmashOVaA1DeHjf83fU9qr8
   vX/X+1dJNsLe5gAFIB4S2zHzYO54iLPefm/zQFFOqpsYrxhTOJxl7pVdh
   g=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 70853970
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kILK26p4Yvgbb1Htno8LkWraaL5eBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBmEb/uCZmD0f9l1YIWy/RtUv5fXyYRnHgc4/y89ESJHopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 Yiq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBAbHuxeBDTDZkLHtEYY5U3rraE1GPvpnGp6HGWyOEL/RGKmgTZddd0MAuRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFhXFs2qiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3N9fdssjeLpOB3+J+wD4uMRYKEfupMw2WGp
 SHC1kLDRQ5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/p/J
 koO62wRpK493EWxS5/2WBjQiHWDuxsBXdtMAqs/4QeExafOyxaUAHAeSTxMY8Bgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+8sjeaKSUTa2gYakc5oRAt5tDipMQ5iEvJR9M7T6qt1IWpRXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodd7xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:NOIApK26Lzh0ShTZfJan7QqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8O3WBxB8bYYOCCggeVxe5ZnO/fKlHbexEWs9QtrJ
 uIEJIOd+EYc2IK6voSiTPQe7hA/DDEytHRuQ639QYQcegAUdAE0+4WMHf5LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+FZgNYtvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70853970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY2dFVnZDrMW3NzYwit7lVXpj4tuMC3yJT8MCziZ1uc5Ldp2l1tAnhCjffevM7WoEnjKy+8IqW2JmuZp4QWOhp/rzVVShyGZACd5Wk0Efy1ZBqDIUTB91Rwy/uZw+J6oXXokyvTdkYmcaXiDtoixLRNl3aRPVgXQ/YBrT/mBQhd6bmgqFGTf46dLHU4n/zwx1xTLigMQm7Bv8p9/tdnKJSs7rFDx2D4tWl6mfCO33KxFoYZyJ8X7fZHHb49+4XmJa/pNDNEj3LRdxXqg3q6bm8U5StR6l9wOz8byiW1SNyBuqjn301uSiNJllQly3ZuWCCrIijaPULurL5UFyJX+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wehwItelrslTp4h5pL3pzGUxU0zbfXkKGD+PTUrBRc=;
 b=VXnjg4iAhtj35JwCVhtZ54mZhM9EPQ6ufzjrp1rD/VlxgzkKE9qOYJn8221EOxVU4D6Fun0h+cme5rXAYu1GerTUcMVImqpJW7ncwAAdorA7mdWIeB640Ckl9D8xUEhrIL0PCkW6KMmBM32/8fELiLNGf26ZJTG1Qp2jtdoLJv6YNaRrKPFtuNBGQprky3IUW/Iqi8+QllG4vy9cykpF3CuXuNNKpRKDAS0UCTpVTA9sLzZeBEJDPPXYq5C6P6a+9yFDLPJmNLWlzsp3Q6wGiJtKdp9evz8bmo6dFnH16WTtXGCz9MobajB+Odkbnhej68f6hRVRX3lCQWjH7sHYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wehwItelrslTp4h5pL3pzGUxU0zbfXkKGD+PTUrBRc=;
 b=PYO/JTaiGSrovQdR0CQZNKBZ5UdLpqBscNuGynX6NGZIYuSARDkOhAfAodr4QzN5uAGU/TJZkhJM3JI01gpK1vsNu7IjU3g6bI4i2XnxdswhlszqvMnZ6k9j8gq6zyBGw8rIKfVUjeHe+eQn1t2WYzyAbqlIYPS2M4RKux58LR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
Date: Tue,  3 May 2022 10:26:50 +0200
Message-Id: <20220503082650.23049-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503082650.23049-1-roger.pau@citrix.com>
References: <20220503082650.23049-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:208:120::43) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60dae633-6aac-49b2-f519-08da2cdfd74c
X-MS-TrafficTypeDiagnostic: BL0PR03MB4179:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB4179C48E39C8E997E68D57A08FC09@BL0PR03MB4179.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Q8PkQSQdhlYxhAtGOualmdheRwl2gURR9JcpWI7o/d6dIffC90ASs0aa3DWSBMc3phpw/uP5EV6RwAux0++03OOBIyqTsUblJQczhVGdm+VE9vQjhpV/9ZPZ8CMFEDaHB6gQz4lofK6g50dLhdEbHnrqnBzMniKhM149wv4xPqcmCPqxJFOQnFW7R+jVI0DdXnXw0wYsjj49HMerTwo5WW4jGrYBXmk5KlKcAMAQBDm8VmXID/53lNrOnk1rlejn19VxMaxo/1UCsHl7r1PoOPq9odlQ0PMlrXlaAQ50FI0p0okAtGyswxzap6aWoJLVrRSnTvorBVPuCfIkhFbQ91DRcpTGV2cvmKT9rCEid95FwvT/y4y9VyPhwmIFb+qSND18+f3678zjwev+PcrImUv6yPy0xdPKmRv0me5HgzVBJJxb90mb8wQXnWgkMIWvFTdTb5TAXp9K8oaW1Y7PgV1FlQAIVIRj8ejSpev4464S27d83MWs3loZS4HxWPFrGNAhW6dnE70TYP+ccgTFAu4iCymB6fff0DmMelY+4u6m/Ns1KOihmRikgfNch9639QLjCkaYQU6+2JPO/1txyBvfCB7SC05+QpoWk87ujrDjhxW1jTra4WKvsJZXzsxZklZPgKfJ+vCP5XJ/btzBArWzg0B9HVEVVV+us084I1uqDoZkMyg5xXkwJCVDxRkuEB6gIJFXjnprJt+vlh44HnVgQCW9n9xz0h4FUlS3PE2rPgILXgmvGnc7W2RiVpJyEE/CD5L3zfNSqYX+KrlFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6512007)(26005)(6506007)(2616005)(6916009)(54906003)(5660300002)(8936002)(83380400001)(186003)(2906002)(1076003)(66556008)(66476007)(86362001)(4326008)(36756003)(66946007)(8676002)(966005)(38100700002)(6486002)(508600001)(82960400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9PYUZMZTBvVzA5Y0lDeXRONWpISEFpeWVxMnFCRXpkeWVuK2pSQnlEVmJI?=
 =?utf-8?B?c3U0REREd01tVHRYSWxaWVZBbXc3dkpvK3RwOHZxMHlaay8xdEdHK0tmc2Nu?=
 =?utf-8?B?UUU0NzNXdEcwR3NHR0JFMkhONlNOeENIMGVsYmQ3NkU3Y3pxNVQ1VU50SVpk?=
 =?utf-8?B?VHBpZGlJa2tRQ25mbU95eFhiVnhrNFVjaGtrMlhMVTlVNzRHQzA2Q1FZUitu?=
 =?utf-8?B?ZkFkenM2Tkp3T2RsWW5yZStlSXgvMmg1aUhwbjlkVjdhVzUrdTBORHNuMUZj?=
 =?utf-8?B?c21OcFdWYWxaYm5CdGJ0QnFmaTAzTUU3NFpoY1NQY0h0ZVd2VzB4SjRFbEpw?=
 =?utf-8?B?clZ5eVBSeGthOSs1eitIWXFad2hKKzEyVkNTdE1SNS9ncEhnTTJkMjY0V2JR?=
 =?utf-8?B?WG42UXk4OXc5ODU4N0wwaGVDVzVCWkVJQ1FMeHMwQkxLRzkwTUdSK3NqMjVY?=
 =?utf-8?B?SDBtZjZjWjBERnZTbkhHSmlVekVGeHdqYWFpOGR3allqWlpGMHBHdThKVmhu?=
 =?utf-8?B?bjVEV2NYNkpxYzFQUXhRdStzcHdZRzBuZ0ZYNDMvalNvOXR5U0pjb0RUUVdL?=
 =?utf-8?B?RDduQjIyVzZoQjhhSU9QSWlLVldTUFZ3MlJwVHpBL2FUamJKLzN2Rjhoakh2?=
 =?utf-8?B?MGtndldZVjlzbXBreGZhaTdPWjQ5enRWNUZFSC9KNnZUTHM1akhQSk1rVERq?=
 =?utf-8?B?RXJVUEoyK2M4enVQd2FScVZjZ01GZ21ldFZ3VjBDUGN4Smg0NlVac01kN1Bn?=
 =?utf-8?B?UTRxOW1tTXVocHVmMmNYQ21KSWtUNXl5d3FEcHJvTTRWODBKUXUyMldLQXdt?=
 =?utf-8?B?SERjUE8rWkJZTGJNeDZLZys1Tm9wdlJvdS9VTzZIT2NZTWUrRzhHUmh4Mmxu?=
 =?utf-8?B?aWhONEdKWTNXeVRCZ01Kb0tWbjJkb3U5V1Q3REFFTVU3NGw0LzB0bVBUNVZC?=
 =?utf-8?B?SUlHa20wMk9KbzlkK1pKdy9RUklKTUxoMmRnNkZDQzdXWG9zQVBmYnBQdVRG?=
 =?utf-8?B?NmxReDcyY1lodnYyY0tJUmFxUm9LTCsya1hBMnVFdG5MSXpWb1JHNWFtTlZi?=
 =?utf-8?B?MFNLNURpcDI1NzVqWmlQdXYrejVIWm1hQkxRN1ZZaGtHYlJnaUlZOXcwUXdS?=
 =?utf-8?B?cGxxTGNUNWV2UnZUbnhnYm5SWEVOR2Z5REhqYXA1MmdmZ0g2NVFRRVBPZnlM?=
 =?utf-8?B?WCthYTUwUnd4Q0VUNVJBYWYraXdteUxWdTU0TGJsS1ZEUzlsWjhFWTZxRFZL?=
 =?utf-8?B?eTQ1V3hxVm1wTSt2d25pbzRpZmVDYVBHUzJmaHVHZThsYk1SSWxtbnhYQlJl?=
 =?utf-8?B?dEhJaXBmaEhDTFBvd3dSMWJVUlhVRzBUWnFSWmh6aE43NXcyZURXV3FQZmI3?=
 =?utf-8?B?MkNnWUNJditueUg0cER3d0djeHJwVTBWU2MzVWtTZzRoODJ3M095b3JrRXB4?=
 =?utf-8?B?RjZHQmRYVlpibVovYmI1K2o2S3A3NkRZWURieWtwMEZUSEpvakZZM1d1UlJO?=
 =?utf-8?B?VGM0S2k0NlROMjBJcWtiK0QrOVU2ekxJNGVFMTRwOVVBMU1kdmdFd0RFQWZh?=
 =?utf-8?B?bzBwU1hUemxWblZwZ3RTRGZ2bXlwa2ZyMTJOQWFjQ0NkTXgzUWo3TzRHb0Ey?=
 =?utf-8?B?aXZhUUU4WEVTVnk0ZWlPVTFmMGhKbVhKT0tXNVlNQU45Ym5Ib01KdGgwZnhx?=
 =?utf-8?B?eUNDdS9TT05qcGFKWDNoNTZlUWE1MWhGS2x3aDdHR25HV0IxcVRvQ2NXVmpY?=
 =?utf-8?B?V01QbVNFUzhYVFJiMVFHYmNEN0tqYUFtcDVNeGFkZmNLdHl6OWRlK04ybFl0?=
 =?utf-8?B?ajE0azdHNjd4M2MwWUJCQzVyRnUvelV0VnhzbVFyWDdRR1E1VDhaVGlsZWN1?=
 =?utf-8?B?dklhbG9lRklRb0wybHIxdFdpdVhlRHZOdlJMR25SdVZvcnlTZTZTbWhBNitu?=
 =?utf-8?B?ZGVmWVRkdUo0VTVmbmZNdEY1UFdEZmEzaWVWYlRUb2gxNE1XNW5XQVRINEk0?=
 =?utf-8?B?WlhaSkxXSDB5MnBPNkpRbGxrTFJVc0FQN29rWXhDVXRMZEl2ZnBaU0xDaDRl?=
 =?utf-8?B?eEZKVmlWT0I4eUFsQUs3MjdqYWdVNUNLaVJMLyt1Y1R3UENiWkFvelJaQXZ4?=
 =?utf-8?B?Zy9zMU5JZXdVQUFXOEYra2NpSDM0OXJGajBlMFJCYUZIRFdwc1BsendwMUVW?=
 =?utf-8?B?Rno3K25raTdwK0dMeUt5SWZlYWhsRWxFZ0dsRTkzaFBrTjhUemZvSC9kU1lW?=
 =?utf-8?B?NEo0RlkrNTAxdUpONVNRaTBndHV6dWFDbS83QnVSM2dDNHdSZUh4cHl2Ums2?=
 =?utf-8?B?M3VJZHZ3RXpucDBQRVRjdjdhTHpWM0IwQlVkek1pdjY3SFgrSm45Q1RzTnV6?=
 =?utf-8?Q?no/iv6AR7PfbX56o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dae633-6aac-49b2-f519-08da2cdfd74c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:35:13.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ouAyEmN8rz/oIQzwmQwl5qJIM+CjTLi1KOcLuIesqY+MpHkz2XT51Z0ClY5nzdsCztGB2cqnSVWYeYHn4iZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4179

Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
allows for an unified way of exposing SSBD support to guests on AMD
hardware that's compatible migration wise, regardless of what
underlying mechanism is used to set SSBD.

Note that on AMD Family 17h and Hygon Family 18h processors the value
of SSBD in LS_CFG is shared between threads on the same core, so
there's extra logic in order to synchronize the value and have SSBD
set as long as one of the threads in the core requires it to be set.
Such logic also requires extra storage for each thread state, which is
allocated at initialization time.

Do the context switching of the SSBD selection in LS_CFG between
hypervisor and guest in the same handler that's already used to switch
the value of VIRT_SPEC_CTRL.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Slightly change usage of val/opt_ssbd in
   vm{exit,entry}_virt_spec_ctrl.
 - Pull opt_ssbd outside of the for loop in amd_setup_legacy_ssbd().
 - Fix indentation.
 - Remove ASSERTs/BUG_ONs from GIF=0 context.

Changes since v3:
 - Align ssbd per-core struct to a cache line.
 - Open code a simple spinlock to avoid playing tricks with the lock
   detector.
 - s/ssbd_core/ssbd_ls_cfg/.
 - Fix log message wording.
 - Fix define name and remove comment.
 - Also handle Hygon processors (Fam18h).
 - Add changelog entry.

Changes since v2:
 - Fix codding style issues.
 - Use AMD_ZEN1_MAX_SOCKETS to define the max number of possible
   sockets in Zen1 systems.

Changes since v1:
 - Report legacy SSBD support using a global variable.
 - Use ro_after_init for ssbd_max_cores.
 - Handle boot_cpu_data.x86_num_siblings < 1.
 - Add comment regarding _irqsave usage in amd_set_legacy_ssbd.
---
 CHANGELOG.md                   |   3 +
 xen/arch/x86/cpu/amd.c         | 121 ++++++++++++++++++++++++++++-----
 xen/arch/x86/hvm/svm/svm.c     |   4 ++
 xen/arch/x86/include/asm/amd.h |   4 ++
 xen/arch/x86/spec_ctrl.c       |   4 +-
 5 files changed, 118 insertions(+), 18 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 6a7755d7b0..9a007e2513 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 
+### Added
+ - Support VIRT_SSBD feature for HVM guests on AMD.
+
 ## [4.16.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2021-12-02
 
 ### Removed
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4999f8be2b..27f4d51e86 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -48,6 +48,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
+bool __ro_after_init amd_legacy_ssbd;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -685,23 +686,10 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
  * Refer to the AMD Speculative Store Bypass whitepaper:
  * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
  */
-void amd_init_ssbd(const struct cpuinfo_x86 *c)
+static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
 	int bit = -1;
 
-	if (cpu_has_ssb_no)
-		return;
-
-	if (cpu_has_amd_ssbd) {
-		/* Handled by common MSR_SPEC_CTRL logic */
-		return;
-	}
-
-	if (cpu_has_virt_ssbd) {
-		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
-		return;
-	}
-
 	switch (c->x86) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
@@ -715,20 +703,119 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    val &= ~mask;
-			    if (opt_ssbd)
+			    if (enable)
 				    val |= mask;
 			    false;
 		    }) ||
 		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    rdmsrl(MSR_AMD64_LS_CFG, val);
-			    (val & mask) != (opt_ssbd * mask);
+			    (val & mask) != (enable * mask);
 		    }))
 			bit = -1;
 	}
 
-	if (bit < 0)
+	return bit >= 0;
+}
+
+void amd_init_ssbd(const struct cpuinfo_x86 *c)
+{
+	if (cpu_has_ssb_no)
+		return;
+
+	if (cpu_has_amd_ssbd) {
+		/* Handled by common MSR_SPEC_CTRL logic */
+		return;
+	}
+
+	if (cpu_has_virt_ssbd) {
+		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		return;
+	}
+
+	if (!set_legacy_ssbd(c, opt_ssbd)) {
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
+		if (amd_legacy_ssbd)
+			panic("CPU feature mismatch: no legacy SSBD\n");
+	} else if (c == &boot_cpu_data)
+		amd_legacy_ssbd = true;
+}
+
+static struct ssbd_ls_cfg {
+    bool locked;
+    unsigned int count;
+} __cacheline_aligned *ssbd_ls_cfg;
+static unsigned int __ro_after_init ssbd_max_cores;
+#define AMD_FAM17H_MAX_SOCKETS 2
+
+bool __init amd_setup_legacy_ssbd(void)
+{
+	unsigned int i;
+
+	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
+	    boot_cpu_data.x86_num_siblings <= 1)
+		return true;
+
+	/*
+	 * One could be forgiven for thinking that c->x86_max_cores is the
+	 * correct value to use here.
+	 *
+	 * However, that value is derived from the current configuration, and
+	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
+	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
+	 */
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
+		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
+		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
+	}
+	if (!ssbd_max_cores)
+		return false;
+
+	ssbd_ls_cfg = xzalloc_array(struct ssbd_ls_cfg,
+	                            ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS);
+	if (!ssbd_ls_cfg)
+		return false;
+
+	if (opt_ssbd)
+		for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
+			/* Set initial state, applies to any (hotplug) CPU. */
+			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+
+	return true;
+}
+
+/*
+ * Executed from GIF==0 context: avoid using BUG/ASSERT or other functionality
+ * that relies on exceptions as those are not expected to run in GIF==0
+ * context.
+ */
+void amd_set_legacy_ssbd(bool enable)
+{
+	const struct cpuinfo_x86 *c = &current_cpu_data;
+	struct ssbd_ls_cfg *status;
+
+	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
+		set_legacy_ssbd(c, enable);
+		return;
+	}
+
+	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
+	                      c->cpu_core_id];
+
+	/*
+	 * Open code a very simple spinlock: this function is used with GIF==0
+	 * and different IF values, so would trigger the checklock detector.
+	 * Instead of trying to workaround the detector, use a very simple lock
+	 * implementation: it's better to reduce the amount of code executed
+	 * with GIF==0.
+	 */
+	while ( test_and_set_bool(status->locked) )
+		cpu_relax();
+	status->count += enable ? 1 : -1;
+	if (enable ? status->count == 1 : !status->count)
+		set_legacy_ssbd(c, enable);
+	barrier();
+	write_atomic(&status->locked, false);
 }
 
 void __init detect_zen2_null_seg_behaviour(void)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2d0ad05111..cd465eecc9 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3126,6 +3126,8 @@ void vmexit_virt_spec_ctrl(void)
 
     if ( cpu_has_virt_ssbd )
         wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+    else
+        amd_set_legacy_ssbd(val);
 }
 
 /* Called with GIF=0. */
@@ -3138,6 +3140,8 @@ void vmentry_virt_spec_ctrl(void)
 
     if ( cpu_has_virt_ssbd )
         wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
+    else
+        amd_set_legacy_ssbd(!val);
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index a82382e6bf..6a42f68542 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -151,4 +151,8 @@ void check_enable_amd_mmconf_dmi(void);
 extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
+extern bool amd_legacy_ssbd;
+bool amd_setup_legacy_ssbd(void);
+void amd_set_legacy_ssbd(bool enable);
+
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0d5ec877d1..495e6f9405 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/amd.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -1073,7 +1074,8 @@ void __init init_speculation_mitigations(void)
     }
 
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
-    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
+         (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
         setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
 
     /* If we have IBRS available, see whether we should use it. */
-- 
2.35.1


