Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4503E7A7583
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605250.942848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisJt-00059b-53; Wed, 20 Sep 2023 08:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605250.942848; Wed, 20 Sep 2023 08:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisJt-00056g-1R; Wed, 20 Sep 2023 08:12:25 +0000
Received: by outflank-mailman (input) for mailman id 605250;
 Wed, 20 Sep 2023 08:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1ZV=FE=citrix.com=prvs=6207273cf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qisJr-00056Y-Qy
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:12:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b1c8c37-578d-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 10:12:21 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2023 04:12:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5013.namprd03.prod.outlook.com (2603:10b6:a03:1e3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 20 Sep
 2023 08:12:15 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:12:15 +0000
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
X-Inumbo-ID: 6b1c8c37-578d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695197541;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jnj17YXjPEWPkfHQ/BK8rkXYvmxP2A3IjRDoACu+3ok=;
  b=HOaUooQTfCfTC7Rj+vyufcIEFxBRTZENviXEMLig/fYUUn2qtOO1oBug
   i+I/D65+pW33CJFzXNJBi0eiqb4sFl3PSJyasmcFwv6WogwCU5DAWaObS
   /RLzH2dPD87Mh9aTZcKRtgkIPh+k9Xvn/o3+Z3MyzH2OcgpN+pWLV+h2G
   o=;
X-CSE-ConnectionGUID: WDA0YQFWTGSOe/3oMsWcRQ==
X-CSE-MsgGUID: SexDv8YOS5qNfm1QDLW+cg==
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 123200707
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:EE1vM6uP729d6+S6DUOEk7/HBOfnVOpfMUV32f8akzHdYApBsoF/q
 tZmKWHXOK7cZGT1ctknbIuwoxkHupSBzNU1SAY5qCs8FHgU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6EzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFxwkNiG6qd2K74mcR643geE4E8LRBdZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIC9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtlITOXnrqECbFu7/WEDJANGZHyA/OCfhEvnYv57F
 A8f9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L83QGdAWQVSy9bX/YvvsQ2WD8C2
 0eAmpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnVcpuD6evkpv1GDX8z
 jqQpS4yr7wWgYgA0KDT1XfDjjG3r57FVDkc4AnNQ3ml5QN0Yo2iT4Gw4F2d5vFFRK6GSnGRs
 X5CnNKRhMgMEJfLkiWOSecMGbiB5vCZPTmaillqd7Ei+iqs/Ti/fIlWyDB4OEptdM0DfFfBe
 EbOvStB6ZkVO2GlBZKbeKq0AsUuiKLmStLsU6mMasIUO8ArMgia4CtpeEicmXj3l1Qhmr0+P
 pHddtuwCXEdCuJsyz/eq/oh7ILHDxsWnQv7La0XBTz9uVZCTBZ5kYs4DWY=
IronPort-HdrOrdr: A9a23:5eLSTqHKCu+zcx/TpLqE98eALOsnbusQ8zAXPiFKKSC9Hfbyqy
 nDpp4mPHzP6Qr5OktOpTlRAtjifZq0z/cc3WB2B9qftWLd1ldAQrsP0WKY+UyDJxHD
X-Talos-CUID: =?us-ascii?q?9a23=3A4cBzn2oFXxiqVVRaQQRdlejmUf8JWyXs9VnvH2C?=
 =?us-ascii?q?DLmsuE7qwUmCbwpoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AaqJlsg1V4nIlNw6Nam6VZEtHujUj2Km+JF5doLI?=
 =?us-ascii?q?95tCiOykpAhu5s3e8Tdpy?=
X-IronPort-AV: E=Sophos;i="6.02,161,1688443200"; 
   d="scan'208";a="123200707"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVwT+4wlq6fWRK++z2+hXSAYsfKJTkIkGkIgW4RCFKgCp+b+JAi0JN0iMDvJy1YTXJ1DKAGZszecTiDCt+kModwZvZPeQNtOywbrlfr1cxQw3msqJO61izbiBT+laqhcKk/C8h1Svy5x6njSVhQUjLHNfzgjYWq9icWEB0I8mlXZ7bq3i/c635cg4gzVfw3mfqOTPoVzaol1k2iOwthKWjrF2xbf4pT2Tinh8LvM+I2oGrif+CuhC6KMaOODawtOfJeFxQoC/EXqUKVSp0HPwuWy0luVOzK55gFARjOr/Uax/OM2mp+QsJ7f0Yhx/E87wBOFLxs/eoHExZ8VshbwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCIr2BTrdjBwf8JwussqK1yt2W6NAgWjxI2uXKZS1us=;
 b=S5ltXKazBl9NZX8CzLrt/5MSHnDGFyUDIbZHiYrGKxRuDtvN255JonrA8FxxaKAR3aJkAMGYqaBYAwOUM0El/aNoo8wI8sAJg+Bn4KYb8LBg1zNM6/KeZ12XmoMOleuOxuzz9hSrhtaArqxxdYmfoX2iMTAsXjP0KfhwPj7dvXA4485wxRRTUirDCsMJvXVetyGR2Kj60eDtvoOuo1Kpk0lUvvgt+D0gTp/Cmty+6YdU6H27dlRpcisqAC9Z0ZGCwuGVxn6gkT5Hjvu1pgSxl9CZoVpHwWGJdp/3bfwQZhHGaSbeTKplQjsHUkqHXoKiVgLkWqWDTPVj7lS72jZ0Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCIr2BTrdjBwf8JwussqK1yt2W6NAgWjxI2uXKZS1us=;
 b=UMugf6ner1wL62mFoWX4pK2DOKCoSSLE9g0+itXvwdG2qjt/VgikhxPbLs68N+f4b5x3qG0wqlhyfvRqUi6rz1+c1BBj7qFyMMdoFNJrRImpBEX0ocWTU4H640igJQk+3KkeLMurROZFXxIzoj0QhwFr7BwYZt7/J61zm8H0tLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 Sep 2023 10:12:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZQqpWTT5SoY5Lt2q@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
 <5cf73ef3-3ec5-9539-3a29-b8535a73d9cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cf73ef3-3ec5-9539-3a29-b8535a73d9cc@suse.com>
X-ClientProxiedBy: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7d8c14-2846-4316-6735-08dbb9b14c87
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MvjtQzMMqiCA6Pp3TYXcWSZWiProyI8TpoG7gJL7dKy4tbjHiePi1LSS66w/Cxh12+b5tK/6q6J09hayP8zhHLVYOa11tu5O0PkICD6xz8PShQHUEIhW+zb6+4JoaCNkQsU2vPiL4yhAyn8yXs2wx7IAZH4lwru9rbYCp3RSoPkAWZc3pLPGxrBW0zbDwteczczUTGgDekcHIi0XauMsMz5cf6uj134Xx4xK7HbrmIdzzAYlVAKnULEt1aogLq6hE5V4vYkBvIJz/bsIyGzVn90+gxzEJLjPdPlePUt/E1fnhHtyLeq6Wzrsv/K6rfSJSb/dATVqiLqYCyxPmAoOptT+Fpeobzo7H5Pr1yrauF1KmVaHR56b7xKWXRgou3aBkMSTwzkKU1G005/QYSBgl6GyYvj7lB8r3OLs5RKMdsPf5xmJE5tnVOWvkBKsuROHEVFY5J5CFMmAjI+JYVA9dPlt8Li2de813PQ4vawGDwk5tP5scn45myvuQww3QYVeAxAKRWxa5smQwnFHxoE/kuvyAIBfCz4Uzz0Bszg1JiaX4F0ZjAx1ZsNm7bWxG3G3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(396003)(366004)(39860400002)(376002)(186009)(1800799009)(451199024)(6506007)(53546011)(6666004)(6486002)(6512007)(9686003)(478600001)(83380400001)(26005)(2906002)(7416002)(33716001)(66476007)(54906003)(66556008)(66946007)(316002)(4326008)(8676002)(5660300002)(8936002)(41300700001)(6916009)(86362001)(85182001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzJ6Uk82ZDB2cTdHVjIzbjVtWldOV1ZWMlNCNzNYOVlzNlpVWVlHYUZabHhZ?=
 =?utf-8?B?U01Ha09RUEZnaUhFTXBiU1ZrTVdIUHU5aDVPZC9vOG1oL1k2MDg2dDM1Y1FR?=
 =?utf-8?B?eVBhK3duZlZQcXNWdEkzRDBOWlphU1R1emY1dVd6VVJkV2tmZ2RacXpDRFli?=
 =?utf-8?B?T3JRbVRiU3psMGhDNHVYYkFOamJUUUdnV0xyQTFSUjMzbFREbGQyTjZxNkVD?=
 =?utf-8?B?OFdnRVBidmg4SmIzMUVuNm80cVNzK2pzUFVvL2tzaGVqeHl1WU1rNHErZXVG?=
 =?utf-8?B?WmtWd21pZkR6RElWRWJCRTFpZlo0M3BUc1crOWVGQXJKSTZaVDNndmxNZm16?=
 =?utf-8?B?MmZlQVMxTktjZ0Z0SlZHN25mUTVFUjl0dDlYMVU1bUlTQjBlV004SW5hdW1Y?=
 =?utf-8?B?eEw3VGROcWVONzFCOVVkT210ci9WUk50aXNqZkgrSHVtay8xVVplbFZ5enEz?=
 =?utf-8?B?WitBRUxXaklaUWcydTFaRmI0aFR4a0N2dDNkR0trbC94MnJ3RC9aZTlrTzRG?=
 =?utf-8?B?WWJJT1drdnFWeWhPTllYdGh5bTFIdUh0M1dFL1Nqc2JjcTVyWGZ3cUI4SVZj?=
 =?utf-8?B?RjZvSzBOaHhHWXB3NTN0MVR2bWdRdTFuMUVXS0lTdFBhVS9XcEkreUtVbXJW?=
 =?utf-8?B?Y3VGQ2wrWHN3dGdtU1BBV0pMb2IwSGpQWkVBZDZ4SDU3TGRSKzNLZVhvU0NB?=
 =?utf-8?B?Qm9XSEhvcjRWcmhvd2Y2ZUd6ckZ0ZHphbkpNQkZWUUFSUGNFOHhvMHR4LzNz?=
 =?utf-8?B?MXR3RUNLMlAzQ0grSlpyOEpENDZQbk56VDNTY2MraFpBNThTZmI1anAzU0dI?=
 =?utf-8?B?VFhYcHNLODdOa1B2TXlEMGNzTUtpMGVZVGFZVVE1TFc0UmdWRmdaeFhJSEYv?=
 =?utf-8?B?QUhrSzJNaGNqME83ZWxCeVY0aWtHdEllek5yV2Uxak9NbkhpSlZjeTdGMnZH?=
 =?utf-8?B?a0NTb2FYem50SnZpL2hjNTBPNDBDWi9TNE9sVW1sc1BhQUZ6WGV5L3hLS0FI?=
 =?utf-8?B?S1NuQlEyYStmVE9VZHFhM2M4SXpGT0ZSUmFaYzZ0d21nRDc2SmRNdEZZWnVC?=
 =?utf-8?B?UG92K01HRklPdnhUR3BCNFQ4UU5aOFVzd25LMUc0dFJQdm53dXhIYktqeFdN?=
 =?utf-8?B?eFpTeklYTFA4OXRKdUpyb2M5amlUSjZ4WW43V3J6dmlkeXNzc1J2L3NFK0Zs?=
 =?utf-8?B?SDZVY3BIVDA1aEJVZ1U4TlpOOTIxWjUxQ3lCUWwzWVE5ZEFpcWd1TjgwcTNQ?=
 =?utf-8?B?SWZjLzlEck5IUjFDWFlQZUNZYnJ6cHJ5VlFmd3E3ZWF4UDcrNlNrL3k5Q2RC?=
 =?utf-8?B?eENjQUkrc2R5ajFzbXZJNWl3NEtHamo5VzFnRHpIanplT3hvSVBHT2RUYTVT?=
 =?utf-8?B?TUZpaGZVNmxGU05vWjUrRGM0dHRkQVE0OGdZL2MwUHNnRElmN2JDZ2FNdUZX?=
 =?utf-8?B?Mmc5Zzc1K29VekFjVTRpcWJSYWYya3VoSnZqK3cxeWtZeXZVOUZJWVBVcnFy?=
 =?utf-8?B?UFZ5Um9uc1J3N21zWWYxUnRVQnFBVktSZVNmQXduZ1VhaE9FaS9YNGJOa3BB?=
 =?utf-8?B?MnZUTFV3SFVPWkdQUVVSVitFMk1EMnZzT0RHL1pDQUlYcldMNUNoeFRFZnQw?=
 =?utf-8?B?Zy9VeHdyZGNtT1NLL2dLdVA2RHFWbDJlaW1keS9Ec3podUc2bzd6a3daSVU5?=
 =?utf-8?B?WGl3am8xT1l4b3hXU0dMcXVMZVcyU1FGU2VJN2F6b1RFRG8xbFdtVnZRT0Nu?=
 =?utf-8?B?dFZEM1dhdVNpZjBlVDBhNVNUakJ1cC92MVJBQklYMHJTeS9kMHdQVURHZ2V4?=
 =?utf-8?B?RnNqcmc5SWxvQ3lkbHY0Vm1pYW5VeDMySHFFVzFwVWErUFhJN1dwdUdYWXFQ?=
 =?utf-8?B?YXh5amxhZjNrWTkzK1U4Uy93dnk3cFduOXN1aGp6N3p6RmlTQUp4UElPUVJu?=
 =?utf-8?B?QVR5SHVQYWlpMUJxNlZPQ3VUK1pIOU1Nd2ZMRVBkMk8yQjZXSEdjQTBvTTY3?=
 =?utf-8?B?dDkvRE9qM0Zrem9NSDhJdFIvdDJJWGZ5dk1LQmZocnNiTXpOc3B6WUE4Qncr?=
 =?utf-8?B?YUdwRkt2czVEMmg1K3VlTlRXOFZtdUtDOE0vTHJRdTZvejFUT0ZQMHV0bSsz?=
 =?utf-8?Q?T2t5pNu7X1n1rMGXZvXVAYe8i?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IWuEJCaK5zOop6M052xNsuVZcVzW+pKXOECVLuWsLsBBIAcM4wgJXHRHSEWqwY3QdVLKULJmrkp3/oO+EOlKDr2dATXvuSSd+5dLFbc8vYVdf/4GP2IOjtt0GXYVBT7l7i11vuYMnYBaKgsEXyAp0mecpktfHGo+O4tIJLGli6XA5oYO3qjhqre2qJ3e69RFYGpJBXoPKPxyS0TNF7ICRqaltxFSFxIizJa7uCuluxGqAM6gKoR8R9HuTe8ey1vdbJIlrcG5WhfxxsK3DZ1Jzcj4buSJJ2Zq1ZP674k+sR15DuFJCY8OCLQyoGMQLTocivLuKEf1ydNImcF6MgEaCWs0rnNy0ku6fyoTHoWBjeeQSbqHzuD0FWufercSENSXiIG/cMzWB90OTogxB6tGTUY9YHiufc7ZD1mlBMBqaG6zNjIHpGPYMFesh0Jv9itWDVjU9oZgXlFDSrXNgwCb5wtOzK1eQ+OYl0ToUBcyVTxAlQHJXtyHJ1xLYj/A3vo4CzJ27Q0pv1lZTcd8Sy6hgHLRUoybughpsvIHxFHvsJmioNrpzgPKLAQpg+xi0Rh2B+nyzZKycms+1uvbHkNLSGsz861OFcG8eDkgmANdEZE/MnUB0ddCL0LInrwed/s/aNtkO1oT8+c10SOe0YPV2kwZulS5ws5y/8lxazvbq6pzDnKjnODms4ufmMbrjCMa/VEXDoxtZMzfRsaUANp2QrQ1bJPdYHmbQyjhmTnPt4nJ4wSLYMj5dWl7L68TplaMOEdE/9xCBlgkk8GQkYZKGDxSsWwLHITbN8Q+fyHV2jI7U0pXbGDo3OPvZ2a2BQkaH2qcl/JDgaCs0Y5haMn4Q/up0p4qwH5eUSvJTCEIEKaOdhRhz/XP4UdFa6DL6Z4pIa1MqPkZZw0boA52hz4L/Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7d8c14-2846-4316-6735-08dbb9b14c87
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:12:14.9993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dg//BZQz4ir5X4RKw1VVO4ESbdCgjmfBjNamIGRMRSEAnA1K0rap4Orcbsli7k68R84gBUnsDCymqdA2qfvPJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5013

On Tue, Sep 19, 2023 at 05:55:42PM +0200, Jan Beulich wrote:
> On 19.09.2023 17:39, Roger Pau Monné wrote:
> > On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
> >> @@ -2908,7 +2908,13 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >>  
> >>      msi->irq = irq;
> >>  
> >> -    pcidevs_lock();
> >> +    /*
> >> +     * If we are called via vPCI->vMSI path, we already are holding
> >> +     * d->pci_lock so there is no need to take pcidevs_lock, as it
> >> +     * will cause lock inversion.
> >> +     */
> >> +    if ( !rw_is_locked(&d->pci_lock) )
> >> +        pcidevs_lock();
> > 
> > This is not a safe expression to use, rw_is_locked() just returns
> > whether the lock is taken, but not if it's taken by the current CPU.
> > This is fine to use in assertions and debug code, but not in order to
> > take lock ordering decisions I'm afraid.
> > 
> > You will likely need to move the locking to the callers of the
> > function.
> 
> Along the lines of a later comment, I think it would by rw_is_write_locked()
> here anyway. Noting that xen/rwlock.h already has an internal
> _is_write_locked_by_me(), it would in principle be possible to construct
> something along the lines of what the comment says. But it would certainly
> be better if that could be avoided.

I personally don't like construct like the above, they are fragile and
should be avoided.

It might be better to introduce some wrappers around
allocate_and_map_msi_pirq() for the different locking contexts of
callers if possible.

Regards, Roger.

