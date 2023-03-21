Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5A6C3249
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512617.792631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebhx-0000Ke-Ls; Tue, 21 Mar 2023 13:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512617.792631; Tue, 21 Mar 2023 13:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebhx-0000HG-IS; Tue, 21 Mar 2023 13:07:21 +0000
Received: by outflank-mailman (input) for mailman id 512617;
 Tue, 21 Mar 2023 13:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pebhv-0000H3-5u
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:07:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ba770ce-c7e9-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 14:07:14 +0100 (CET)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 09:07:11 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6252.namprd03.prod.outlook.com (2603:10b6:510:e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 13:07:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:07:08 +0000
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
X-Inumbo-ID: 4ba770ce-c7e9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679404034;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UCdRnpvaXdLJEzjo/YsHzG5xvQmWuhDQ4uE8Tm6cjjc=;
  b=SL1feEPLoYQFe9jgreQDIMESxGnwrSqm+WzHFckj/xjhihjViBbrmLrg
   z2ph3D5bfV7zBl2LShcTBkJXYUZv5RBHvBaz4yvYzC+/Dag3e+r0Ejoif
   F1eNdIzPtI6bRXSHdmY1/nap+MoThacDQakiosKmw2E6eYdP9hnaGCzwf
   8=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 102116501
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:B50XH6p0M24lrBtqlsx+o5oiIIBeBmL8ZBIvgKrLsJaIsI4StFCzt
 garIBmGOq2NYWume4x/bo6/oEpV6MeGyoNkTgo9qis2RSoT+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABQkXxfTnb3o+a+ERM82oMYKFfXRGLpK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqQz2QPOnjV75Bs+XFq6+vKyiEqHddMCM
 EAb4REeo/Jo3Rn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 l2Dks7tBDdvmKaIUn/b/bCRxRutPQAFIGlEYjULJSMH7MPku5oblQ/UQ5BoF6vdpt/oHTD9x
 RiaoS54gK8c5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhj6Vf6agbo2srFTes/BJKd/ASkHb5
 SdZ3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxewC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:cgYRb6pvjGXiGye56cHfl9saV5okeYIsimQD101hICG9Evbzqy
 nIpoV/6faUskdyZJhOo7y90cW7Lk80lqQFgrX5X43CYOCOggLBQb2KhbGI/9SKIU3DH4Bmu5
 uJccJFebnN5VsRt7ec3DWF
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="102116501"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcxF3/RQCeL7OtEjuAmKf1+m5BXkzE6av17jdHI17rXKZszQIDPD4gpHtIvEX9XZOVggjHKVwD/+XmDDPo/G8qN+49DyD/X7L6F24eYCLInZwQfx8dDxA7WHA4OpfUYHhsWjmnlmWboxOBk2ddqB/uE5x3dxrrz9oRSFayqjRe4eKr/RRsgEQII9wqMYgcctjiaU8JNw2ze7CrkBeu9uMFGWU5k1X93UXrW16YbwVpZeIu66ODGm2ecRFzEwf+099aOLyb+DdupmHAp2+mwv27jXn9BLOPUhu0qhJRJJ8akX3DXnm791lWf0uLN4b5E5a7379rQFsUFlLcU+IPEr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1q5RwVhqWVRc9D7jH/SZU5ZE68C1KdZ5LX16hTcv50=;
 b=Ok7V1SIhe1z4zlg45HgyLGadGcVme/M0aRY2w+VvCs5+4ksQYtn7C2nWxjWUwH8Z1S04Uazb1W2CBMP315ROlmJS8rfoRFf/WV98x4EVNL68PCIA0oID+YVpZ8Ew+5t4iBjQlkkqKU0gTk/g1n1UrCrt79EefmMPMkvSoE6Sz1UK8NgVd1Vkw19JmFz9aD1hwap9gnMXdRNO7vrvHTUq9iqDzpQ9lIpHQhKMxAJ/Yd9z8CLZ86YQZIxcQVpSgpiWcUrL/DtT3/IvioYMM0p28Yp2Rbf2YbZSnwLR+Q6qG2D2cRzLeCF6bWhcsHtMdrc+lQPUgJg+HqVBvA1juIrC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1q5RwVhqWVRc9D7jH/SZU5ZE68C1KdZ5LX16hTcv50=;
 b=qXVRGpjchHgzXez5izmm7xLKfDcO/qfZ68BOf4vRg+QOSTDsYIqtO+UoHYrmXm88xzuV+1sy9k4ouEMiWQHEYz0Dqmy/4rTEd6XDKUKfMYvG8WXsJYW5WI5e3tkdy1qqEVkufApw3gewmHhu39nJlmuvvQFuf/czKdj3I9jp7Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7736223f-ee49-5708-f871-60b45ed1ffe7@citrix.com>
Date: Tue, 21 Mar 2023 13:07:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/3] x86/platform: introduce XENPF_get_ucode_version
Content-Language: en-GB
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230321114745.11044-1-sergey.dyasli@citrix.com>
 <20230321114745.11044-3-sergey.dyasli@citrix.com>
In-Reply-To: <20230321114745.11044-3-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0271.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: f05185b4-f43d-4fe3-2b54-08db2a0d2d20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PiJnPa1+9T25HY+mhn4PJd5Y1SY717tjnRG2Tvez/BoE+6FPgIOqt+LUl6oDCTRYAK6kTXkHQEBivKkMfntbkvzc1jBlLdz/C/2jbDEYM9p5cZxFIRqsNpaEjd1Wa+eHvt3j3NNTiYOEeyXUGh1fE4gMFia4HP6sHWbc6GT7GVgHo2ZsNWSVTDRn2CC2Rfz1k1lkI+9lt0J2lReSfOOQKWxFFr/v1Nd5suCrcCeTfM/8wcwihzHlOpbN1B+Bzr8a7c6J7IGtIKIZdrBIkUCQbGMF4pBjdZGmT6pIfslOqw2Mo5c4OLIzf6eVjGPZyJpspECYGvgcxiDBBX6AXWByojrfoqLzcsf7iyCleZMyr9TeP5+IfiUHNkzmUJdfqkviw9brsqV0uFaSOH5uej3pHGknyzGlbCykf7A6CGutYp7OB3gGoNvlfB9g4dSud0sYw9a5B7q776wMfOOm6BJyd+84tQibq6PRR5dGud7kg9RcNlPCBfGYmVwpshnWkhx/E96yvhSs0MVujj9maX9XKsgRIz8gTjI9doSV1ZcP5Nc9JP6KH6DCKoFVPV2GLlAGWVsNXKxk5zeJP1qgZdZ5nSc+8UoIx0Pha9E9/M23HpX+W/CPWjEXhHwTNQonoCacuJE8Bv4Bh+YMOJgP0vvawn8bbyOxJu7tiaWP9QTghGCVTMk//GjMdXQHrDsByRUV6M8eFyes+lfNtwB9De/RP/u1+3odYuJZmhXlNQ0KTwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199018)(8936002)(5660300002)(7416002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(2906002)(82960400001)(4326008)(6486002)(478600001)(83380400001)(6666004)(2616005)(186003)(53546011)(6506007)(6512007)(26005)(31686004)(54906003)(66476007)(316002)(66946007)(8676002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzZoU1gvWmJsTHFUNU9qM2RlbCt1bVNNbGJvYld1clhqRXhGak5rbE5IZ1pR?=
 =?utf-8?B?aXQ0NnRmRGVJVE1KcHFlZkdjcnpzMVRHd1dtUVNzMjJiSjdVRHhQdDZ6ZWJn?=
 =?utf-8?B?QkFlM2VqQlNQbHZzbmZycVlieDdjQlNmZldrckFOMFd5TzMzWEduWDZaMFRj?=
 =?utf-8?B?Z1VEZk1oY0FrS0x5VWJpNVpTVXkwOU0rREJYdXZuZTJXelIybWlmdlhMWVlY?=
 =?utf-8?B?Q1ZRMmVGUjBxSjNreTVLcGg2Q0lGSlk0YmduZFB1M2hzdm5UUnIwK050SHMy?=
 =?utf-8?B?d3l3MUpNN1VpZGN1cGRkNTNpNlcwVnl6a28wWlZLQy9BaUtsVzRzZUZCZW5s?=
 =?utf-8?B?emRRVnhOZW9JTjhBajNUSzZZYTlmU1o0YkVOUStuZE5ZbXR5eDNObm1qY0Vi?=
 =?utf-8?B?SmM3NnB4cmdDSEhiMEpnVVBnOU9uOTI3ZXY1eXBDbkFMbmxhZDBxc1Rld0RV?=
 =?utf-8?B?UXNqT0dWTTFBcnZoSThQRnRVYVkySEliTkFBdDYrUFRMdW9xZWdsVDQzYThL?=
 =?utf-8?B?QS9jd0xQWG1CaWcrbnVqbjlXdmt1OThtZWt6YlpsbW14UU5WSnVFT2UwbWhh?=
 =?utf-8?B?My9kWGRJWnhHcE9tVzM2b0Zxa2pzVDBndFpZUGFuQzRUOW9NUnRjTTBPcGhH?=
 =?utf-8?B?L0pWaFFXSEptaitiWnF1dTRlcStrdGErVVdkQWl0SW5SZSsxU2o2bWdXRHQx?=
 =?utf-8?B?dFZHSWRkMk9nNEtsemdPQnZrVEw1aU9VSXZYTlBaa3JRVkNmeEEzTzc0eTRV?=
 =?utf-8?B?djI4OTFHUTN3eUU1YlFNUFVaQVgwU1VrL1RnMG1WVzJXNG5tWW9lSi9kN1F0?=
 =?utf-8?B?SUU4N2VDV0VQdlZRVHUvUmNXM0RsdjVta2w2UWRJYkJZVG9JeXg3bmxNRm02?=
 =?utf-8?B?emxQL0IrdlVZenhCN3BIZnRCbTBhdkE5czNzYUNoUEJGQm9Bck5Oak9yWnJ2?=
 =?utf-8?B?K0hKREE5VzdWR09CRWNncU1IeldxK3cwSXc1UVF5VHlwYit0ayt2ck5RcG1Q?=
 =?utf-8?B?WGFVQ1M2czdwU01EUFlWOWczWkVidG43NWZ1akRBZE9KSlRnbWt4UVZmS3F1?=
 =?utf-8?B?aUd6ZmdQUUVYYVlDTEZGenJnNHpsV2Y4S0ZBYmljOFZZVUw1OVV5YTdRYnlz?=
 =?utf-8?B?RnpwOHA1MHlqZTZ6Rjl5NW5HcHpxc3ZPVFBmc09ISlZobnZCWDR6NUlGd1BT?=
 =?utf-8?B?UHJzdTZ6THJucmczd3h4ZzM2QUlMcGdMcUlyNjhPWXlmWW5MYW84ekM0cVFN?=
 =?utf-8?B?aFZkaVJwclJhTE10MFlMNCtVTjhqc3UvRm5hY1prekE2dnpSbXZZNm5icEdm?=
 =?utf-8?B?SFZYVkUySEdadWZ5dlBlTkpYT2twd1FTUGtXQUJ4RnYzdnR1RTRuNG1mZ2NK?=
 =?utf-8?B?ZklZMWZDREZtZnBiZk1IM3B4RHlXeGZ3T3ljRVVEWVVKa2FuK3lTZEtnYU9C?=
 =?utf-8?B?NnpNNEk0N3pNdWdURVdRZjBHZGVDSGpyMUt5Rkx0VXBnNjZPVGVPZlZFVHNK?=
 =?utf-8?B?S0toYkhUbXlLdlppOFNUZ1RDU3JUMm1HeWRZb1VESXNhRUEwN1l3aDc1OXZ5?=
 =?utf-8?B?VlpOcUc2UXhTVkFSKzc5YXJwUURZNnJOZWJnUjRKRzJIR0t6d2ZJekttZ3dW?=
 =?utf-8?B?byttZTY0Uk5nZ29LOXI3ejg5NGNjYzZwK2daNlhJY3lQeFE2UXl6NVp1Slhq?=
 =?utf-8?B?QnJhVE91Z2JZc0JHcDluSXhPc3NNbHJPdkdyc2ZVUXZ3SlZZYzhSL1VYZEpm?=
 =?utf-8?B?eEp2ZzJjUzA4WURCU3IwK2JOVFpMZSs0TEFrMGY1RStSNGh3cDIza2J5VVJt?=
 =?utf-8?B?YVExQUxKaE1oS0R6QkpaVGFzemNQZSt0UWw3UVh2enU2U0ltOGJYU01vN0tO?=
 =?utf-8?B?MVVoQklxTTcwQjduT29EWWVWcFVGSHlnMG9PV0luaEZLbHZKZmtJYUdrZndL?=
 =?utf-8?B?M2lnSkdNK0tyVDAyc2MxN0NaeHRMUzhiaHNtM0pjbGxKVVRJZXMvM0xzUzBu?=
 =?utf-8?B?K0Rya1h3STkxcUdUQnpsamg2MEhqSmMzVjBDcGZQblBLQzJYSno3TnQyeGhU?=
 =?utf-8?B?WCtoSkVuKzNuVmczZzhhUGsvQVI1Y1NOQ1JPZis2ci9sNXN2cWpheW9raVhh?=
 =?utf-8?B?ellwNjFLYjBRMVdjeTZlRWxaYTYvZGduTzRDaENEbjJCcTI4Ui81RzRzOTFL?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AbeQrnncYEEx9z2+b17wrYjdHogStFWKqw6+nXUiVuIY7vynvlOrspTfJoEtwRirnKiMAWzwG3aZARCUW3YXYFrh+yMCOus7HeFLu12Ft13UaS5Vk7esceDBcDyECKtJa2cdRyB88ejuDLctTkX/+qRmsDtRiW/9FozBqODFNIAMZz0kWyu/Sds9ey9LIB+KFz8ZuGA+6obSPAwSJyjNjcYU2Cz8Alkemqzla+AtjyPvacjYyMc4fPGuv3iVArWwWkVc6YSfyWfeZj+yboTqWACOvlZj7B/tS2HHPHMDaSKK6+iF6VDUsqP/+fDDHVTWhlu/Iu186t7OBCBdxTaFLUl50nGeumrhBWGQPEjO7bwO7L+vr94hfjf6Gvlvv1g9q2rAviX+JfDUYmUW1ZUNE87Xgz4bJuh1L94CtJRw0SFtfAajeACIXiSbRBbFFgp0cKGWlHlnAWtwpa07gSlRPXtdH9oFDYYiPcD2cQM9+RB39JKJuToYXFcvncoh7++BCcocTchkx5HsoVYcaovqOBZfFvx5PR1xwmjeq9LMin9OT6QLf4yvsmvX03ezUWPtwfWPtsJKclMWQBrgC+wzSSleHb+/rkqa/0FYgz1p395BNVIVCwPIsAVIRVvdsBVkUPwfl2GG0umlmfziNw0Z8XBpgqFVgeEkGOlBhdX2i5DsQBixacjwYAQa1/4EljXaIaTITTFAz8HyauLLyGKrH3MRY0RCU2beHwQ4eWgYSRYMmHpAuWIXCFdFD4pI50zUgG1jEGMwC6odrycNEMzvNcnW7PB1aU6mksyTfQxy8J6T9kI3mAkXgePwpcSnZc6ym5i6TO/8Rz5zu3hZ65IvxFYFXN+1I4GXDyhEZjbhQdI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05185b4-f43d-4fe3-2b54-08db2a0d2d20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 13:07:08.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrL3vkR6+K//iUUTK1FMVO3dC4cH/1HMMn/LAehbasBkshd3F3sRYAE+puBAjkMjzSZMHrWLxN4pWwM6s2usxXMrdVEF2MI0LabE0WYDkr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6252

On 21/03/2023 11:47 am, Sergey Dyasli wrote:
> Currently it's impossible to get CPU's microcode revision after late
> loading without looking into Xen logs which is not always convenient.

It's not impossible (you can do `modprobe msr; rdmsr 0x8b`), but it is
inconvenient for library code.

>
> Add a new platform op in order to get the required data from Xen and
> provide a wrapper for libxenctrl.
>
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
> ---
>  tools/include/xenctrl.h                  |  2 ++
>  tools/libs/ctrl/xc_misc.c                | 21 +++++++++++++++++
>  xen/arch/x86/platform_hypercall.c        | 30 ++++++++++++++++++++++++
>  xen/arch/x86/x86_64/platform_hypercall.c |  4 ++++
>  xen/include/public/platform.h            | 12 ++++++++++
>  xen/include/xlat.lst                     |  1 +
>  6 files changed, 70 insertions(+)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 8aa747dc2e..d3ef7a48a5 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1187,6 +1187,8 @@ int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
>                     xc_cputopo_t *cputopo);
>  int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
>  int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
> +int xc_get_ucode_version(xc_interface *xch,
> +                         struct xenpf_ucode_version *ucode_ver);

Throughout, we should use "revision" rather than "version" as that is
the terminology used by both Intel and AMD.

>  int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
>                  xc_meminfo_t *meminfo, uint32_t *distance);
>  int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
> diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
> index f2f6e4348e..b93477d189 100644
> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -246,6 +246,27 @@ int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
>      return 0;
>  }
>  
> +int xc_get_ucode_version(xc_interface *xch,
> +                         struct xenpf_ucode_version *ucode_ver)
> +{
> +    int ret;
> +    DECLARE_PLATFORM_OP;
> +
> +    if ( !xch || !ucode_ver )
> +        return -1;
> +
> +    platform_op.cmd = XENPF_get_ucode_version;
> +    platform_op.u.ucode_version.xen_cpuid = ucode_ver->xen_cpuid;

Same notes as per patch 1.

> diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
> index 60caa5ce7e..232df79d5f 100644
> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -614,6 +614,17 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_symdata_t);
>  typedef struct dom0_vga_console_info xenpf_dom0_console_t;
>  DEFINE_XEN_GUEST_HANDLE(xenpf_dom0_console_t);
>  
> +#define XENPF_get_ucode_version 65
> +struct xenpf_ucode_version {
> +    uint32_t xen_cpuid;       /* IN:  CPU number to get the revision from.  */

We commonly call this just "cpu".  As a platform op pertaining to
microcode, it cannot plausibly be confused with vcpus.

> +    uint32_t cpu_signature;   /* OUT: CPU signature (CPUID.1.EAX).          */

The cpu_ prefix can be dropped, as can ...

> +    uint32_t pf;              /* OUT: Processor Flags.                      */
> +                              /*      Only applicable to Intel.             */
> +    uint32_t ucode_revision;  /* OUT: Microcode Revision.                   */

the ucode_ prefix here.

I'm tempted to say that I'm happy to fix all of this on commit as it's
all mechanical changes.

~Andrew

