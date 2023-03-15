Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CB56BBA64
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 18:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510145.787332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUVy-0001Sq-QU; Wed, 15 Mar 2023 17:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510145.787332; Wed, 15 Mar 2023 17:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUVy-0001Pr-Mv; Wed, 15 Mar 2023 17:02:14 +0000
Received: by outflank-mailman (input) for mailman id 510145;
 Wed, 15 Mar 2023 17:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcUVx-0001Pl-MO
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 17:02:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e6a2c8f-c353-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 18:02:11 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 13:02:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5894.namprd03.prod.outlook.com (2603:10b6:510:31::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Wed, 15 Mar
 2023 17:02:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 17:01:59 +0000
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
X-Inumbo-ID: 1e6a2c8f-c353-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678899731;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bRStwQmr7cCA8/bDDT6jRWnhNxuopOkWIaWXEhSIIMc=;
  b=gJVi6Zbh57V2VmrFxC3VV2D4re5s2qE80Y+YRjgqn5ZQGF031NeK4opb
   q0ScR5D3SIpCYclN7W1xJ36BdyyOdLYyV1kzfVopllwWDiHWvIyElC2wM
   SHKGs56EW3MUpC2wrLcHY62Eh3/NnGund55P3Mns2grwFnhCk+XyAcL1m
   o=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 100900369
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jbHATKodq85z/uYn2Bnw5NzkVKBeBmJsZRIvgKrLsJaIsI4StFCzt
 garIBmGPvjYamr2ed8gaI2zoEsDv5/dyYBhHQBtqy42Fy4V8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFziRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABEuZBvape3t+4KcQc08hcAZNOXRNpxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqY72AXImD175Bs+CBibnsGjjwmHQMNhA
 WsfuSA0s4JvzRn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsVDdQLtw7vck5bTUv2
 hmCmNaBLTVrva2cT36Q7PGYoC65OSUPBWYHaWkPSg5ty9LjuoAokhPGSJBgF6Ozj9LdEDT8h
 TuNqUAWvKkekscRy+Ob/FTLjji2r57FZgcw6kPcWWfNxglkfpysY4uk7kfSxflFJYedCFKGu
 RAsm8+Y4+QDDMjLlDGERuolFbSlof2CNVX0g0NrHpBn5TSk/XGLdIVcpjp5IS9BEMcdeDbvJ
 mTTtAV57ZpfenCtaMdfeJmtAs4nyazhE9XNVf3OaNdKJJ9re2ev7CxoIEKdwW3puEwtir0kf
 4eWd962CnQXArghyyC5L9rxypcuzyE6gGbMH5byyk3/1aLEPSbJD7AYLFGJc+Y1qruepxnY+
 MpeMM3MzAhDVOr5YW/c9ot7wU02EEXXzKve86R/HtNv6CI7cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:w4LBgaCT6BRZsUDlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100900369"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpwLGJ4z4t/P8M/Ju3sx7nat3+fHei7oFNrCaXxvJQhpPupI/s2JIzni9B40qUrx6MK/vZI7t6FFCLpe8+A6UAkcLytcf8FoExWKLbPYNBgpXcL8rBbqP+s4LtVCUC7gKVibIBir6DhoCZB66knCwZ1OX2woxzwJwLfrxKQqYjx/STOu+F5/XxBtq1ydVbwD9UnY4YdoZmUKjrPnZbZKrsBm53D16jdoFqR92ey87RZNDk3HL4gZOiD4xXjTjKe9J6EhjTt2LRWfznsSUfPmYITvj5ig8hrvsuAhD0GyysqhDZW3hwDvtKTeRoTkSlUasY3I0RQqaEfGMEuMmF5HjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRStwQmr7cCA8/bDDT6jRWnhNxuopOkWIaWXEhSIIMc=;
 b=LRdIM9+it3p8IGKjuT1T/RWL1bpBS12t3XUxh7eh/JIvhX0l9IO2b8L0jdci+EkpFyk6e45SJoHkrySMzQEwo7xHRGQu5/vo2XP3zEgpNdrA8Dq7gaoJ6V+ltnCBSaJ91kCPk5jh4NOLCo5m+yLGQSrAbrztLa4DYbKo3p/RtNI5qjnpDY6CL1WyI6EB+n7noftJtZ/1OwC3CAS/ULJMErFFvTTTVLw0LsnuN2S5ljfswpUbWDIsZgWQ/nHQu/DGiZo3UMU4SneCgAyAOHqf59U9TBaVxhpMhpQ5TLtT5ek66RV/p8dwHJ95lKxJmAc07SYfC2NAC0uLNRuzIpx35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRStwQmr7cCA8/bDDT6jRWnhNxuopOkWIaWXEhSIIMc=;
 b=qJ5EuGCNU28dNt5WtPcbSg5PYu/sJvWdRW88Dn4sZZt3LXdGAmR7I+QPDpxd8m2Iy1cjvDHLM8zdBvxla9VUjVb7HViPM722uxp3JKhJcTFj3qHQRgfjnTeSeWeCIRAgNH/8ZFIq7f4HvkBz9tizYF6HrLUVaiwnLGLvGfLxGGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
Date: Wed, 15 Mar 2023 17:01:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need
 PHYSDEVOP_setup_gsi call
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-5-ray.huang@amd.com>
 <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6c4c3e-6676-4d69-5002-08db2576fd72
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ITs/iIs5xNQN56938Dj9AONzpXrILHeXZGhIyecWifLVz457r4RKgQZZo/6qGQlucsIpQVuZbTt/Uds2mRwOk02ji51cdTKpxSRShnA4PX9pVmzjaZuPQ8gnb5suGlJ74O3nvgRKzCcldM/WWid9bwLxM6s03faqK5/oJ7viD2juOZsFj2kC+6yo/ekOrE1NYDSvCmeCpI93N2vGVOLXOV5WvdboNwtVGQ7i3kjYdrJ8lTYOYuMjTN1OfCIGNrNiZigvOtJnIznSBELl5m7lpiJR+wTq8T4D+rXw/1PJnRfHkk8mvErpkgRSE/IcRzRSDvs44rzyq8K/cackTsxxjpCqLDTmZ5g+NrDuVWiv/uvJmjN2ul1w6xwz0M37DIHIfhENyZyftSwnPXhaZyCCDm66qfjDNZI+nD6aKd0Zvl2o22ha1fZhtROGLYLow1eFxQZ35JKRp/dz4jrW4rW/jae5vhX9a1qtHPBEvE4laxYLwhUcy6ouqS3dOLOaGzEpxnY80A9dLRSc/sYZwtufA3V1HWDBfcy5I9eGq0TQQyZYXfTxOBxLRv5Vk5fraM8qiQhAjQfc/9O224E7RlQIGjR6CqIk4HjCQ4eoGBuTlYU3u7JTaJDsZb8DNiTdYI2xKicVHMFeY1iuUVSeaAksbWA5KJgWLRXH1vFqUuvBN9QPmRgjO45PTEF7up8ZKJnIRbRkcNoi6mH89sg6PpUM83kVqfDelM3zD8Um6dYNx3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199018)(4744005)(7416002)(5660300002)(4326008)(41300700001)(8936002)(2906002)(36756003)(86362001)(31696002)(82960400001)(6486002)(38100700002)(6666004)(478600001)(186003)(2616005)(26005)(53546011)(6512007)(54906003)(6506007)(31686004)(66476007)(8676002)(316002)(66946007)(66556008)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekxmOXR3QlpGNHRHMERiRThaTFJOQ3JPSm83OXZWSmhiM2NGNjlQUnlBbHVE?=
 =?utf-8?B?VHkzMEZqME94UHlVNFZINXEwWENjZEFESDVMNWdMdGVFVktZL0hHd3J4YmFz?=
 =?utf-8?B?QTAybHpFb2gzWFdyRlJXaURCWkdhdDFlcnd5WDdsZHlwSHY0SXVRalJKRHdI?=
 =?utf-8?B?RVR6bVY5bXJXa3FpYW40d3gvdnpyRkFQMGt5ZCtSOTBiV2RHR0pZc2x3dDZH?=
 =?utf-8?B?SDRqcW03REVBVHlYSWN3M0NPaThKTUtIMk0vVkFkSmpOL201L25EMXdrc1hu?=
 =?utf-8?B?ckhUN05Ibm5vaGZTTm0vbUpwM0I1eWFSWS81WE5JcFcxU0xQc3hOVE1kTENZ?=
 =?utf-8?B?VGxOTTdLTjdVc3dEcklZd3lZZ3RmY2pKR1FvclBTcys5MUttaXlrckZocjIz?=
 =?utf-8?B?M2tRMk1XUGo1bk1nSzVnaEp6cHRSc25OSzZTNEFmRXB4OU1jNlpLUHlzR1Y0?=
 =?utf-8?B?Q0xyVkJORUplejl0cmFUVTBlT3lUQVVaSUlrZXFMSUNnN2poUTBjR1p6NHJl?=
 =?utf-8?B?V0doNlI0eElITUEyTUpzMVN0ZzBNSlFRUGJpSTB5RWd0bGxHeVlpbklRUXlB?=
 =?utf-8?B?cjE4Ny81dS9maldDTlpLbWFqYW5xdzlseENrOUIxVFF0Q2JBRGZ3c3d2azI4?=
 =?utf-8?B?bStkN1hITG4vT2tiM3ZweFJRSm5ibmRBOG1wc0pvaXZKeGZoY0U4b0tJbTdy?=
 =?utf-8?B?NU9yVTNaeXQzbGpqZk1yUW5pZkkzMWFnQ3BCa3NzUWIxN24zZm9uRXpmcW9X?=
 =?utf-8?B?OGcvVDNxaUExakxPUkZ2bnpkWVdKdjJJOXlNWUpNWDM4a2JwT1M5YWVkblRC?=
 =?utf-8?B?VFJVL3JNeFJPNFlOVUlIbHJUa0ZyQmRXNnJEQnRKR3ZETXEwOVZQTzhTWk5i?=
 =?utf-8?B?aUVyb3lhSXAzN0MxWEJTU3l3SE1rZjVYb1lpL3V6aWdES3dZbE1oc1cvLy9j?=
 =?utf-8?B?WWFLWUxxOEZFR2R2YjJ5ZzZhbnE3OE1qY1JuK0dPTzc0YzR5MEJNVTB2UUlU?=
 =?utf-8?B?cnA1YWlXaTRHWHQwaGE1ckJoOEJkSXVDUzlLOHRHK0dWM3d3LzlQQnRaTmZO?=
 =?utf-8?B?Nlhqdkg0TENEcmdOS1lwWEY4LzczWURSMmxMZHhoVjh3empKS01ySmQ5TzFK?=
 =?utf-8?B?WnE1MHhCWXhia0RlTEV0Z0lhR0hYNkQ1UlJEbFFZS0tlYnIwUGkzRHJaVnEr?=
 =?utf-8?B?WWF3VEQ3RS9xNmpwYmdRN21GUmFTTDFWcXdjMDBSam5EdHJaZXh5ZHNmVzdz?=
 =?utf-8?B?b3hJaEZ1VHQzMzFGVklSZkNvUXU3ckpiMEc5NVBaSXhtcGJGNDNSTUNmSHY0?=
 =?utf-8?B?M3VrVE1sTS9SeGw0MlJBM2tidUpRVjR4dWRJVS9UdzBTUytNbjU2VldUcDhu?=
 =?utf-8?B?UVBRTE5FYTVpT0xUc25LcWZjTFZuYjhBbExuMFhaYjB5KzdPRVhyc1FKQkNm?=
 =?utf-8?B?TEZ5akRXZXZsenNwd01QdkZQcmVUeDFIeWIrMUNDTWFaMGNlV2ZHWDdCeG9u?=
 =?utf-8?B?dldBWEFUUVRBK3I3MkNTTnREVFRqa21zMDRFdUs3Ymw3Zi9QZWlpbkNiV0c0?=
 =?utf-8?B?UlJoTkxIaXljdUlIN2lpdUxiem0vR3dpV3Z2U2d4UHY3QjZZVWxKSmxPOHJl?=
 =?utf-8?B?UHZCT1ErOTR3ck9CcEtIdkRTTnhBcFBLK1hITlBFdS9wcDl0NkVVYnVvNGpq?=
 =?utf-8?B?R3AvR2NNRnMzejg5RHg0K3lJd3pMdThZTFBMMGlESWZZbHZZUnFMOS8rdkgv?=
 =?utf-8?B?UGhkdFc3YVBMTU5xMDh5Q1hNNU1Pd3BzTmNsN1JkLzc2bkFSZnRZbVlmL0Js?=
 =?utf-8?B?V2tpZWpnMmdGczllczNEaXZGTmNycjkvN2tBZzlYRjAyM2ZtYlpjMzB1aWow?=
 =?utf-8?B?YTBjQnZja2V1UCtqd2RoblNzNmhhUGFDd25YWnltZGRFZUpwRk5kaGFtc05F?=
 =?utf-8?B?endVZ3hUM2tVd2lkSXRhY2xWWEVWUEdCUkRXeWZNaFBtaFhEdEJFbkFEWnY2?=
 =?utf-8?B?aTIrVzRLb3ZXYytOekd3TVd1YTJCTWVzZUxwdEI2b3QrVUcwYlUwa204eEh5?=
 =?utf-8?B?azFDRkdtMlF4Q3hGa01rcTB3UDNCSUtHUWdzdU5vTTVSa2VScEJnb1FwNnBl?=
 =?utf-8?B?aUxqUmlPaDV0VGU3SDlvU1pBQlFaSjRDRzhLbEVDZjhuSTdRcmt1Tkg0VjZZ?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bHWVGo5kDjopBxt+29zTdAp51FAZVa0h68GZNSnO0r9GPk7I8SEcN54p9bK9uT8TzLdytZDtETRsdklmG8zaG8gF89/MleKD8H0FmSjPX+Kr8PAr1rR8nUorRR9W/z3Yxph3+7KTT9GE63847mCPfnbXAJIdrPjA+coFLsVK/QxEYiqEllH39ObcVFv0ZAFDNx4ttIH/0MSbXcgdY5uRdA2QDVLnnIbnvK0Cb69BsGtTn6IUm4GZCQfuOeLA4+u0Emvkr2IcxQ+QnZcvaJs/NFx/+Sk+XyfEzkQYOWqpJOamWT1W392FRhIarg8iGgfQUZMYlY8+4rQBc+fNkR0AndaJX2lu8SSHdqpTN8Yrxu3t4oWwrTx0KFSHwia0ayYAzTc2/DwT5SGnTZ6Okwz850xlTcMyiMiLOwf6b2KxI9a4dlBQ9Ui31qvrNBZ4UgOrxPGi/ojh2XnFd7nluHGwemwvrNx1zzdrbRTwZSRocUzbm7UIvbKDXb+4a1rnsoy3o8dxNoI71l1Yo4VGMP7BiEzU5quiy3cO12gIYeqUVdVLoVasNc9jGA5SpxgtCmH5BG8Av96qdnRoxMzoYRFBQPgIuVtjqHNr2vqg3en7EyMS49QjWWkaoIqwI86wpQe3nLHWv25Tk+8Y0EpHhHsH0jHWAca9eW6Pe5PdudyYnc/CtdR5OVAAVqI42PeyCDbvShon9LAC7xz65mNTV9fddsuzlLq5rI/7372dvOMtLATf0maumbCu5Yvc2KMONpSsnXWwf3rIvmnBWLipLKYr+N1GXe9aglrZXgQtfFRv3wdGf8qKmlC80hLRN5wRx4VLyW/UYZxhZzgpm33SDPZqsXa5SzWidt4GNY5/YJfWoBG/WvNqL7MuSTWSoMqj5Jdj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6c4c3e-6676-4d69-5002-08db2576fd72
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 17:01:59.4834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPIEbgIFBC3CJyob0u85RPHJtHUGPTm3vEFAvojqlS1AzdIft67w7nzv1SmmqUGQjLYNDa+XhkAFqVNKX0wNb6u6a762rZWB/VIpx0KdYXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5894

On 14/03/2023 4:30 pm, Jan Beulich wrote:
> On 12.03.2023 08:54, Huang Rui wrote:
>> From: Chen Jiqian <Jiqian.Chen@amd.com>
> An empty description won't do here. First of all you need to address the Why?
> As already hinted at in the reply to the earlier patch, it looks like you're
> breaking the intended IRQ model for PVH.

I think this is rather unfair.

Until you can point to the document which describes how IRQs are
intended to work in PVH, I'd say this series is pretty damn good attempt
to make something that functions, in the absence of any guidance.

~Andrew

P.S. If it isn't obvious, this is a giant hint that something should be
written down...

