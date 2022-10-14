Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B765B5FEC9B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422712.668928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojI1a-0006YA-BP; Fri, 14 Oct 2022 10:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422712.668928; Fri, 14 Oct 2022 10:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojI1a-0006Vk-8M; Fri, 14 Oct 2022 10:34:42 +0000
Received: by outflank-mailman (input) for mailman id 422712;
 Fri, 14 Oct 2022 10:34:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qaRP=2P=citrix.com=prvs=27923c854=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ojI1Z-0006Ve-It
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:34:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce029be8-4bab-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:34:40 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 06:34:34 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Fri, 14 Oct
 2022 10:34:32 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 10:34:32 +0000
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
X-Inumbo-ID: ce029be8-4bab-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665743679;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xDBNWwJwiZmRteu6HzD6/WKK+M+5jJgCr/RR1pdvPWc=;
  b=UeTCT5TsfqfUyLAa/zZR/jL5AaLAz5MNz2+Tx2jBgJJLuIojfhJSPExM
   EiO7NhSyUofHw0Wnlc0+8n5H9rZp7jcJoOMZe5GnqAMT3KV9EGO3PKyYC
   Bboxq429XdoDJ75amYQhEiBvQaY5p/cjID13hhenNj2TSwf1LhNsIRSo1
   A=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 81844862
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RqlUV6NG+0JkgInvrR16lsFynXyQoLVcMsEvi/4bfWQNrUp0gWNRx
 jdLXmyHPPiLM2Wketp1YYSypx8EucTRy4dlGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr5GtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eFpMFxKVVAk90/
 O0qDT0Kdjugh+fv6efuIgVsrpxLwMjDGqo64ykl5xeGSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsH8BTM/fNfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPkGrZriLy3IcjmwvDe90WFr2op8dTu0ei5mATVAEoa3KS9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jY8VtxKAqsF4QeC4qPO5kCSAW1sZjxcbN0rsucmSDps0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcbSSMV7t+lp5s85jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vvt63jp3ATwpw7AOIWGugt1t9fNT8P9Xu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0yTLkVx4iN2mGHpUDw==
IronPort-HdrOrdr: A9a23:u5XtLK9s7honZd4S/7Fuk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="81844862"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKesxqDXvwFdTOJP/WVDkg+fUbPTt1JeiigTuBYLDOKCnKmMHsxU/QBrUX7C8RwG2asoq8eXO5YUx3Fdtc6mJij3oi0E6Hh/5ygFG5RTUWQKZvuu3T56a6tqRCo7YQalYazUT4i/jgwc3N+xC3GtKMqYKQ97AH+jveIvgxOAWwORFeQ2AovU+Cl/3QTJXSQblraBK26QsOoD6v7Vk7j3sdDSz1pImMDsMvs/WtIIE1iTxPyIUQ7IGCDI1KXMSOhtEbSsE1wD0zqzGhQBPtNQV2ZQ9XU/Lflj5O/x8MnypzmQOBkm+12OV0YTl9d7wRB+X0YIKGbvKke61keRIAmIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al+wj885iQ4kSEujsp3hPPJiciOI+cKJD0CQ1H7TwtU=;
 b=glAjNyulStSqbQZmsI8zmeOQNHilhqzCjRefN7jBLdvFfww3sXKf6H4tsjvpvMTlA/vBHuQKAqUPz85RhHCKjzxEAMgX9AEUuAeoeYUpKhDvtfedo2LLPhEIqeb6k1dkXi8nGQ3JUg7r68CjmF6wUms8CjET+tJf6XhOS2LBkQoiMXFK6mjMkroB8nMM3i5Fn79V9b6lB51qLibkutC46+c9Wyf5ti6lqTKHFfo4HaD/+O2RIBvxA9Z0l1gOuFm6iEn7Y+uJ3RYRp66QSYTAitmtC0KhBgyc5lHVCtbMvsx60J5c//GfG5xfMHbNizE6zLGHv+wzBz4N3EZazZWRnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al+wj885iQ4kSEujsp3hPPJiciOI+cKJD0CQ1H7TwtU=;
 b=GUvWKC82rjHx99fnkGDeufF5viEiYrIV4BHacg3EGEAuMBFzmBm5VEFb04+nUF2OVEf6sKTxg5dSjpqzAAVbSgmkzV+TEf8x1tdp3UE2vGWEi3Z1kVsz3+ksKShGOz1SykJiQGmche+dwPD6sloh5I3LMhi/l5HGRtUU3R6n2WY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Oct 2022 12:34:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry.Wang@arm.com,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Message-ID: <Y0k7NCFbZuMCHc/6@Air-de-Roger>
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-4-roger.pau@citrix.com>
 <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
 <Y0gXnD4jsyIp2kKb@Air-de-Roger>
 <870d5cf9-26f7-f4c7-4fa2-5a18bfa163bd@suse.com>
 <Y0kbN+Zp6F2kBFGz@Air-de-Roger>
 <5220f340-5380-0b77-86bb-323898efc208@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5220f340-5380-0b77-86bb-323898efc208@suse.com>
X-ClientProxiedBy: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3b76b1-62b8-46e8-35df-08daadcfae2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ISisqUHeiFizerrQ52Hvumw0FIYPvT2m0a5a7/f/RMFAip63rDgOg7/NMM42yMKIoRHVIdcKJvMIp2Z1suEMOYo3d7KY1g6UPT5dNd30jTAUbdexCBlVdZR6UmlCoOxHszd505+upoKX8+coKjTRWcIW+tdN6k8yub1GoP+hPbMHf9DkoSABVpxaf/g/tkZPMRQXF+A1j+eQnhk3nvRtBZhd0P/rgi4WvCHuXkppvVrLocyDUJJX7cXyDDZxz5CEimcXXv1TuS1XAHd6df+WIe2RZNqqC5gmviQ2OVmyuQyF6uN263EQwNlTnZEljmSsT6Zd2TsZ0Wp5ZB4nRothqeuE6h57qBSa/Y2em8Sv8bQldNJMfPIILK/QoYJ+4lYXPKyAHhhIdObk7AM5iIMbX2px1nGh8hwlgrY3MdhoEph3/yaDkV7sVtFRbKIsMm1o01btu5yBxa+IEU46L6wbTaFoUpfKQlxq6rK68Dn19PRHlLjKQmXcnpd7nDxvGuwhQwvKVZXajMWWXG7eXER+6yBPEgxbVwFm8X6SfFl8BlMITPxmUcyYLwqaPaa4I51tjxY+15kxMjrp/GNrihPvYn15gHlhwbZ1EVPq3uM/RsY6YmjqSy9RW8XtXYv+MTGtNtc8Wo/biZWLq4cxO9WepkVLUUsuKiEfuRbpKf8Ts3504Tfp6oAKmn61/HXEpwbHL7feNzsAUjb01MfU39rTEzI/n6EpY3R/vIa5/vFOykQRUcMlq2N07rNbFhlz270
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(86362001)(8936002)(85182001)(6506007)(6666004)(5660300002)(2906002)(478600001)(186003)(33716001)(83380400001)(54906003)(6916009)(4326008)(6486002)(26005)(53546011)(66556008)(66946007)(66476007)(8676002)(41300700001)(82960400001)(38100700002)(316002)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhIbCsxdXRPZ1k4MGJnRSs4blNKWG9kMEtrUDAxVTdGeXNFQ1VGWGUvQjB0?=
 =?utf-8?B?dngwMnY2dGNNT3orcXEwaGNQSTBvQUJYME5sbDFDTDRZeEV3S1owejFxeGRx?=
 =?utf-8?B?NjZjeUVZcVQxc2xsUlROVUg1TmNTU2drcTR4cmZBbS84cGVwN1pVNVhWeFNN?=
 =?utf-8?B?aWxacm9JclV1bWx0NS9jMGphSDVmV3hPREYyQjZjZSt1U0puWjVqNnBPOG9s?=
 =?utf-8?B?MEkxWWFMQktYTTczN212MDJ5cUI5TnNScWptbGtDUHM0c1FGNzZmM3JXL1BB?=
 =?utf-8?B?YUtOV3BpNVU0d0JzZTdqYkZ6VFJ0aWhQekZyQ0R4dUJreXdyUUlFdFJjOHpk?=
 =?utf-8?B?SnpxRXN6UGcwaWc0d1JnK2dHZEZUSHB1MUI5bVhaUVJWazh6ZTFBaGs3YkpL?=
 =?utf-8?B?dHQ1N2lkbDRlZndpMDNnTzNQVGVjRDRMVnhwSnpwYjVSd2MvRmFhbzFsZXRF?=
 =?utf-8?B?czEzck1kUXR4QnhxYjVFQUorZWIzanZCZm9sQUlkbVZRVkthQVNYcy9tRG5V?=
 =?utf-8?B?V3Q0K3BQenNUVmp4YUxtaDFBTkwxK2F4YUt3QmdWR2x5a0l3L1owV0VDNDhq?=
 =?utf-8?B?am9jaUlKRHdXWjh6cVg5SjkrMVQyRWhKQXlVdXRVNHRBdHBJaGVWa1JvQ0RK?=
 =?utf-8?B?czZSdU80em03bzF3Y3RycmpyTEJoeUM5bDVyT2RuNU8vZUQ3VERmNk92WTZi?=
 =?utf-8?B?bmswNmViVytzUGdEaWdBSnZkUlFGM3d6bSs5VTFWazM3cS9XclVjZi9uSzds?=
 =?utf-8?B?SUh3UkdFSXRGeE5vbkZObzhMbmJpclFzMVhMVkFVQktnV1JkWFNkNjlmbHJX?=
 =?utf-8?B?NkpmV3ZLZW53SjdwKzQzUGRacHM1WVAwRTdNQUtuZVhMemttT1h4YUx5Q3JS?=
 =?utf-8?B?QytOYm92clVlRytmRUV4UFdjRWRKMUJzREx2TmhWTDNmcDc3N29uWnN0V3o2?=
 =?utf-8?B?THdkV1JLUWJSNnh3a1J0OStmaWVSVXFyS2QzUk9xQzIrTkVmR3dEMzY0RzYx?=
 =?utf-8?B?QkRmSld4VXc2dzhJUFpSSGxrckdWcTFlQnF6STY4Z1hpYzJhNWJaOVRoa1Ft?=
 =?utf-8?B?Ry9xVXNoSVRJUzQ5OEVyVmIzcEtKVytRTnJ1U0tTc2VkUjlYcHl2ek9ZaHll?=
 =?utf-8?B?UU5pSjVQOFNVUFI4a2lueUNaQmRvT1gvamdLYVNJeWdTbkE1cytkcDBiajlw?=
 =?utf-8?B?c0pRUmh6UWh3WlR0TG1ld09Jb3MxRWI0cWdvZkZIaVJvMjFOaHBhSmJYMjRC?=
 =?utf-8?B?M29DY1NOOWZFbnhJZi96RENGa2ZFRVJqa05vT1NhRXdvNi9zcmhBL01OeDdV?=
 =?utf-8?B?RE8rd0VNUlFud0QydTMxOTFUd3dMWndQV1RLNVI4ZXRFdDBEVG44cVVIVWVS?=
 =?utf-8?B?S3NjdFlrbkNIKzRIblBaZ05CWkJmeThFRys4Zkpla0lQc2lNZy9Wcno0aEEw?=
 =?utf-8?B?bzYyZWNONjE1Y0dTcHRMNld3TDY2cTg0SU9ydUZqdkRTNTVwSHRRdmJoRy8w?=
 =?utf-8?B?MzVzK2lML0lBczMxYzVudEpmdG5RczlKSFhacDlTODYxaWdFT2k1MTB4clJI?=
 =?utf-8?B?ZFQvd0s5a3RqcVcxRnlvankvMHhES2hzayt3VjFBaVBzenFRMCtHeUlJdVhT?=
 =?utf-8?B?L0dBY0tQYS8xaFp0QWRqMUFUOStDREFUeXNVZDE2NlQ5VXFUOFJLZlA4MjU3?=
 =?utf-8?B?NjBzWnI1bWVQdlZNWitSanRPQzUrM00vR2NqalJnSmxGUEtzRFBqZGRvSVRW?=
 =?utf-8?B?RDIrazFTNEtraGZvb2dwd09SZlpxc0hJYVM4ajBHNnFWVjk1aURxMVhvdEl3?=
 =?utf-8?B?RDV5YkxVaG9CNXIvQUdPU0dHdVA3OC9FNzdUWEFTbFVKbjFFZ1VUQzVLdE5k?=
 =?utf-8?B?Vm5ndXJQcUNMb2EzTHB3L25laW9EckY5N2M1bVFMNFIrRjUwc1dmUE8vRXJy?=
 =?utf-8?B?dzNubkx3T2M2TmZpNDVzblc4ZzNZa1J4V1FqMFREdmZrMGdsaEo2TzBJcFpI?=
 =?utf-8?B?WisrVzlKcGJKMHdNREt2T2ppcmFCTW9JL2cxSXJVakpjcDd1dUtScTBhOWJo?=
 =?utf-8?B?Vk96VDlGd3YvU1NFT0RYWG5XTzdRUEpjZG5paHlORVQrUGNpM2hCdXBxMXBw?=
 =?utf-8?B?K004cHZHdFp5Z0w1eFgyZTMva3ZaY0VVd2RISURpRTlsbSs5MXdjQ0ROMHh1?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3b76b1-62b8-46e8-35df-08daadcfae2a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:34:32.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47Um99FYxvmGC2KkX3BYn7WdJufkvZhNxKj22ENx6kykxj9lgRZOVW6bOTx2afhVy7/mEUE42MtbKL+Xsbku9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944

On Fri, Oct 14, 2022 at 11:00:10AM +0200, Jan Beulich wrote:
> On 14.10.2022 10:17, Roger Pau Monné wrote:
> > On Thu, Oct 13, 2022 at 04:20:45PM +0200, Jan Beulich wrote:
> >> On 13.10.2022 15:50, Roger Pau Monné wrote:
> >>> On Wed, Oct 12, 2022 at 10:30:45AM +0200, Jan Beulich wrote:
> >>>> On 11.10.2022 18:02, Roger Pau Monne wrote:
> >>>>> @@ -2365,12 +2365,6 @@ On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
> >>>>>  By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
> >>>>>  when hardware hints recommend using it as a blanket setting.
> >>>>>  
> >>>>> -On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
> >>>>> -option can be used to force or prevent Xen using the feature itself.
> >>>>
> >>>> Why would we want to take away this level of control? Shouldn't we turn this
> >>>> on while in Xen if so requested? Which would then either mean enabling it on
> >>>> VMEXIT if a guest has it off, or running with it turned on using the OR of
> >>>> guest and host settings.
> >>>
> >>> Right, but then we need to context switch the value on vm{entry,exit}
> >>> which is problematic.  I could move the context switch code code out
> >>> of the GIF=0 region, and assume that NMIs executing with the guest
> >>> selection of SSBD are OK.
> >>>
> >>> Alternatively setting ssbd= on the command line could be taken as a
> >>> value to enforce for the whole system and prevent guest attempts to
> >>> change it, not exposing VIRT_SSBD, AMD_SSBD or SSBD (haven't
> >>> looked at whether not exposing the SSBD CPUID related to
> >>> SPEC_CTRL.SSBD will have impact on other features).
> >>
> >> That would be my preference (albeit I'm uncertain about the "not exposing"
> >> part, as we don't want to misguide guests into thinking they're unsafe or
> >> can't guarantee safety when requested by user mode code), but ...
> > 
> > For ssbd=1 we could expose the SSBD controls, as the guest trying to
> > turn it off would have no effect and it would still be protected.
> > 
> > OTOH if the user sets ssbd=0 on the command line then exposing the
> > SSBD controls to the guest would be misleading, as the guest setting
> > SSBD will have no effect and thus it won't be protected when it thinks
> > it is.
> 
> Irrespective of your subsequent reply: Unlike "cpuid=no-ssbd",
> "spec-ctrl=no-ssbd" ought to affect only Xen itself:
> 
> "On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
>  option can be used to force or prevent Xen using the feature itself."

So that brings us back to having to context switch SSBD on guest entry
and exit, and we could only do the SSBD switch at context switch if no
ssbd= option is used.

That would also prevent us from dropping the synthetic feature leaf.

I will wait for Andrews opinion on this one, I would like to make sure
we have reached consensus before I send a new version.

Thanks, Roger.

