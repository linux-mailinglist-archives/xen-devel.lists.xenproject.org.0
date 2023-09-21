Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE67A95A5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 18:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606507.944448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjM9J-0005Db-UD; Thu, 21 Sep 2023 16:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606507.944448; Thu, 21 Sep 2023 16:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjM9J-0005Az-RN; Thu, 21 Sep 2023 16:03:29 +0000
Received: by outflank-mailman (input) for mailman id 606507;
 Thu, 21 Sep 2023 16:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wI4U=FF=citrix.com=prvs=62171ef32=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjM9I-0005Aq-6U
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 16:03:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 647c1590-5898-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 18:03:25 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Sep 2023 12:03:16 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5901.namprd03.prod.outlook.com (2603:10b6:a03:2ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Thu, 21 Sep
 2023 16:03:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 16:03:11 +0000
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
X-Inumbo-ID: 647c1590-5898-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695312205;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Kj5gGd/NNQU3AW13KD1sVixPgYUNyYMhpJLHRE0YC54=;
  b=Ruo2MoOYduMJB+jcd0KSrv3G3IHc7KifZJ4ZOv6/04LqQ8E32jT/vVSr
   nKuoQHpVqFrNUfbJ/7bmESc1814aNhVrSdD+Gr9hm3y/yJClNtk7FHDAC
   amhh0d3n6SDHy6PX3xrfLYElGM5aujfszAUhRt/28c1MYwSiDPNu1W/Xy
   4=;
X-CSE-ConnectionGUID: 9841ItYGS8mi5Lq598llyQ==
X-CSE-MsgGUID: ivEFSOs+TN2rsAmZJ/NAew==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 126152516
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:6qWvnavDmerR7eJmwiBI0px2PefnVPZfMUV32f8akzHdYApBsoF/q
 tZmKWmAPvuPajOmeItzbIrj8UoE7JLdyYVkT1M6rC01QiIV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5A6EziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMweWBRNzGfts2NkLe6F81125VzKM36BdZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtxLSeflr6ACbFu7x3I+JiYxThiHh6OjkWe7afAYD
 WUZ5X97xUQ13AnxJjXnZDWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAOMWIdbDUYCwsE59Xuqps6iB7nR9NvVqWyi7XdPjX9w
 CuDqiQksJwVgdQWzKWw/V3BgDWEq4DAS0g+4QC/dmCv4x59ZYWlT5e18lWd5vFFRK6bU12As
 X4si8WYqucUAvmljzeRSe8AGLWo4fetMzDGh1NrWZ47+FyF5HqLbY1WpjZkKy9U3t0sfDboZ
 ArZv1NX7ZoKZX+yN/YpM8S2FtggyrXmGZL9TPfIY9FSY593Mgia4CVpYk3W1Gfo+KQxrZwC1
 V6gWZ7EJR4n5W5Pl1Jam891PWcX+x0D
IronPort-HdrOrdr: A9a23:ZCGila0XBZabI+dKqrnmhAqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-Talos-CUID: 9a23:OtICS2NH9y2U5O5DCXk7rW8IK+8eInjckVPJfh7oDWJ4cejA
X-Talos-MUID: =?us-ascii?q?9a23=3AjYa6ug0TDgmFP7rVHphxSPnqNjUj4rqDJnsqitY?=
 =?us-ascii?q?6nZOeLgV1CRXaqh26Xdpy?=
X-IronPort-AV: E=Sophos;i="6.03,165,1694750400"; 
   d="scan'208";a="126152516"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hob1+uYS/X1jnvbhLVvphIjTBYbb1FRmjedmLN6s9OAn7MitmVdMnE9BV2971XAMmFO62t+oIqbQEfqz+dOjMWo+4uFO2UHKJnYGxfAlfvQn5sN5Zs3YH1W9g3Iy+W3GtIrOyWs+bqcJ/7SSOqD94eQNIr0oaeODTGKi4CKVZEK1lpe2QZiKhgc2QUnqgJMa8uuWnGFarfWBGHCXulxBAHQdvyRRsVJwmTc4M1jzN+y5AIJ18IzF6v9te3N+DnCs/Uuu4X+O0AhzOgkMphxISgqQvn1uuB4asGp33DcQ5PAmxwftq9NEIq51s26SRXKzXJPf3ufzixv+vHM3JN9R7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asL+1Ribng+yURLV9h70yjQN7omSjl581XJ/JU+tp4o=;
 b=SQGqBmb+FAANh9EPcAkcK9OR8e738gPTUPMt3KQsY64TrCec11RPn+anFhH5YApjlw+7d9ip4XVwijrhrtqKmxKOa11eywZCtZHdJT+RPFkQYHUhFy2S4jwG5dqTnS2bIIRkW6/yQW8FS869PJ6FMe4MImOBUi3kJ+N9/K9nQL3ZY/gRbwYngtKnmwWjtV5+k8R5xhkI1TQmXcD4HyOkdSexIVWVOlEZDNlJKm+KNTwzfXaFCptncFuM8AW8j7V3oXBEAwUgHbpG8wwmsWEZop3zT1eB9U/2vgLP5CTNvp9XBZ1snU3/+sPuKO5Kpc+WgENRB2+/kfQIVVU2TVMnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asL+1Ribng+yURLV9h70yjQN7omSjl581XJ/JU+tp4o=;
 b=bJvxYUIdI5WSGC/nvox2l7u8sux3R5pAVzg/F1h+TVsDSUCt2d+mM7DJ3R9Z8sIRKGSvcRtB8evlwUgNMZubn3GW4jn5lvmC/DPdjFXcCSzpoOx9AAE7HuDXYDt0yG2nX/VojqJwdxsdQeap7i+z3nmxoUYe87mpoKxbWeMJXBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Sep 2023 18:03:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v9 12/16] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <ZQxpODSDlTfksrnU@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-13-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-13-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 8961155b-02b3-49b9-e9b2-08dbbabc40e8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Eiq+B9E/eHVghl13nZZLt7HiM/lkk3plFJLfxIM00lLxNs1OmMeFa9V0d2wIcDNd+6Cp9ZMxdq3paZx8WnTB078ffmvvSto7S3nRYSdaU2uOUdjbeK7Ny+MfT3eMqwp+fapZUNG35LjCUSX/QQRvO/XjjwvFE47fg0DvcLlHrLUlAClPp2bMvGnfUvBf8VEQD75H3yY9sRQp9PQXtUadVmNXYXpfRVdJ70MAoQQms37Mm778uftMh1ycnT7HV4RIDBoJ4rYKYEgWe9hqVrzYqknbgfN2hQm0nGxFQXeTB2SU8KZPWAa1t1zPcKsqU+ly82utup48IZgulUtbmlVDC+ggpgqsHO7fUUaHLzK/84aofHviuzjRocJ61u3I6Vkul5t16/jbQj/KPBsUeLAjwAj4i2iKuw99myj40S9xPV5gnRUZT4PBxnddJ2voTDYCwhCPysnMjDMW/9YR3+tHM7yDmbbmlLSLsusatitiWNEIpQpX/UlnmNVES3mqgP/3MP5d4tL3lWsrxRitSABPxCvqKNI/WmcTRvCSNtRi0LYZzMmar9JZ8IXEDkVu38Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199024)(1800799009)(186009)(2906002)(5660300002)(26005)(41300700001)(7416002)(66476007)(6916009)(316002)(66556008)(54906003)(66946007)(8676002)(4326008)(8936002)(478600001)(6506007)(6486002)(6512007)(9686003)(85182001)(6666004)(83380400001)(38100700002)(33716001)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1BZSXdsaFBZSmlmR2M4Um1uRC9TeVlJNnpHT0ZCcVUzRlVTMWhFekhZTTU1?=
 =?utf-8?B?aHpMOG9ocWRGT3A0WHpaVjUzZUNzU0dsU3c4ekJ4N3FCaTdSbVlrMURvekpU?=
 =?utf-8?B?WlNyS1AxcGhJaHpNZkpPMFFIcXRRNTVKWHNONXlRUjF0MnQrUHhmQ3ZhTkl4?=
 =?utf-8?B?eUVHSU5kK1hmQ0JEdGQzaHg3aWtjZ0FZSjY3STZ1Q1JoK003bGVOVHFyY3RM?=
 =?utf-8?B?dDdNaUY5MzlvK1JqbVl6TTBWS0ZCOGdNTFpuVHk2OGZhZXNiS2RIc1VQU0Jp?=
 =?utf-8?B?V2xob3M4dExmcFpSbGJQUEhXSWY3RlRYZit0UWhRYnJtVG1qMStnUmFJc1dT?=
 =?utf-8?B?dExpMGNiS2c0TE5lVXVBT0JaRGNyRlFwZXVSSXNrSlo2ZWRkWjR3N2FnOFo5?=
 =?utf-8?B?VzEyN3ZoaXhPTDQrakpHdkYrU2xldEY3M1Z3ZTJOM1ZYRk1YVzduT3R1Vmxi?=
 =?utf-8?B?NWhmUHhOZVF2L2k3eVpkZmJCRHJnZENVZnlIMFgvcDVacGl0Z2ozTmxJcjBu?=
 =?utf-8?B?dUxLcVczOXFnRjFSazA4MVgyUTNsRFNxODJjMFRqSEdxTXlEMEhPSmI2SUtr?=
 =?utf-8?B?K0lDQVhMZEM0RVpxcHNXQ0dkUmsrZ1FacXpaYTRYUTB2Tm9sdDYraGc0clU3?=
 =?utf-8?B?dldlYit4d1JHQmNBNFFkcXNzRnNueDZaZE9mdWJET1lJMEthOW5Od2V5bUQr?=
 =?utf-8?B?UW04U2psSjZuSnhNNW1wTUR6cnJHR2s2WWxoMHQrbG5MTm9wV054aXFicnNj?=
 =?utf-8?B?Q3dCajRkeUxnWFZ5clFOejl6OTJWS3ZSMmlBUEkwVUNQWlRxM0JNaWUrUXds?=
 =?utf-8?B?aG9Pc21Banh1OUlhTGQ0SkQ0R2Q5cXRKWmlMVVh1cUpwTmIvQmZMWHEwK1Ar?=
 =?utf-8?B?dVNyUDJ6VjVGcHFoRzhlTlBFRU1qa3E2cXM5enlJVVErRDkzNHNvbmFHZEFS?=
 =?utf-8?B?TUNVSXVlT25YQXpxL2ZnTVRDMnFhbWJucjY1bEZTa0ZRbHpEaGFoUklqeGJt?=
 =?utf-8?B?ZGd6UFBuQ0ZMSlF5MFF0amIwMUZUNm9iSmxqa3YxejdrdFRiVTZsRTJOczRK?=
 =?utf-8?B?LzFtS2RVcUVFNFlCdTh3QkRVUXdldDA1V1RpVWIzbjFtSGI2aFFSVkEyUGdU?=
 =?utf-8?B?M3MrVng3TWdNcU9xU0FvZ2tEa1g3ZE5QdzNYZGJMa1hFdkFNRU9EUDQySDFP?=
 =?utf-8?B?bktsYU9LMzJMQWZQdnRFWktBR0JRMVB6UmNoMlRxdmI2ZFBNbEJBVDVOcFY1?=
 =?utf-8?B?OVh2SzR2VGlRNnpUaUt0M0NZUTFYRldzQnk4WU5FaWJGQUhjbUZVcUFOR3dV?=
 =?utf-8?B?RGJGb3kyc3V1dG12OHNQVVRvN3d6M1Z0VlJLL1JNUWVQNkViWURraFdvM1c3?=
 =?utf-8?B?Y2FLQm1QeVlSUkhyL3NtbDRqU3NmcGxHdm16dkRhd05WUGVBN1pLUUVkdnJJ?=
 =?utf-8?B?QlFCUFhmNjNsckV2U09HRWx2VDVTQ0RxODVUcUNocjU5TW9UK1RhbDVFRWgz?=
 =?utf-8?B?WEtLUGtKSE1TUFdqYllYN1RwMjNyTGNLdXkxaW1EMURpUG0yWVlvY3FBY1p4?=
 =?utf-8?B?UFdRUnhLSnRwNDhuRmFCcmozdFhIT1VXdjh3endVbTF4Z2Z3T2pPZzhaMkll?=
 =?utf-8?B?QlV6amUzQ2NORDZRY0QvQlU5cU01c1dDTkt2R3BTZTY5bXZVaVF5bkUrSU1l?=
 =?utf-8?B?S3dJWGlvNUg3R3Q4OEd6cVFLUTEwK21OR2ZEaGlzM1NkN2lRSUsweWg0QnRM?=
 =?utf-8?B?TXM2M3d2anUvajZTU3p0UTcydWRyQk1GUTUxZlZRcjRFa1NiZEFzWE5mQlpR?=
 =?utf-8?B?RGhKQU9GUTk1SnVWdkppQUV4K0k0ZHZlaHdkMTRYYkZ6bU5LNUkzdHpmMnRq?=
 =?utf-8?B?TUtoazVnNG94dXZIbndqRUtzb1hJRjFtUFJGd3N6Mm1maGQ3TmlNd205TzhV?=
 =?utf-8?B?UkRibng2cXFqb2ExZGFHSGFNeEtKMytTOXg4MG4rNDZQbXhTb2ZWWjhoNUYx?=
 =?utf-8?B?VVhSWU1uN28xaHZldVNPblBPVE9xVTIwazZyWlNlcnVERGtZY1pPbUlKSzgw?=
 =?utf-8?B?TXJ4ZWFsTE9RUXB5bkJmblIwVm93RDZhS0pyZlowNjdoZ29PY2FvQzFwNXU2?=
 =?utf-8?Q?fjU7Lmj7Fb0kdUyq4+DGvCaCF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b89cbYC9LhsAd5HhBCOnHyAqdAGHjSk+JlzOu/rVo5+E2SU8uqo6WLYmvlx1YAH767YVzjYfY6MAPrgMwAfqxJuJ3pcbgwdqoU4CWSsNTzi8xSOnQWb1WoLWwcKno342i8C7gCOrLjc1WjCrkM/W4oayPXbozJiDIFfSXPfi9dl49meiYTiZwTjpgEV8nxykE3+xlOZRKAq5UUHaUJA1oUQbaSVnfSaF3jnvfeuf4DeU1o8aNkVaS4ebojzguTdDC0UdbC50igmjxD3uEQ/ME6EfJbig77NmKnQlI/zIaNUBnklhnzZnDTMRD4dMhsFdOMqz5i8i8g3m/1kgrRdQ8M0AfnbgaKq94RS+vwn1xFn9Ui3jesbSeWuwaph1I4vJ5EveN5+EL5yGd+51w/QKPMMjXUE/JJ129k0/MvFzBp2mpqI0rLk6XA2slW/Rm3a+BRGW23BJaA8VELCwQlquA9kmEa7vVvqMTGQgniXmSTjJPJ+SlNjC/Qj3X9QWsfTCm9S0kzrPuAf5pxnmua4Lk8CTj8HM+0U/Krt3p1b0gBS9HUD1Ltri4XKHZsGrN1Z4V3PBln6a9XmLzVQiVXbA9kwzLHek9LYF41da5mRWkXEySBG/PivWp/W05G2nyjODgIsZKwdfNjVpuczCKRJW945YyqbQNg7qZOfJNe80PtJeAxWq3tOXHj0LP++vkQvu/Pb15oFNBjti6E52fJ0VItVqJWYfAJtItAz+sp4LnEAkmsl3upMrN8v8JPRbMMusXdxu/0LJwg85q0rh8DEMJLwLxQ2/VtKphVLao3Z99wXrW9XFOgwZG1vzz9NoiLmLzm7XHyTthhw8IHT2ThRhBcunIGk10hF8vafEjr/izm8AwLsebBmadbad915BiYj8+6rCRbPQ5IG2NqjkRPgsiA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8961155b-02b3-49b9-e9b2-08dbbabc40e8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 16:03:11.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpAmqMijXAzkypOSQxYRe0CmttL3pS9A66Clcs3HZEdpaH4KI76FAQ98n9r8L+G4Ab+V7paxtGw3yMDrnkz6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5901

On Tue, Aug 29, 2023 at 11:19:46PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v9:
> - Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)
> Since v8:
> - Added write lock in add_virtual_device
> Since v6:
> - re-work wrt new locking scheme
> - OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
> Since v5:
> - s/vpci_add_virtual_device/add_virtual_device and make it static
> - call add_virtual_device from vpci_assign_device and do not use
>   REGISTER_VPCI_INIT machinery
> - add pcidevs_locked ASSERT
> - use DECLARE_BITMAP for vpci_dev_assigned_map
> Since v4:
> - moved and re-worked guest sbdf initializers
> - s/set_bit/__set_bit
> - s/clear_bit/__clear_bit
> - minor comment fix s/Virtual/Guest/
> - added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
>   later for counting the number of MMIO handlers required for a guest
>   (Julien)
> Since v3:
>  - make use of VPCI_INIT
>  - moved all new code to vpci.c which belongs to it
>  - changed open-coded 31 to PCI_SLOT(~0)
>  - added comments and code to reject multifunction devices with
>    functions other than 0
>  - updated comment about vpci_dev_next and made it unsigned int
>  - implement roll back in case of error while assigning/deassigning devices
>  - s/dom%pd/%pd
> Since v2:
>  - remove casts that are (a) malformed and (b) unnecessary
>  - add new line for better readability
>  - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
>     functions are now completely gated with this config
>  - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/drivers/vpci/vpci.c | 69 +++++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/sched.h |  8 +++++
>  xen/include/xen/vpci.h  | 11 +++++++
>  3 files changed, 88 insertions(+)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 412685f41d..b284f95e05 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -36,6 +36,54 @@ extern vpci_register_init_t *const __start_vpci_array[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf = { 0 };
> +    unsigned long new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(pcidevs_locked() && rw_is_write_locked(&pdev->domain->pci_lock));


Do you need to check for pcidevs here?  I would think d->pci_lock
would be enough to protect the virtual allocation device bitmap.

> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn )

I think you are missing a !pdev->info.is_virtfn, as is_extfn &&
is_virtfn mean the PF it's an extended function, but not the VF we are
trying to passthrough.

> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )

The > is not required, as find_first_zero_bit() will return
VPCI_MAX_VIRT_DEV if the bitmap is all set.

> +    {
> +        write_unlock(&pdev->domain->pci_lock);
> +        return -ENOSPC;
> +    }
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
> +
> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
> +    pdev->vpci->guest_sbdf = sbdf;

You could avoid the local sbdf variable and just use PCI_SBDF(0, 0,
new_dev_number, 0);

> +
> +    return 0;
> +}
> +
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> +
>  void vpci_deassign_device(struct pci_dev *pdev)
>  {
>      unsigned int i;
> @@ -46,6 +94,16 @@ void vpci_deassign_device(struct pci_dev *pdev)
>          return;
>  
>      spin_lock(&pdev->vpci->lock);
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    if ( pdev->vpci->guest_sbdf.sbdf != ~0 )
> +    {
> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
> +                    &pdev->domain->vpci_dev_assigned_map);
> +        pdev->vpci->guest_sbdf.sbdf = ~0;
> +    }
> +#endif

There's no need to set sbdf = ~0 as vpci is just about to be freed.

> +
>      while ( !list_empty(&pdev->vpci->handlers) )
>      {
>          struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
> @@ -101,6 +159,13 @@ int vpci_assign_device(struct pci_dev *pdev)
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
>      spin_lock_init(&pdev->vpci->lock);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    pdev->vpci->guest_sbdf.sbdf = ~0;
> +    rc = add_virtual_device(pdev);
> +    if ( rc )
> +        goto out;
> +#endif
> +
>      for ( i = 0; i < NUM_VPCI_INIT; i++ )
>      {
>          rc = __start_vpci_array[i](pdev);
> @@ -108,11 +173,15 @@ int vpci_assign_device(struct pci_dev *pdev)
>              break;
>      }
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> + out:
> +#endif

That's ugly, can you use the __maybe_unused attribute with a label?

>      if ( rc )
>          vpci_deassign_device(pdev);
>  
>      return rc;
>  }
> +

Spurious change.

Thanks, Roger.

