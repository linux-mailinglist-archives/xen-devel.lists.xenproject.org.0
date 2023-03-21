Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E56C36B4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:15:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512839.793130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peedi-0008Fk-B9; Tue, 21 Mar 2023 16:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512839.793130; Tue, 21 Mar 2023 16:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peedi-0008E3-89; Tue, 21 Mar 2023 16:15:10 +0000
Received: by outflank-mailman (input) for mailman id 512839;
 Tue, 21 Mar 2023 16:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peedg-0008Dx-Rk
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:15:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c76cd7-c803-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 17:15:03 +0100 (CET)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 12:14:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5474.namprd03.prod.outlook.com (2603:10b6:208:285::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:14:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:14:54 +0000
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
X-Inumbo-ID: 87c76cd7-c803-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679415303;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p3FiB33m67FA/cjm3th09kkNtNm/lCOAXoE8z32dsQc=;
  b=IIzz40WrdGUfRu039NezBgFhz70S4AvcrrpL9E47Kmekb4oSPjNFrWzv
   /fEL2kGmKbTKn2jZht3Bjcxz5YY2AqZIRiPWdL4LuB2T+jGqRxRC3IrWA
   PfIv/EQj4h26ViwtbxiaexhC0kBgOhgEXQxFXcgiStJF8kNne9oSR/e1a
   I=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 100538098
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:POPLa6uwr/stO92a/tgGNS4bKOfnVHtfMUV32f8akzHdYApBsoF/q
 tZmKW2GPvmIazOhethzb4iy8EoP6JLWzNU3TgA/qSAzRiJE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdBswfyqji+KM3JWkb8ZppM57KZDKM9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgrqMx0AXClgT/DjUYSlmHjOvhuHeaUv52d
 UlM6zg/8vQLoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBscOcey9zqoYV2hBSfSN9mSfSxloesR2C2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:khSp0q3OD89yqwJNnCZ5OgqjBLUkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWbtN98YgBDpTn/AtjnfZqsz/9ICOAqVN/PYODIggSVxepZnOjfKlPbakjDHqY078
 1dm+IXMrDN5RYQt7ef3OFZe+xQp+W6zA==
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="100538098"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkxbT3EuhOoNFKcPDrKAZtKT6hFDkS/PFSN0akvZJhOLpWUDxd6/vAzgj9fSF5tahcCfSUczNxnYR8T2DGQoCM4cEQ+mmrTrLtB8PT3IlKIgSMo8kSzIhiu45GIexH87rAELBj/RnNs+Y9fepYx5YZxTP+69THpKUkMTujRDkyQZltO4Cv3kjjIIbioalZGG02dwqQKexEg/i7DVRw361q/CNoX1xPM5R4VR/s10z3I+yAdQmhl4PAhMGWRR4cMRUb1k+64H6RGxNneB+JyZhV4a2kdO9N9xAyoV1y3OycUBTatX5MMeV2QAWkz1Boo8EQr1UDc0CKDkAYIvRqexow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qgl1SNCikB0E3GRs8+5G0W5EN0ZRe6MsxwBXFxE8y4I=;
 b=Rg2Ta6OT9sN6zfS3ICCI7BznZZg1i+Vm3c+DLVy9hTZajjGOEmLrqSdqFhoQQAR3scl/UFnYdyiSqBaAUtBc12HmP3aNuXE/W6pyNqCIcE1Rq7SXQbj1ctDpdRdVO8nZAMGJJhgWuRWH9qfwPiz4t3gKgZh97HhrIouqM5S9Oe3jAUo2X5TkbU0xn9fCRusjnXVpO1n46UVAyBrPF03ynsLgjWMaf4/OhVlm4kIfr1mpg4I6X8Y5AFlCYJfRPlP6BfFr4iz/0V46eZGutKS7fq2w+s7mpVDEXJwtPrfFDi3R+helGbxTMxqotnEXWk6sKWIPeZI6SUkb6aVy3M+JFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgl1SNCikB0E3GRs8+5G0W5EN0ZRe6MsxwBXFxE8y4I=;
 b=uriCVSh5W6dckoBfAa32JguRglq3Is/uuOJrFj5g5L6XpFySzMVx+NLQcTsav1IDubuE9sBYEarS4BrPqYmSJ7itUP1kZvppcXbHyZ/qtjcgo2dskWBx+jx31HIhy2xJzOSQEx80vxUeyQvC4OlCbnHzo1OSY0hYdsJT9lo7hWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <87803c26-2f0f-8153-4678-273e320ab19f@citrix.com>
Date: Tue, 21 Mar 2023 16:14:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
 <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
 <2c0ff1f3-ee0c-6d14-a51c-d82b65338005@citrix.com>
 <0df22405-bda8-8f4d-63b4-e9c4d57843b1@suse.com>
 <ZBRRbnBjWHXAM1ug@Air-de-Roger>
 <02cc1db2-90e6-a60e-4922-d88b4ca98b45@suse.com>
 <70e49a82-f027-6315-e11d-b2e16bdfdcab@citrix.com>
 <ZBnUc5mBYg7QhSBn@Air-de-Roger>
In-Reply-To: <ZBnUc5mBYg7QhSBn@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0041.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5474:EE_
X-MS-Office365-Filtering-Correlation-Id: be6862c1-e7eb-4f25-8173-08db2a27682b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lof6zXNJS5gxSOHmv/YZRDrAwYV3thfS/JepHUTdXIj0acigj8Cmm/0j1pluMslav4m1ijqEKKGafUg3yrF7E1Ch8wXz/C1SVZcMOyF0040EpchaBggB9vmaX7DTPULmkfzNoyebyporsTsdjcWR9LdCYHd11GgQIouCpCNBvu3BCdXUgfGtgJ9N22iG75u2EVpO2yp6YQwxijr9C266XQD+lHuN9VJTuMnT6hUk8ERiOIXouYWIZiZyBkC9SQc0mfTvKWWP2q3h+8pbBEMm/81VjmmmETGtYq2zVe55nrCIPxLAyQwxJmfpPjhtM5n2Rg1y5uW9Pc3gK4mVErQV9oRkZ87Jl/L+55qRCB7a08H6TptbKmpLRFGSPlW4vuHLGWupA7PcReG1+vOaSn3PYlff6qQnC9dnI5sOGjK+OnmxtRyY7hJBumYdPljbL59xPNqH50RNut5XKHAQti94ezm3n2g3IllEDz0yt+Vliz5lyZw+SxKQekaxtn7gDSD7/rUs/EXK386BVJSkBE9qkkXrUcGu7Ia3MuvpckzZZwqJmgIJ9WdzDMKQXUftC1U9zBw3/Yu3P22h05ZKW2s6Wa6OcNFOeuIE45hwftrIhrl5kGkJh7v7+a99T07tGyg08k7UQN3FBI/SrPCF0oc6YUmUNFkJizIXdLiEAHsDHSL1BlA83lop3dBd/UBprd5pz0p6i/CUlK8BIzASMHpYuzItaO8XrNGD/ixlX3m7TvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(2616005)(6666004)(6506007)(186003)(966005)(6486002)(83380400001)(478600001)(316002)(6512007)(8676002)(66556008)(66946007)(66476007)(37006003)(31686004)(26005)(54906003)(66899018)(53546011)(6636002)(4326008)(8936002)(41300700001)(6862004)(5660300002)(82960400001)(38100700002)(2906002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEZ3REdiSjhPNGpmb0hqMktoU1dtNmhaTzNEK090d0xRai8yd1FGQ3dReXFx?=
 =?utf-8?B?WHZ2Zm4xd1g1K05teUU3RDhsK3ZnRkRrZDdIUUMwekd3RlE2Z2ZHTmJZK2pG?=
 =?utf-8?B?T0txNzZVNjdiV2luYml5WmkvNFQ3elBaSVY1dmNLUjNPM1daaWFkVEVncGVZ?=
 =?utf-8?B?RHZEZnJEOFAxZVJwOUExb2tPNFFCR2E0L0U2ZFM4d1hPRTlYdk1NM1RNK1VT?=
 =?utf-8?B?elNGcmdVWXZkeFo5UUdKVW5veGsvNjFSeGVVNGFCdlQ2K0s2bnZHcS84UTUy?=
 =?utf-8?B?UW9HNkgrS2xCdFQzMzVKWUpNWHF2Mmh0WVd0b05lTGtNYitHdlVGbStSYmJY?=
 =?utf-8?B?N0ovQk5lSHFuSERXTkprSXVGV0NuaFY1dUNieURuRzl3dDl2TTBiZ3kxWTho?=
 =?utf-8?B?MitWa3IxZnZ2MXpqVE0xczRpRC9PK1pHRnlnTS9TQldEcUxLOWR1MHJSb09l?=
 =?utf-8?B?b2xnZXdMeXlkTjVZYU56UktlSG5qZWQ2QXRrbzZZZy9MT2ErWXB6Z1YyMEtD?=
 =?utf-8?B?RUp2elp6Nk03SnpQWGNqaHlNSGRNR2wzakdOQkRBaUpodXdOWVRtaXJQekhp?=
 =?utf-8?B?SEN4bURFWEhvalZKejhnem1aQWZyeHdIUUI3MDdjVzNzYUpXNDJuREt3SHZK?=
 =?utf-8?B?TWVqT1dmY3RQREdUd0pzSlZBSzI0NjFBNTBWa0V1UnFZNFNkbCt4R1pOT2VP?=
 =?utf-8?B?NWJaTkg0VWtMOWdyazJ3WjdtZjR5RlBWRGFVejlyeklvaTgzRWx5Q0wwMkU4?=
 =?utf-8?B?ZnpHeE9MeG9LK1Vja1BZNHhJRm1TUlVBN3d2Q1dTaWc5OEhLb0tYYk1hUS9Q?=
 =?utf-8?B?WmhKRkxLQk55bkhyaUMzbWIzMU82eFZpdjVPWVNzSVBySVptaXdkMWdhci91?=
 =?utf-8?B?eDQvbHgzYWVIZ0pIY0d4UStoMkppTGlQcVAwR01zb2FhVU1KekpTYW9ZWlJm?=
 =?utf-8?B?Uk5wekFXVlpBNXBMclRzM2Q5b210WnV1aU5Dbjg0U3JxY2FKUTVtbDJjcVEz?=
 =?utf-8?B?S3BFUDBvQnZJRDh2STlBY3BvM0MzRkZzQmdaUlFwekdBUXlMc2U2cDI5ZWp3?=
 =?utf-8?B?cTkreFVFSmxwdDBRa3FSa2RPSU5pMjFveXNIWkRYZG9lZkhQTFVieGJmYW9T?=
 =?utf-8?B?RTc3dFdtdUFLMTFnWXhkUytOb3pKOXZ6LzBSQVNsU3lCaU00K3dYeG56QnNX?=
 =?utf-8?B?OUpDeTFwdWE3MnoycTFxSUovb2xBM0ltQjFGVzdiM2I4WU1qVUE2cjE2cjBH?=
 =?utf-8?B?b3FQOElYQ0VsQ0dkcGpqM0UvUXJSZkxDRG1TUGRrdU9aVmJBcExtZkVkMUwz?=
 =?utf-8?B?eHNDT0ttbW1sNXhlL2ozdWRJQlViUm9rcnV0NXdJcmozZVVzWmpKalF6elFF?=
 =?utf-8?B?bUt2MWlKQmcvZFhLSGlsajlvdWs4RlJjcGhNL0p2NUF2ZEJzbWxlRjROR3V5?=
 =?utf-8?B?VkdadVhDWkMrekc4eEZab2p6NU4xZU5CN0s0azNQOU9aUVpGVEZZckl1a0x0?=
 =?utf-8?B?MXFyTUM2VEFBNEZ3bUdyL2dJSGpVVURidU5weGJkQnB3WDNnUTloNHpENVpy?=
 =?utf-8?B?VlBzL0pBWGEzRXhTVUVReXNmc2dNaVNtc01MRTZIdGtOQ2dSbDFkdmREWVBS?=
 =?utf-8?B?NXk3N09YTkszRHNjUlFUK3Fxc0JXeVpIeXhzVjVncGVNbXQyZWlWQjNHZ1Z3?=
 =?utf-8?B?VnZkUmRKSDNZOTRES3pUcVdFSW1RdlJ4eXBGMWE2VlJFSWdydmpFV0lBTGxC?=
 =?utf-8?B?a2dSS0piYXBrUG1NZkxvQk5VSmdLdmhQUmRQdjFiUXFoSGQ4UGdVeXlpcUx3?=
 =?utf-8?B?SitocXhvY25FVDIxNzVFUkdHdEdQbHZWRGJ3WWhoNTY1YlRyTVR0UjI2VHdL?=
 =?utf-8?B?MXRSZTlDcld1MUltd1Q3ODVNdTlWbjlZRDRQZmxvdC9mWWIrNjNUOWZGUjdT?=
 =?utf-8?B?Y1NNVWhGK1N0UysrTnVjT1NzWGVmUkt3TU11MWxkMGN5RzRpeTVSdjdxZm85?=
 =?utf-8?B?aDFaK3JUUTVUeEFMcTFDYWlHSks5Y2E3WEVSdEFVanZZUkpqTVdkNi9hSjQy?=
 =?utf-8?B?ZmJ2YkpSSFROeG5UZFExcXhuNGVnTC9jSmFUVzJXS1lOWG9MMVNRYTRiZnJr?=
 =?utf-8?B?SCtDQkgwMHlqcXpDN09wSjhMTWJCVU5FQ1ptNzFBd0pGM2VhWlVZMkFCRGY4?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jp8YxxYIHG7cwN/8qu6M2qYwugJ/9xBuCyFI0sxxCxrwn1yPtQHMMeufcX2GToYXWxdv75t5sNhmRvbVxUelRHQxWZSSlH/IGolt62KCsUy5NFKEDq4dwrWXtQUbMw/6aw3Rp9cNrM5L9NjecGO7foEWLZVBL45gDwFLTwBFX2byvjmnd8cSgFmbKn6RXvRW93BvsYzALJXzkX0RptgxtNLr671htYtkgyP03JcfZFk4UpNb1300s1cFAoH92E0rDV9q5H4uhcHQCY1L2T5Yx6JpdqsGZM74Q+NpRbRJu9UI4KhruOthYciFOHjMNq3D9eHS5N+/byEGqovBWaZBhW9zl9a80lh8CVuHeqL5O6+jDmscI8pUbK8mXKNNwa9m5dquF+KwNQ3tWDiOC10esOzm+vH9oNgBqCM8znnnVk9uS0PDUktNZuTMEgNSLkWDIFcPd78+v9T+bdiknkGyxzVATrN1aXdvVKwgXk0x2ib9vte/taZJWMJmOv/F4ooAfn2mve0AEDxN3VFU3TbJCyqrCUYYPy7sa6IX5McYw2d/mFwY13c+dEJRQe2rQM9EGJgnqtK2CtmIikGoGJUlbOCVhdw6063cmWlHnlA5HVok0xL3AbsDmFtsARc+IQGBoFPXbu4LS81gH9imnIWgHM4xvnwc9irSNSY4LIKnhJ4s+SJvmhZxik7a9wFXXR/K0qL+SFafh5xd5STS8SgY0n2L901hMka9TyY4Pdy96DjUZvSxK8+YTFWvhiG/ngh2ZFCizr44HcTWDpEQYpjlBQbqkEvdUYgOfxh2ps4xZyoSnJ1mB7INwn/ysZraCpyR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6862c1-e7eb-4f25-8173-08db2a27682b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:14:54.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32hLMa2CR4quzDh5eCiUvsoWi6HarLK4TMUTbn3XBZyQKf/ERkv9JHH3GImahKwx9Zd+ZfyYgNMBCS3A+VNbgQaOCi4Ljeaw6bZY2Bl4eBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5474

On 21/03/2023 3:59 pm, Roger Pau Monné wrote:
> On Tue, Mar 21, 2023 at 02:51:30PM +0000, Andrew Cooper wrote:
>> On 20/03/2023 9:24 am, Jan Beulich wrote:
>>> On 17.03.2023 12:39, Roger Pau Monné wrote:
>>>> On Tue, May 26, 2020 at 06:40:16PM +0200, Jan Beulich wrote:
>>>>> On 26.05.2020 17:01, Andrew Cooper wrote:
>>>>>> On 26/05/2020 14:35, Jan Beulich wrote:
>>>>>>> On 26.05.2020 13:17, Andrew Cooper wrote:
>>>>>>>> On 26/05/2020 07:49, Jan Beulich wrote:
>>>>>>>>> Respective Core Gen10 processor lines are affected, too.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>
>>>>>>>>> --- a/xen/arch/x86/mm.c
>>>>>>>>> +++ b/xen/arch/x86/mm.c
>>>>>>>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>>>>>>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>>>>>>>>      case 0x000806e0: /* erratum KBL??? */
>>>>>>>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>>>>>>>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>>>>>>>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
>>>>>>>> This is marred in complexity.
>>>>>>>>
>>>>>>>> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
>>>>>>>> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
>>>>>>>> no longer exists/works.  This applies to IceLake systems, but possibly
>>>>>>>> not their initial release configuration (hence, via a later microcode
>>>>>>>> update).
>>>>>>>>
>>>>>>>> HLE is also disabled in microcode on all older parts for errata reasons,
>>>>>>>> so in practice it doesn't exist anywhere now.
>>>>>>>>
>>>>>>>> I think it is safe to drop this workaround, and this does seem a more
>>>>>>>> simple option than encoding which microcode turned HLE off (which sadly
>>>>>>>> isn't covered by the spec updates, as even when turned off, HLE is still
>>>>>>>> functioning according to its spec of "may speed things up, may do
>>>>>>>> nothing"), or the interactions with the CPUID hiding capabilities of
>>>>>>>> MSR_TSX_CTRL.
>>>>>>> I'm afraid I don't fully follow: For one, does what you say imply HLE is
>>>>>>> no longer enumerated in CPUID?
>>>>>> No - sadly not.  For reasons of "not repeating the Haswell/Broadwell
>>>>>> microcode fiasco", the HLE bit will continue to exist and be set. 
>>>>>> (Although on CascadeLake and later, you can turn it off with MSR_TSX_CTRL.)
>>>>>>
>>>>>> It was always a weird CPUID bit.  You were supposed to put
>>>>>> XACQUIRE/XRELEASE prefixes on your legacy locking, and it would be a nop
>>>>>> on old hardware and go faster on newer hardware.
>>>>>>
>>>>>> There is nothing runtime code needs to look at the HLE bit for, except
>>>>>> perhaps for UI reporting purposes.
>>>>> Do you know of some public Intel doc I could reference for all of this,
>>>>> which I would kind of need in the description of a patch ...
>>>>>
>>>>>>> But then this
>>>>>>> erratum does not have the usual text effectively meaning that an ucode
>>>>>>> update is or will be available to address the issue; instead it says
>>>>>>> that BIOS or VMM can reserve the respective address range.
>>>>>> This is not surprising at all.  Turning off HLE was an unrelated
>>>>>> activity, and I bet the link went unnoticed.
>>>>>>
>>>>>>> This - assuming the alternative you describe is indeed viable - then is surely
>>>>>>> a much more intrusive workaround than needed. Which I wouldn't assume
>>>>>>> they would suggest in such a case.
>>>>>> My suggestion was to drop the workaround, not to complicated it with a
>>>>>> microcode revision matrix.
>>>>> ... doing this? I don't think I've seen any of this in writing so far,
>>>>> except by you. (I don't understand how this reply of yours relates to
>>>>> what I was saying about the spec update. I understand what you are
>>>>> suggesting. I merely tried to express that I'd have expected Intel to
>>>>> point out the much easier workaround, rather than just a pretty involved
>>>>> one.) Otherwise, may I suggest you make such a patch, to make sure it
>>>>> has an adequate description?
>>>> Seeing as there seems to be some data missing to justify the commit -
>>>> was has Linux done with those erratas?
>>> While they deal with the SNB erratum in a similar way, I'm afraid I'm
>>> unaware of Linux having or having had a workaround for the errata here.
>>> Which, granted, is a little surprising when we did actually even issue
>>> an XSA for this.
>>>
>>> In fact I find Andrew's request even more surprising with that fact (us
>>> having issued XSA-282 for it) in mind, which originally I don't think I
>>> had paid attention to (nor recalled).
>> No - I'm aware of it.  It probably was the right move at the time.
>>
>> But, Intel have subsequently killed HLE in microcode updates update in
>> all CPUs it ever existed in (to fix a memory ordering erratum), and
>> removed it from the architecture moving forwards (the enumeration of
>> TSX_CTRL means HLE architecturally doesn't exist even if it is enumerated).
> Should we then check for TSX_CTRL in order to check whether to engage
> the workaround?

By the looks of the current model list, TSX_CTRL doesn't exist on any of
those CPUs.

https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#tsx

It was the March 2019 ucode which turned off HLE everywhere, which was
only shortly after we released XSA-282.

~Andrew

