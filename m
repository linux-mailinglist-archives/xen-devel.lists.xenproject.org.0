Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35463645C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447632.704078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwZ-00004u-QV; Wed, 23 Nov 2022 15:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447632.704078; Wed, 23 Nov 2022 15:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwZ-0008Tn-Nn; Wed, 23 Nov 2022 15:45:47 +0000
Received: by outflank-mailman (input) for mailman id 447632;
 Wed, 23 Nov 2022 15:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nECt=3X=citrix.com=prvs=319181206=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxrwY-0008Tb-H2
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:45:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3185d9b-6b45-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 16:45:44 +0100 (CET)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 10:45:36 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:45:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:45:34 +0000
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
X-Inumbo-ID: e3185d9b-6b45-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669218343;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=plv8Q/8wTHHJVj3Exini4Rly0YHMh3Y9VO5rXghbQe0=;
  b=c51nM1MgdarYxVwI4XHqlVoof0Sn4NHUybL8rGe+L7ZXmXInppV6Gp75
   BCpoSRRpolh/mxffv1yTE20Hth2Zh+Y3KripkcvAqTXsX8SsWHEZPhKav
   +hFq+vMjzHV1MsfW1z6Ixa2/IRXI/ejcw1tflBrkBpvKKKn8NeiDsk1t6
   c=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 87966129
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4Q6ElKkn8aPlJog3pXhkd/bo5gxuJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdUDyBMq2MMTamKdgnb9yxpxlQ75GGmN4wTlc+q38xRSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5gSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 d1IbzAqZwCivKWv6pORQ8s2l5kHdvC+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOaF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwnKlBttIRdVU8NZWn2WLyHQzSycTWFu84tWDkBG9ZIlAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpbdU8scYsSD8C1
 1mXnsjoDzhirL2UT32G8r6e6zi1PEA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y6
 zKXqCkzgZ0DgMhN0L+0lXjcmC6lrJXNSg8z5y3UU3ij4wc/Y5SqD7FE8nDe5PdEaYOGFF+Iu
 SFen9DEtLxQS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysLjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:nLSczKzyz711R9rpQUNSKrPxWOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhOZICOgqTM6ftWzd1FdAQ7sSibcKrweBJ8SczJ8h6U
 4fSdkYNDSYNzET46fHCWGDYqwdKbK8gcWVbInlvhRQpVYAUdAa0+41MHfuLmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+QlUVQuTZoNXPtZT+JToLHQQu5gWihS6hrOeSKWnR4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0PD8phMn9Pl691bQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idirP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr1vv00WRj3fPqdHwAGtSMbs2uatpNj/ir2YwttB116
 xGm0qfqppsFBvF2ADw/cLBWR1Gnle95VAijekQpXpCVpZ2Us4nkaUvuGduVLsQFiPz744qVM
 FoEcHn/f5TNWiXanjI11Mfs+CEbzAWJFOrU0ICssua33x9h3Zi1XYVw8QZgzMp6I89Y4Ms3Z
 WJDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXz6CaA8PW7XoZKf2sR52AiTQu1H8HIOou
 WBbLsB3lRCO34GSPf+lqGjyyq9D1lUBl/Wu4JjD5sQgMyNeFOkC1zAdLkUqbrfnxwuOLymZx
 +NAuMoPxaaFxqJJW9o5XyNZ3AAEwhqbOQl/vAGZnmpnuXnbqXXi82zSoejGFOqK0duZl/C
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="87966129"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjIk0tmSeRXSatK5fMqgL47WaOimVIEXCSpdaQtjprQQgCqd8ODDHpsBwGAvwKeXor0UTfn5Bc+E521dCOqC31b9uYUYiUKI3A93JENSkXFLPtFq7rntnxPi/MrmQMWnp8KkbCw8UFrneLjTxQhTRS4KEhAoPLDa6+2jYSTY04jyy44uQzFacv76CVVX9MbLdYD8Zm2AWn3s3EQcZHejYtmL9ZOIEYuL+C1higAtN7zuE1Oi5ZFEr6V5xZv8JTox1MDtJR+aM7BC9Z9KbGqNU3hm8TPAvE7S/DVkUGA5sZwx6zZsanEMpqd1lBv0Dzp4XZRBxo3n69KPnen0gMd3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwYQDu3FJbnU9eijKndbLoQ5ZKpllZUTITw+E3o7oOw=;
 b=Xk1JdxCRvQMJyFy6dN1wo4j+vC7fB4a6fCPMLd0dUgohYMOZMkOFenO2s69xbHbZ8LkxrYJzwI+eHmJ16gIU6b3kgNBvGtNw2UpETrxUsnhRT+4o1GrHGmS9NUD+lPnnuT6AMinFGO7vs24wjhXqgEF+OlfNppxukvzR9F8huGGP9jku+yKF55Oh9lOJ9AKxBw/ASYNTVBMMaezjTt4+5UZ5UsJ+vWkcDncfdwR9o5Z9QKfV5BZoUSo+FC7BjTfGqjFXSu+mYCPPPvoJWJaJCeWHX287lWBkuhyqEcjfVkASqnksXAkZ/mVB2SaTDEwZ32yML79sPBIWudxJooadOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwYQDu3FJbnU9eijKndbLoQ5ZKpllZUTITw+E3o7oOw=;
 b=ZHDJOZ8w7eSHr/8xUve/GUK6MS3XG6EasiPp26WrGmZY+qeEIHvkdkpYIBSDSyHpbTf1q5WT2AC9ihKZMqjMA1mhMbmqWNs80ZyG7cIrOjHKBfmlqF4bvbQMIG6N+w8aJDAh31xlhfMpj5zo4qaGROchI1Ulnd+kou5T0UVBZa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI + misc
Date: Wed, 23 Nov 2022 16:45:19 +0100
Message-Id: <20221123154525.63068-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 974794d6-0392-450b-14cf-08dacd69c22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5LXAH8FYz+4JDXt0jdMpePLQT41uXWUw7w9cn7wysRuBvhn6jH20b1vvmzGFYnHUM4k4lwx42e572kG6m4q9vVBjqdYs4IbYZAVoI2X5GpGYoFM0hZodepJys7saVD93h0LCeNVu5IlyW+9yF8iEpAYXcctrCC6k96WCfND3byBk9fwda0FS4QRwrWYY4eVa4RhlZRjsD8MlcRTRyEPhGZfAE2CCcMlcL1/Vc6rBk6aww+TB07BKyJ0WdsSl6au5EewZ3DH6US0hCJ/ha/Ul0iqc/C7Ml1lnB0SSxz2Xf3KyO/fTzTxmNt1A308hyKugi97MB8j7DUWHaani7BBRh9klNm1/5c1YQh4MXvfLwPlyA53td4z4xUioKaAaOMYIJNh2gd5tkVXjyDYRXy1eOqiCI+hg4eemjwiNenOMNRFhD81v4BffSHNkStF+C9wYUXpHTnU47dvRSSpYtLEcWzvJZe9XHYxbvJT6RZUHcbhRRQGwyD69f+J0exYJZkCdtRqkZsFK/d6evYYdmW5JQdTrXOcD/c89Dp380byBSVcZ35uFaPx2uawkvF6ijvvBrUKh3w8KH57UFOkjuMhaYt+ltIGQPx9jRljv+4YbRiWoOg35uLl0H4YVi3XYHwWDn9xihFNesWx5HWyVW8Q45A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(36756003)(86362001)(41300700001)(66556008)(66946007)(316002)(66476007)(4326008)(8676002)(82960400001)(38100700002)(6486002)(83380400001)(54906003)(6916009)(478600001)(186003)(2906002)(5660300002)(8936002)(6506007)(2616005)(1076003)(26005)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUJUM0dlUEN0a2pVNGc5R3NYbys5SVhzd292L29CYkhrSEFjNzNJTGk5dytZ?=
 =?utf-8?B?dGxHVnozMWNDaGVZT1JScmhFRUFyM1QyZEs3Rmh0Mkh1ajJTZFRCM2YwWjF5?=
 =?utf-8?B?eTNScnhQTkRsejJGbTh2QnViNTM0bWQ0TW1XdFFIRk0zQzlwRk5WbGpYYUtH?=
 =?utf-8?B?VWU0WmhQejlJM3RzbjVsdG1OOVVOVmpTc1JpWGowN0lRenhOMXJoeFlrQXFj?=
 =?utf-8?B?S0N5dnNFa2VITVgveUZqejZTYWdoWlRVeGkxU3FEMWRhcFhQdnkrYWl0ZG90?=
 =?utf-8?B?UHJNYVdZNVcxdmk1ZHdqYlNJZElHcC8vWlpoczlpS0x2TUtnQzdDaXB3c0li?=
 =?utf-8?B?OGlDczZWdXNLdlk4Zk1iYVZPN0p0WHlMYlBXU2Z3UXV2dzk3RmlHR1o2NXpS?=
 =?utf-8?B?OXlqQUNBb1I5MVhpSWthYjBuaFpKcEVhQmo5Tk5OL1g1R2MrOHdDUXJWRTMv?=
 =?utf-8?B?RjdjaUpUNTJuUUZMWnZSQ2FVempUcGpTaDZ4TXZaV1NYZGpzc3cvN3hSTlp6?=
 =?utf-8?B?cVBEMVh2aEVRbnhITk5rczgxZlJ5MlljcFNYVlhobHE1czY2YVNMYjlRT0Ew?=
 =?utf-8?B?WWhhaTg1eDFZbk5sUUlQeUpIRGczeDBJcVo3NFpjY00zTDZJSWMwenR5bVdS?=
 =?utf-8?B?WDREZ3I1YkFCTXhOOGNnODc5TzNiQnNNakNkSlpOMTZJR0d3VzN5WmZob2hQ?=
 =?utf-8?B?Rm00eVp4djhJbDh3ck5KVU5remtHMkJQQmVpUk8zQzE1bmViL2kzTyt4ZmtR?=
 =?utf-8?B?T0s4eXVNZjJnK0ZQVGN4RDhOTE9mdXBhamxhaThSNFpsamcxQUlIWVJRSVR3?=
 =?utf-8?B?ckUzcUxjK2R2ajE2eWd6Unl4YzBtOWFIVlBEWDUxbzhsV2VIdHBycG4vdjhl?=
 =?utf-8?B?aGxZMVFMUEdqcEJvL2NDTlBtMStKRWJORGkxWmpxTTlRNzNVNmNzeWxIVzg2?=
 =?utf-8?B?bnd2eC92aDVTU1RpaFNFUE5OY1N2RVIvK0RweHF3TlN0UTg1ZGJ6SFZNZG00?=
 =?utf-8?B?RUdlOU9FcE1QeHVIejZFQXpYeC8ydEpDNjhsbGlXTVc0M3cyclY2eENKeHl3?=
 =?utf-8?B?N0xMRktKVGNxdDdkeWNKbXRpdFV2dVdmaGZ3KzJCck9uUG1ZZkRGMTRrQ1Ax?=
 =?utf-8?B?OThwQXlCajV2VXcrdWFacWFJREI2WmV6NEJxYkNHNjJSWWhIeVRjUW5HRlR4?=
 =?utf-8?B?eVRXYlBQRld0Qys5ckNwbzJ4d1BGSHE2T2pKZkxDeCs0bUZSSzVRWml3aVFL?=
 =?utf-8?B?bTVHZWMwZXhmTExRTmc2Y0NzMHIvR3M0aHd3MUJUTm8vQmlsNFF0OHdlbi84?=
 =?utf-8?B?R3NNb1FUS2Z1eFJadVpyTzlKcFI0M3MvVDV5ZWZkOUd5VkY5MDNYVldzTC9q?=
 =?utf-8?B?Sno0YTlpbjFnV1EyN0dIWkdncm5FWnhRblZsZHBBSFlhUW5UQ2pJNWErSmZp?=
 =?utf-8?B?SmhqR3k4S3YrS0RwbkJnUDBBcFg3Q0pPbGJJVU9FUUJjQU5TclRQZzUxNjVm?=
 =?utf-8?B?R2J5K1FNc3lsNlIxMEd1ampWNDBaQUFvRzdKMktNR0N4NUI2eWFnVyt6dHNz?=
 =?utf-8?B?TnZqa0VUY2o0UG5BdDhYL3BsdFlYdllNclBnVlBSUkQ3L0NtOFFBaUpaTE5p?=
 =?utf-8?B?TGN1dVFWQ01YMndWaTFNUlM3bEZKWmpUaC8xcXFlUVpxS1ZwRlZocTk2N00w?=
 =?utf-8?B?OU02enBvL1hiYkZRUHNDemg2Z3hibmZldll1SGx6L252WWtrdSsrdVp1VTc2?=
 =?utf-8?B?M0tacTE0bzVERmtoZHQrZWlITmFPTGQwMnY5a2ZCd05KOFJEU3pkamZ4WEVC?=
 =?utf-8?B?aWp0RWZsTmtMK2lSaVI4TjI5bjlBcTFBaEYrYzRXTk5LWlB5NXBFdUI0T3hJ?=
 =?utf-8?B?YjhkQ0l0b1hucnkwNVgyeW5LTzUzQlE3WUh1ZEtBekhNbjh4NkduYi8zc0sw?=
 =?utf-8?B?a0NrZlJwS3dEUGRBS1Y5OWFpa2xPL25hNldYaDB0c2hRK1ovWElMMFNHTHhY?=
 =?utf-8?B?bFhCRW8xOWNvdU5hMERLV3Z3U1FxdXgvZGFGTDc1Q3dmTE15cERkKzVKWno5?=
 =?utf-8?B?QjB0aGZ1VWh4MEVaTXVDTGJYS0VjN2dWL1NuTlJZKzJCNXFaUnM1dlJ3S3Vz?=
 =?utf-8?Q?ztYxe39O95izvKTC+OU+WCMUU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?cGlNRFZoTEhULzE0VnNJa0Vma1NTRVdFeFRNbUx5WXAwU1R0Rnp5TmJidXpE?=
 =?utf-8?B?V1drdTFNNGhFWFBQcXlPdk02S21wMGRNSjJ5NWE0Wm5uZkF5T1JLVm9reVFK?=
 =?utf-8?B?S1FGUUYwUkJMYTI0TXJlTmJ4V0xvTVJpMVNONVc1RVQ4OFVzNlVVUUgzV0p4?=
 =?utf-8?B?TDJ3bFFRZHp2UUJ1aU5sTWVlQmF3ckFaREtkV1M2N1U1aGo2L0xXQjJVaytN?=
 =?utf-8?B?dHkyendFbmdNRklWWkEzNG9IaHNaSnJjdlFGUWJGTDNTenlvTHpuMitUNGds?=
 =?utf-8?B?bXYzZEJTT1pxdlQyeGJJU0laa3lzQmFXSitCajVKL3JJdU9BWEpkT0ZuVW12?=
 =?utf-8?B?NDI4dlNHWEVnbFZEeThXVDByVHhqaW1TSUxmM3luY1VFR3dyQUdIMEVidTVu?=
 =?utf-8?B?QjE2b2Zqa0o2S0ZLNkdBcnhsclhiVytVK2gwMXZKM1dLZmxVd2NiWEdRaFo0?=
 =?utf-8?B?L3dwK2lsUW9hRFBiN0tDR3FyUFpwZURpclBiRmNVRlVNM281ZnBaRkowbVJr?=
 =?utf-8?B?b0tmRFF2OVhURDNFRGVVVElkaXJNVVdpbzA0N00rd2JBTnJVajRzbi9QcHZH?=
 =?utf-8?B?QXFBMWdrMGl6WHc4TERUWjhZTTFMUzhkVDRueUNGNk5YS1RIRXJhaitoRkMy?=
 =?utf-8?B?OHdkRVBJdDNTbXp5RWV6ZlJScE5rM2xJaDhpYnVoVjYyZzNtdnB2RDNyc1lq?=
 =?utf-8?B?R0NQTFpRalFxUWtxaUpwRFZyVlhHeFlMdVJTWTh3aFFrbGRjbWlEVmtBcW50?=
 =?utf-8?B?QXZObEZoMUMvMmM0ZFFuV3pGcXJ1Q0MrK3cxNWZQeTdzZXV3YkE2NFdMYVhE?=
 =?utf-8?B?NVpISmZDeU9nVlF5N1A3eldOSGQybURDZjZuN0NaUUJnTXR1N3RtOC9yU1A4?=
 =?utf-8?B?aFNZVHNJMHhsaWlVOGhkbmRVcHI5bkRMN3gxYUdUdEt3UEh5VEl2ajJOK3Rx?=
 =?utf-8?B?ckZVaG5OMFJFOWxGUVNpQVBoNWJzWFdLRk1SdWpidWlmV2J0blpsZ0xhN1Nx?=
 =?utf-8?B?RlhXaitRbEZnMURneUFoMUFYeHNsTkVDZ3dtdkpaNFJjTC9ERmtTTEZ3dWpB?=
 =?utf-8?B?bFFnd2xUZGxFM3FoUS9CUWR3d2haalA5U0k2T2dEc1dwQ1VQWlF4L2ZZUCsx?=
 =?utf-8?B?ZW92ZGJqc2tzY29pVDdpaGJpMFpMZlVIK3NsM1JTL1g4WXF0UDR6V2ZETHYy?=
 =?utf-8?B?SVNWaW5keit2RnpGKzZPODZOcUNRNzR6LzBCaERhVHlDbEJLRUdyQ3M3VSsr?=
 =?utf-8?Q?pm1ZdQPOte+muba?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974794d6-0392-450b-14cf-08dacd69c22f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:45:34.1815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7Rt4itGBaUgRBirvfOliaE78Fls1v4jwUdbRu6eS7IzLH/ztLFXIbQdZ0C14I6ecdvjlSg28E17+Bj9F7064A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

Hello,

The following series contains some fixes and improvements related to
graphics usage when booting Xen.

First patch introduces a new platform hypercall to pass the graphics
console information and mode to a PVH dom0, which doesn't have this
information available as part of the start_info contents.

Further patches fix some shortcomings when using multiboot2, mostly the
ignoring of the console=vga (or lack of) and the vga=gfx- parameters.
It also switches default Xen behaviour from trying to reuse the
currently set GOP mode instead of attempting to set the maximum
supported resolution.

Marek: after this series using console= without the vga option should
result in Xen not attempting to touch the selected GOP mode and the
screen not getting cleared.

Thanks, Roger.

Roger Pau Monne (5):
  x86/platform: introduce hypercall to get initial video console
    settings
  efi: only set a console mode if the current one is invalid
  efi: try to use the currently set GOP mode
  multiboot2: parse console= option when setting GOP mode
  multiboot2: parse vga= option when setting GOP mode

 xen/arch/x86/boot/head.S          | 15 ++++++++--
 xen/arch/x86/efi/efi-boot.h       | 48 +++++++++++++++++++++++++++++--
 xen/arch/x86/platform_hypercall.c | 11 +++++++
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 xen/common/efi/boot.c             | 25 ++++++++++++++++
 xen/drivers/video/vga.c           |  2 +-
 xen/include/public/platform.h     |  6 ++++
 7 files changed, 103 insertions(+), 5 deletions(-)

-- 
2.37.3


