Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38450A3E5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 17:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310308.527077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYcY-00073d-N8; Thu, 21 Apr 2022 15:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310308.527077; Thu, 21 Apr 2022 15:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYcY-00070s-It; Thu, 21 Apr 2022 15:21:26 +0000
Received: by outflank-mailman (input) for mailman id 310308;
 Thu, 21 Apr 2022 15:21:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhYcX-00070m-0j
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 15:21:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b20daeff-c186-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 17:21:22 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 11:21:18 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3619.namprd03.prod.outlook.com (2603:10b6:406:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 15:21:17 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 15:21:17 +0000
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
X-Inumbo-ID: b20daeff-c186-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650554482;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QZP8CMeFNR2okUu3n8U8k6wfrB/P6Lr1nHW2MRDT3pM=;
  b=VgQ7k2mMl4rkuoeKFlHttbDcdlB9WtcpQ+g4HLgTtJcXXigQsxqiXbsk
   sEc+Da2bBQcJNmyXveRKilp/ZbDhEawhl8HxULNrK7EfFXZ4VG9ZkiFVb
   Agn/E9CtO/ED2e80pPHURCO+2byWi+1fJAMA1EbJAuseLt0/0OFVULIks
   0=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 69500781
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wQG2DKxD2eFd46H+IrV6t+dDxyrEfRIJ4+MujC+fZmUNrF6WrkVTm
 GUYXW7XaPjfM2XyLtB3bY/j/RkA78eHnIUxTQU+/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024HhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsZCuYActD5f1mro0Th9dHSJFYZJo5+qSSZS/mZT7I0zuVVLJmq8rIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeEuOTuoAwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GhImAA8A3F/MLb5UDNlw1e876wN+bbWdehYO9+gRyJj
 WzJqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWMwkQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO+gz6QXIxq+K5Q+cXzIAVmQYN4Ngs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:pddejKxNorx11S2OH1l2KrPxsOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICOgqTM6ftWzd1FdAQ7sD0WKP+UyCJ8S6zJ8n6U
 4CSdkDNDSTNykcsS+S2mDRfbcdKZu8gcaVbI/lvgpQpGpRGsVdBmlCe2Sm+hocfng9OXN1Lu
 vr2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnR4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUpZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpQoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEK86JX/r1cop46zuNCd3B13Z
 W6Dk1WrsA+ciY3V9MIOA5Te7rBNoTyKSi8QF66EBDAKJwtHU7rhtre3IgVjdvaC6DgiqFC06
 j8bA==
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69500781"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLjJHgE1YuY6acaD8A96pn8xpjO5/jEBgENhIOYbwUC/7krVKTmANOF4OAj69YaZQBn1QYB7dUt0jql0fKsiBQTxRoyg24vegmnBYcROHxMLJxuWc5aQ51SfFqx3oVDSacVs8yOqMmkOu9wuUZcamofymuF1JZmcKOjCmQTtRL3iOPa4s/FSIEMB3QmA2yLs6DS23BylG+wIiVp3vSRXooC1Mu++cSAEi9+pTkYr7ygvkJTfmf7mgzbSUKo0N/T0fPrN09Xz2/zRKw+OsNAH1ck5+pJqsB/wnWfdYv26JstBPz8lYdBM1XWPhP6dQPn0GHnEaMxdJYWj5Ywfx956rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMb8Ui/b+yY6q4PujdGxSBB6QMxryIVTYwXsh5AqGAo=;
 b=LL15BJjH3oeKRTxrJPAD0Zlf8/KS0Vt4IdRmzuDtrXx958Dlrcjyt9Wjn+yRqzTbSD0OKwbBu8/P7ZKFMrfkwqfhOmuwSfu3jbZJEcKQcqALhf61xEli+TomBGr0YNyJmC3u8al1d3fzsYHx3DLguBvJTjX2PW1agoe+fi5JiG2ijtHpr+zMZZmfSGDhOGOJOk2VNaGfw39bQu8pHY2XRGPzernlMDFGGBcBTTXTmb4g5ewLg8hXk/bG+88RtRXMbz16Q2aETl795L5jSav3Fxallbxm7tWPwviy0bW2WWSB11rhXrV6We7endWKU+fcTE+kehYRZflEgV0luGwEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMb8Ui/b+yY6q4PujdGxSBB6QMxryIVTYwXsh5AqGAo=;
 b=YnaK4YOP164i0pkgRWqu+btOh4h5v/iIS6YnROTMKBXowCwUWBuE1XVSIRvr6QgMGoxvx5nVAWaAL8fhA2+bRrTjTYUH9zT8XZes7Qu+/d33MXuHOENl/EF1MTd2umLNUUfm5ZtxcV7+wd46RluSKW6yP9pI8zGdillUdTUfEfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Apr 2022 17:21:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Message-ID: <YmF2Zw13O6oaAT0k@Air-de-Roger>
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <20220331092717.9023-4-roger.pau@citrix.com>
 <0bb48681-a78f-d32e-f989-822dd5e54b70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0bb48681-a78f-d32e-f989-822dd5e54b70@suse.com>
X-ClientProxiedBy: PR3P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01f2bae7-175b-4ad7-341f-08da23aa948d
X-MS-TrafficTypeDiagnostic: BN7PR03MB3619:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB36194323EF060385B52FCAAD8FF49@BN7PR03MB3619.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DVpCNV6+iOqsUGrlWmeKsT2wyN99KRMZKuKKXIcRQoawSxlMGfQ/NQuN53hljCkV4x7Zy4peKZsPPTmWdjpvF3e3RaiJ874Iufgbs3ObGqcKQr5cgS5v9mmyPfsN2FVYKcwja5EWpOv/HJn6Vv8kN3BDppledHhpRvGnmMfqK38mozzP1rXFX/ovC/8ODP3PYmleyb+KtIwnnTd4MRCI4tCKyl6G2etkso5InCV5YpOGrkHcOPC0vXg1kVGmN7K80iv2a1VuzQHWtHmaXNEDw2ZaNDOIC2zFl4ttxwcHxcPOhUgSuuSIKjPxfXIbnTnx6sx4AZTDoIQXmecAKACTiAWLNIWLUGfKq3yWo7VJLng3SzG1HYaBBSplu9PCh2XVVsFZRqYhUkeMxEqnVaMcizyc4vM9dTbM5B0quz7p7B4YIqIYzKN9Kf5KKzbf6D8zzZmnOsODPlbUujEd82leastj2ae6iHk0/bRR5jrtXKEZxnmySBbLXlfz1SyJ9xLHKlfdeSOXIMJ4iRw/rDe46Kaq91hh41973GVhm9hdx280qj38H/VPNjQk9tHBv/0ajGI0bBt0DSko7cTMWAnatOGVpBcq6kASog5DCFHdGWYAdfF615MoWH3a9h5bdcnMrCDDsRE7LlDrY5FTB1l+Zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(186003)(2906002)(6506007)(26005)(83380400001)(9686003)(6512007)(33716001)(5660300002)(86362001)(316002)(8676002)(85182001)(38100700002)(6916009)(4326008)(66946007)(6486002)(66476007)(508600001)(6666004)(66556008)(8936002)(54906003)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eklvZ2QwbitWSFU4Wk4wajBmYzBzbW9tVVV6TVgrK0g5UzhKZXRlUVhLcVVo?=
 =?utf-8?B?ZVBsMUt0UDZEcVV0Zm5CMTlpRFdMakc2R3FCT2h5OTI5Rm1nY21MZ3hwTmw1?=
 =?utf-8?B?YUZNR1lRcFJsdngxamxlNmNWUTRvZ3hEVmk5OUZmVjVKZHRiMzB2YXk2enRU?=
 =?utf-8?B?QU05a2VCSWdUK2VLM2hyNC9idVdUdGgxUHE4cUtmLy9rM2JwWGI1RHhtSjdK?=
 =?utf-8?B?WEpQSk5SZnF3bWdTQVZnUmtpenZCNFB1ckhycUJ5SFkxLzF6V1lFcXpmenFz?=
 =?utf-8?B?MytoRzdWeW1vUkhqSmk0cm02emF4aFNIckZ3NUJPT2NuTE5YTkg2aFdRaHYw?=
 =?utf-8?B?ZFV1dlZmVXd4WmtJY3haQmU3L2MvMlIwZ2laWG45bHBkSUFkMzFDUDFWZGFV?=
 =?utf-8?B?SGdubktNbDJtbERseGFPak4zRk5OY29vTE96NklzWmJzelAweTVPd2xrQmlR?=
 =?utf-8?B?ZVlLQlZ1bmR2NlMvWFJlNVpzZnVlOUxpMVN5VGFjeHZrU2RsWFE2dnFDbTEr?=
 =?utf-8?B?RFVoNS9vWnExelA5QjRTTE1rU01QSDYwVTBOemhyNzg1ZmtJdW5mc0lZbUkr?=
 =?utf-8?B?NmxzSGJneEFibE1lYks4MTZxSXJCQmpqaE5KazlzelJFWW9ENFcwcFZQWmRF?=
 =?utf-8?B?N05rL1NEWTFZd3g2dUVSR2dOdVU5ZE5tVW9Lekp1SnhMYkNNZitaZXQ0YnR1?=
 =?utf-8?B?SHZOVWw4eE9Rb3M2WTdDV0dnZGRSdDRxc1dqY1pvaFNFbTdhZHNSM2hrdVRs?=
 =?utf-8?B?aDVndVQyQVgvTnBTTDlJbjRBd0RGclFjN1NLTjV0MkI4cHMvREdaWWZweTJ2?=
 =?utf-8?B?VGx5a25yL0R4aEJyM2hCT3NuTU5wWFlXQ3Jramdmdk5JNmNZU2dHK2UvTWFp?=
 =?utf-8?B?SWtOR1VlbWRaWm9NaHVrcldJNkh3enRNYmM3TURNU1FZZzhoZmprVG80NGFC?=
 =?utf-8?B?d3dMR21DM2NjK0xtKzNEa0o4ZDJYSitIRUd4SU9YeDd0MFRESk5OK0c4M2t6?=
 =?utf-8?B?dTdLbFhHMVlrb3BKRjVSVUk2Vldxb0JjOWVvT1RkQStzaTZKcjJwa1FOak1V?=
 =?utf-8?B?dkpQRTg1NUtvVTFwWmJ3dXMxMGUzZy93UktPeWYvMkRScjE5YmplL2tjMjRT?=
 =?utf-8?B?ei8wcnVoZVlvd0kyTnZ1M0M2VTZ4bWl1RE1uMVAyZHp5ZSs0Z2R2RlRRQlRz?=
 =?utf-8?B?QUl1M2VzRTgxeE5sY05iVXhQcmFSeHdPL08vcnRPQjZ2bU16ZGRubWZZSmRr?=
 =?utf-8?B?b1pVdGFqNnd4RE5iOUsvRlhvQlBISE9tb2tHWjZucno1ZHJZaHZrS1BQV1oy?=
 =?utf-8?B?SXQ1L2NpT1AwQjlnNTIva2gxc3dYSEU2Vk1tM01ycHE0dXlsK2dta0prSjNy?=
 =?utf-8?B?clppV0IrQlhPOVdVNDZCQnZTWFBiNEVOczV1RnBtdjh3N1c1ZFViU1F1aUpw?=
 =?utf-8?B?ejVza1pRVlkvbDdOTSsxYi8vRWM5WHo2TWNWeW5SVDlsblVSd0gwM0VzS1Zp?=
 =?utf-8?B?SlNYME1RaWhFb1NBNFJUU1I0NUx0VldUaUNYV1J5akc5bW8vUzBzOTNDUHd2?=
 =?utf-8?B?Q3FUY2lGdXNYRlhQYUEyUlBHM0ZRdkdhSTVWMkQvZFBzcDZXT214cHhoZVFP?=
 =?utf-8?B?U0VZSnl5b0pSc3VPMU5BNVliQUdoOWRNWFE4S2pQcCtiRG15TnJaVFBma040?=
 =?utf-8?B?Q0o1WUJCWGVZdU5vNlJWOEE1TFJrN0Z3QmVWN3k3S2lhZXlmTHRQV1JBdjQ5?=
 =?utf-8?B?dDFCcUJRUDFsUmVST3dYZzdjME5lTkZtN2oweFBZSk5Gd2Vqb3V3RDBKdUtk?=
 =?utf-8?B?d21keVZqUTJmWlQvZmFDZ2ZVVTJsczRNcVJpNUhQOUo4NnZDV2x6WjBkMG0x?=
 =?utf-8?B?L3dmM3VCY2VXdnc1ZE5YS1VsVDFCZ0h1N1hDak9wYU45elJMR1NPM1pZZ1FG?=
 =?utf-8?B?Q2VmTkR3N3ZISmtVS055QkpwaDh6eEQwSUgyMkE0Q1M4WDZvbnlTMEQ3ck5v?=
 =?utf-8?B?R1dtd2U0TFhvSlpXemtDQjVGTjZqN3luakpkbmtTK05wdzg4dVRBOVZ2QnRa?=
 =?utf-8?B?V0pCKzRTNU05cWNMcU1CaXVYZVVkRW5ZL3pzblBHalRVcDhpR2k5SzdoeTFE?=
 =?utf-8?B?b2k5ZHRFdmJQZklQQ0xwTnVjb2Q3RlNhZEMyN1p0WnM0K3I1QzgrSFJ5Snp2?=
 =?utf-8?B?UjB2eTFEMnV0MXRKQUwwd3JCZWlLMSt5Tm9ML3BONDhDKzJNTVZBamlzWDdL?=
 =?utf-8?B?Z3cwNDJrY09YWVlsa3VaaHhKSHZjQmpyZTZiOXR2U1RhSnNUaUw3QTkwZEV0?=
 =?utf-8?B?ZC80RjJaSWdpU2pNSnV4SHJoZUN1dndxRnU5TTFOSEhrbFhwZEk1Sm1jOHNX?=
 =?utf-8?Q?jE3it0bBoKGdQIHs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f2bae7-175b-4ad7-341f-08da23aa948d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 15:21:17.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5f6myKxipaUVQK244elfBwfkYjzu09HRktoMFYQvxTkfr3V+4xSlrJ3scEEtC+cof4tfSSGe+rkgVhh6uG30xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3619

On Thu, Apr 21, 2022 at 11:50:16AM +0200, Jan Beulich wrote:
> On 31.03.2022 11:27, Roger Pau Monne wrote:
> > Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
> > the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
> > families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
> > allows for an unified way of exposing SSBD support to guests on AMD
> > hardware that's compatible migration wise, regardless of what
> > underlying mechanism is used to set SSBD.
> > 
> > Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
> > shared between threads on the same core, so there's extra logic in
> > order to synchronize the value and have SSBD set as long as one of the
> > threads in the core requires it to be set. Such logic also requires
> > extra storage for each thread state, which is allocated at
> > initialization time.
> 
> So where exactly is the boundary? If I'm not mistaken Zen2 is also
> Fam17 (and only Zen3 is Fam19), yet here and elsewhere you look to
> take Zen1 == Fam17.

Right, but Zen2 already has AMD_SSBD (ie: SPEC_CTRL), so it's not
using this logic.

The AMD whitepaper is more clear about this: any Fam17h processor that
is using the non-architectural MSRs to set SSBD and has more than 1
logical processor for each logical core must synchronize the setting
of SSBD.

I think just dropping the mention of Zen 1 in the commit message
should remove your concerns?

> Just one further nit on the code:
> 
> > +static struct ssbd_core {
> > +    spinlock_t lock;
> > +    unsigned int count;
> > +} *ssbd_core;
> > +static unsigned int __ro_after_init ssbd_max_cores;
> > +#define AMD_ZEN1_MAX_SOCKETS 2
> 
> This #define looks to render ...
> 
> > +bool __init amd_setup_legacy_ssbd(void)
> > +{
> > +	unsigned int i;
> > +
> > +	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings <= 1)
> > +		return true;
> > +
> > +	/*
> > +	 * One could be forgiven for thinking that c->x86_max_cores is the
> > +	 * correct value to use here.
> > +	 *
> > +	 * However, that value is derived from the current configuration, and
> > +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
> > +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
> > +	 */
> > +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> > +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> > +		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
> > +	}
> > +	if (!ssbd_max_cores)
> > +		return false;
> > +
> > +	/* Max is two sockets for Fam17h hardware. */
> > +	ssbd_core = xzalloc_array(struct ssbd_core,
> > +	                          ssbd_max_cores * AMD_ZEN1_MAX_SOCKETS);
> 
> ... largely redundant the comment here; if anywhere I think the comment
> would want to go next to the #define.

I guess I should also rename the define to FAM17H instead of ZEN1, as
all Fam17h is limited to two sockets, then the comment can be removed
as I think the define is self-explanatory.

Thanks, Roger.

