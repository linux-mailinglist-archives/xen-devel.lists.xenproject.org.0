Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1DB7CF59C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619163.963782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQYM-0001BW-C8; Thu, 19 Oct 2023 10:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619163.963782; Thu, 19 Oct 2023 10:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQYM-000197-9Q; Thu, 19 Oct 2023 10:46:58 +0000
Received: by outflank-mailman (input) for mailman id 619163;
 Thu, 19 Oct 2023 10:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zn2w=GB=citrix.com=prvs=649eed31f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qtQYK-00017k-BU
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:46:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd8d2e3-6e6c-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 12:46:54 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2023 06:46:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB6050.namprd03.prod.outlook.com (2603:10b6:610:bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Thu, 19 Oct
 2023 10:46:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 10:46:36 +0000
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
X-Inumbo-ID: cfd8d2e3-6e6c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697712414;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=+iklqGrsicX+5rwWmIBKwCIz402OQsUkWR48M06lAnw=;
  b=L2A+nS6GgK0IC3ORCnYGMeAdAc2SbAr05e5jIQizVhV11LODZC1SgGz/
   wAHtzXu3BtsvH3AyOvTIgu0pOQN8o9iaUidDFiPX5s/f+7I+Vbr1uUD1S
   vWSAd0p1vco4DBrn5D0Mabd9ZQu2TWikqZ6w3X3jPPu6bpEln/05OenaS
   4=;
X-CSE-ConnectionGUID: U5LRXaC8RJ+eoQPZ0rPlGA==
X-CSE-MsgGUID: Y0qaxLJwS0a21MvAg9gYKA==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 124647203
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:mUfUNa+rCz8WsbZLkIeQDrUDWn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2VODWHTPK6OMGqjKNoiOoWx8UwGsceEzoNlTwY//H88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPaka5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklzq
 NgiGDkmPiqhxO+x+YqJEvNUgusKeZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwX2nB9hKT9VU8NZb2ESa1kgxFyZOXAHihOeQhR+xavF2f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8boj1YYWtsAHf9awZctbfSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:jaW886PXzN/wO8BcTuWjsMiBIKoaSvp037BL7TESdfUxSKalfq
 +V7ZcmPHPP+U4ssVAb6Le90cu7MAjhHZ8c2/hpAV7KZmCP0wuVxelZjLcKqAeQfxEWmNQtsJ
 uIsJITNDQzNzVHZArBjzVQaOxQpuVvOZrHuc7bz3NgCR5ncLth6QARMHfgLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AcAjET2oY3CWRQHIT1pp0ekPmUf14VkftxVyAGW3?=
 =?us-ascii?q?7BGFQcI/NU2eU14oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJqbEzg+kbzpudyWenQlDOECQf/Yw+q2+LGISqs0?=
 =?us-ascii?q?P4ZChKwV/ajisrx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,237,1694750400"; 
   d="scan'208";a="124647203"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j73QVPq4/f0m4DZ5adB127h/pXb5egEkA0A+0yUr6vH+mxBYYBNMXICz57jA0PQhNO959D3iODLOUpYmft2WbPu/PPwRGNx7WQ03I+PSEKD8WNzFKfiUwqmmFZ87a2wRcHZvouThDj5fuC1jmSAnEc48ivlY+ixcvVQQNASvWLTEObih9BVtkWs/vyJeKIsS5JT+n0zaaxV+GGc7yAJzn2kIMn4ztw47lcQ9VQcjeX5CwZzw+Nl0v8maMy+Cxg836tqzZsp1L48cTcjbOpQp0rG8mGIMG27H3/AaHr04o2hF4SDib+oW7BdX3Aw4PMtkZRyxfYSQR4k9j0I8vl2OjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjpS+FYKGfARqI0AzJ0tD8nK2G71v5Eaq/qiMlHTqGY=;
 b=nBK5MVbqSKVlnu3VfQgdEz1jIHKWJ6oY3BSo8wqfXxl3DOpQHTOtDv1iPZjzmB7Y7Du3L2SWmv8ARswhaVEXrY65e9N62otrnz7ymAI3oP7+8HAG0afzzbl1i4LdLVQSG2hFG5BdCKi6xywpthYTS3wgdm74TcvJu0dIteHeirqXorMYUBgUOPGhnlmqQoYDoTXhZY645HZTeSxm+8Rapjb7oj6h1CcB6MDqQNOCR3CVA5KjnNNG5Y4WxfxJc5oMJDH17X0pcedjIa//I90RJZAXjfX6JRTyYBElVjZtVjiiXOcCoDpHZfwpmOdkCw5hG9gkf82UuZV+xLlG5OtpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjpS+FYKGfARqI0AzJ0tD8nK2G71v5Eaq/qiMlHTqGY=;
 b=m/5fj9TTsDY3yeQ7OgmdQTAnr6tdJYjkaWJPCZRN8l+44pnd2lIKYoOmPR17HPqJOUH3h7siosl2i4GzOCGKvE/g3/mnNgr8B65ktPO4CC8O5FiBpIEj65GuS+jvBym1lt+5gtWD6UFQ7PPLGqSpfdHZBVjLce69JmaSlgETVpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.18] iommu: fix quarantine mode command line documentation
Date: Thu, 19 Oct 2023 12:45:51 +0200
Message-ID: <20231019104551.27870-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: c4cbf4a8-fd6e-45f7-47da-08dbd090aa8e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mlWLKj20B//0yZIJHPSGCoipZcHKUi2Ofi6ALtCDb1eLgG98/lQgSMQXtoyrd3eBmdHBMQbWTEfFVPUQYyu6dChl/Xfg/+o6U0yB8TK/9qUIfwu2VUzN+fLREvk3ko023N7rUPP1u+e/sC4CWfimN9xSxmx4CcKj2mOlBubt1IalGqanrtx33OHXrXF9TeCiliVOV7cJSeeXtQ5zQTXYXRu7f++AodsOeLm8PEWqc+lcfMftgO5kXUoHX+FA+Z3Rdjc+PcaNZvjHs9o8DP8LHF/Kx4D1B5f9/NVBS3KIDybrecTgd6al6pD06xJpjFgu0rhrXAMXUCUtMnBqig9yoqm4ewzXzcoDf7kWBAY/a9UN1FQIidIpeN1WMyMYKTVBRvYTThw3JY7sHVpmEsKQXfhYHja+5Sl79kOf4OgtC+aCbfi+tddYnXKI3E2WLVjUHWg40U7iXNgAusd1I3dbtk5btXXMeH9R2WeTlYgwz5gUFsI/ZaGOfCC393+U2EBdTzthWupdK2xsqpRsnwBa1nFTNpJLLkFhEpKVEPLCbeU+ueQhnOdYk/kD6dGo/agW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(6666004)(2616005)(66476007)(6486002)(54906003)(66556008)(316002)(478600001)(66946007)(6916009)(1076003)(26005)(4326008)(2906002)(8936002)(8676002)(36756003)(41300700001)(5660300002)(86362001)(82960400001)(38100700002)(83380400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVNwSTU1MURVeTRkVUJBd3FMU214MTZCYVczejZXUVloT2toWllucFgvK1BN?=
 =?utf-8?B?VCsycW9IYStKcUQ0aVpLa25pWG9YVVZKRUFnY1V0V0xqSEpkQnh3VmpBQlJO?=
 =?utf-8?B?alJSL1Q4NkJONHY0ZmVhV2d3RjMwZEdPUnFUb1hUckZESU55T1BxSlpCbDFi?=
 =?utf-8?B?RkZ4VnRlZFVQR09RRGdEclEwejA2QUV0YS8yTHg1QmJJNHZlc2g2anpCTHlw?=
 =?utf-8?B?Q3E5NDdKMkJxbndQM2ZXbGp6L25xVXV2MVhETldkZEZSTG1xRXpCVkswd0NT?=
 =?utf-8?B?cXFNOUowdHIzZVZaSGpYWWZ5VmRyZkxkN3dXdHlMa3FGa08xTW9yS0R5YXhH?=
 =?utf-8?B?Qy9QK1F4ajFlWnJvbS9TTGhrOW8vUWxnSjNjOWVaMzV1QkxuNXZVbWVJQTNu?=
 =?utf-8?B?SkYxUm1qQXA3YVFvOTJzRlM3TXpheWxuS09GbjJZVHZJeW9iYU9USEx4RmhO?=
 =?utf-8?B?M3YxSW9FQjNuYVpjaDRocm9yZGMvaGRCUDZiL0V1OFZjbDNkWmdOK1VEb0k4?=
 =?utf-8?B?ZVFKdE9xUlRmVXB5VGpoaXhUUk83TVFTa3BHSm42VHVyUmhoWDN3VTNxWDJD?=
 =?utf-8?B?MEQ2TE93L0x4cmdVZ3Q5cFhIMndNa2JEWlZ6cy9wMXF2UUtOSXZoM296SFNS?=
 =?utf-8?B?Z2JJby9acnhaNk0zMDBLQlJ0MWNNTkdmeXVJeklqYkRZeFZ6SzM1U2h3aGVo?=
 =?utf-8?B?TnBwbG1ORnR3RlhtVjZDTDk3eTM5Q2lLbmxiSk9yRHphdkZrd0VxRkZJbW1u?=
 =?utf-8?B?MkxjMTlzdnpxUCtwcW83OTJQeXZkQVVDNUhHbFBDblVlYlFMd2dmeFYwQ3U3?=
 =?utf-8?B?TTQ4dFUyS3RVVmNLdkhTbUpSM1FSK1ZuajlJSEI4Sm5WM0pjbzhtWDcvRzB5?=
 =?utf-8?B?Vk1XNTBmN3FnRVNhNFVtUmtSc0JtaTVaRFJBeGNIUGtIM0llQ2lSOFQ2M0dq?=
 =?utf-8?B?UVdadVY4Y2cvUlkrUUN3VUhOeGVVYmZLMWJLTjMycFZWM0REblNjQmh4ektC?=
 =?utf-8?B?U0FMTjgySzZHd2lnZExRMTZrYy9UK0toanJ4RHNvMitsZVZUNmJaa2owQkxR?=
 =?utf-8?B?enFwTWpVcHdZbXFCSXpDUlVXTXYxNTRBVWUxOUdsWVJnQXJVVmo1VmN2MlQx?=
 =?utf-8?B?RVFUbkkwc2JxY2d2UktsU2p3VlQwQncxaTZZenFGUzEzVi9ubkJiWXBqVWVq?=
 =?utf-8?B?Y3hNZ0NjR291U2Y0dUt2eWNkL0JJL2JCM1ZKb042ZVpVcWd2NVo3cTBFblhO?=
 =?utf-8?B?ZHNNcHgzRkZ2RWk2ZkpqdDN1a21YdFVTbXRYMXAyamlNb3RWcm1QSlhHdUxX?=
 =?utf-8?B?RklOaElId3ZXRWxlN3N3QlRrMXBTTDdNQXNsbERyWUMxV1pzUloyVWNqKzhW?=
 =?utf-8?B?QU1uM3hld3NETlhuY2JIU1dPRWhScllZQlFweG5GYzJnNmlseHhEQmErOThw?=
 =?utf-8?B?N2ViOUpoVFdHcWZHRGpRZi85bmxOSDBFaWJJaFY3WHVTQXAvTnZyd25XUVA4?=
 =?utf-8?B?UEdVWUlHWTBNckJyNjdJaXozbk5qNENCUVQ0cnk3SDVYWDV2aGxUR0QxSmdN?=
 =?utf-8?B?QjJxUmRDUDFDemNzQW9NVlNUbVVFSituZjRZMGR0cWl0VVMwQjZPVFBha0hW?=
 =?utf-8?B?RXhyMjBSeWdMK1FHS2JrVE5iOFFoUEVjUUpEZk43YkgzTjZqTlFKZFBpK1ZE?=
 =?utf-8?B?KzQ5OG9wR1Fab0Z1WnFvbDlMcDQ5MzVNbGRGMW1PWHpDc0xMbzhHSHhFaEEz?=
 =?utf-8?B?QUxLSE83VkNRQjYxUW9XVmJRWk1pTHRnMTFObWRLQmcxVEZXWkY3bTBRS0Np?=
 =?utf-8?B?TDJ3NjJvcHIrQVBtZDdjdUxYeXdDVHZudkoraWkzWkx6Uml0cEo5QnJ2dGx3?=
 =?utf-8?B?OHBpNTBrZXpROXRNTTd2cW5MWlkxV3k2KzFZcFJUbXF3UGhPSFBkOUhLNVpx?=
 =?utf-8?B?NnBEdVlVVmJzSFlyM0VHcGUxTHp4YlRYUVdhRW96MTdRYVltVzJ1akhkL0Nw?=
 =?utf-8?B?Q2Q5RENzWUxMVkszU3I5Q0ZlMElQYXd3cnRrT05TbW9yOG1FekdscHlSaUp1?=
 =?utf-8?B?d1JMb215ZHd3MkNZQnYzZFFyWVF1ZnpabUs1V3N3aGxXaG1WeE81SVFBMFBs?=
 =?utf-8?Q?VyxvZSyBGl678HmzZa9tiXLzA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SZDGeFMkx0ymV+xFpLTQsLnA7qZMarWJtAV4fwQImCWUr1JADbXBna6XwS3CkOMC061+m36A/kf+dTYLl876ZMB+XnmG4axjkXUax1vangDpZrDNSsvGaWkWD7x2PEdj2LGH22NL/Sy0IUW2X8pro8cfA/IkjM9VpN2WqKeCbnECHpWG8UB7hV7BCv+UFXhvvU7HwEEDsKxlHfv/Zf2tBzl5icjCoNtl0gf/Nnt1uYYUOD7skcYWgQDymX+DjMX/a1p88bwDV0kd0Vlblm/Jc6+wMHslS4Ruagta4X/7moTtYcWpZULPJl9xw6OexaK6QK9fwPONIaKnGsexA10h04UJgVFv4GUmvrFnkzhN41tXjS/J0ivCRc6w+oioCMxMo0pBsU1eVEQARLOy3y+XXDqGk6TO44jL6LvpyJAQQ7M54p1SYV7pqtLF/Y4pTeTZRWR4vqb+ZWh2PMd2wmnmDwn/PJNjpmQjM2lNpBUMG8jJuPyurFlOpy10PuysATe8xeZz/chh+/3NySHBSsb1pWxkawfyQzw9R5iimpZhEHo9zfXXWDiiQ47s38QUs7hQ/7cHbq9/dnYABeX0eN+pMaAAfNkjwepuUnBQwaNdqwbInibZDrt2p+/HW8KecrJ1gb2eUTpoddQhx+/1rp7503W+KbD7YaisDQR69Sh2104WQpuXNSUWW2vYqGmkIm1vF35LkKBTEcrwm5xyC7NRFOi30fpnPBVMqn1cCInlIrk8wtlL1Mc7qUEjrdDGg+I3hRnMezG7ZoMHO9N0LsC1OHD+8u5kPVdzKnKrxgW5NoBEq+59w5pKqUSa9apZXeoKXqNZ+Ivvo/dDLLqZCY0+9kycBC54FNyqHfvdI+hIXX80QLMv2FRMxXAduM9K311B
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cbf4a8-fd6e-45f7-47da-08dbd090aa8e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:46:36.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPJJ2Zj/sSULVUtxu8XFS8NvisQsL4Z1tdCU5pK5xKOR5aBeIxUqtvZwPcnxhhUJJ28ca0nwFE7dAg5i5l5eMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6050

With the addition of per-device quarantine page tables the sink page is now
exclusive for each device, and thus writable.  Update the documentation to
reflect the current implementation.

Fixes: 14dd241aad8a ('IOMMU/x86: use per-device page tables for quarantining')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 604650aaeeef..9121d8a29404 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1520,15 +1520,14 @@ boolean (e.g. `iommu=no`) can override this and leave the IOMMUs disabled.
     should be enabled.  Quarantining can be done in two ways: In its basic
     form, all in-flight DMA will simply be forced to encounter IOMMU
     faults.  Since there are systems where doing so can cause host lockup,
-    an alternative form is available where writes to memory will be made
-    fault, but reads will be directed to a scratch page.  The implication
-    here is that such reads will go unnoticed, i.e. an admin may not
-    become aware of the underlying problem.
+    an alternative form is available where accesses to memory will be directed
+    to a scratch page. The implication here is that such accesses will go
+    unnoticed, i.e. an admin may not become aware of the underlying problem.
 
     Therefore, if this option is set to true (the default), Xen always
     quarantines such devices; they must be explicitly assigned back to Dom0
     before they can be used there again.  If set to "scratch-page", still
-    active DMA reads will additionally be directed to a "scratch" page.  If
+    active DMA operations will additionally be directed to a "scratch" page.  If
     set to false, Xen will only quarantine devices the toolstack has arranged
     for getting quarantined, and only in the "basic" form.
 
-- 
2.42.0


