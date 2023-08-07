Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3127771DC6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 12:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577982.905144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSxBy-0001Xi-Gb; Mon, 07 Aug 2023 10:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577982.905144; Mon, 07 Aug 2023 10:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSxBy-0001Uv-DE; Mon, 07 Aug 2023 10:10:26 +0000
Received: by outflank-mailman (input) for mailman id 577982;
 Mon, 07 Aug 2023 10:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qSxBx-0001Up-11
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 10:10:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e7efde7-350a-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 12:10:23 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 06:10:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB5994.namprd03.prod.outlook.com (2603:10b6:408:133::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 10:10:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 10:10:17 +0000
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
X-Inumbo-ID: 9e7efde7-350a-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691403023;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dxlPdX+hZUzoq/CyBw+dkz4W4owffyn2sdl5MoWepFI=;
  b=djkm2OSfP8eRcnBGsHOvjN33SRx/beDzp3tktsP0DMAOcnjaNrL0VXH0
   8UZpOXu3Gt1w5K9/Nh6VvjG5VsKQ7k9jVGrg98K99yA/W/ipZyBqmw+zk
   rDDuej0/Qox8if0qc70Gdi2jWwqXG9Ep/87kh5MJ5CdvyEIwwGQXNl0I8
   4=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 119135241
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LCZko6i36lCfX/9xb4yTKfiAX1619hEKZh0ujC45NGQN5FlHY01je
 htvXmrUOP2JMGChLY1/YISwp0gE6MfWyddkQAI9/io0Fykb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AeAzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tREBQgARS6tp9mc74mhZrBjmuUiB/H0adZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGybLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTpr6U32gHKroAVID4YRGOqrqWasGSdVt5PK
 Fcv/wlt6pFnoSRHSfG4BXVUukWspR8ZXNx4Eusk6RqMwK7Z/waYAGcfSjdLLtchsaceTDgr2
 UKOhdLBDDl9tvueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adjdTvEDH1z
 jyipS03lbIVy8IGv4255lvHhD+qprDASwcn4QORUm/NxgZie6asYoW67l6d5vFFRK6cR0OEt
 WIJmOCf6v4PFpCHkCGRQOQLE6qt7vzDOzrZ6WODBLEk/jWpvnKmI4ZZ5WgnIF8za5lYPzj0f
 EXUpAVdoodJO2enZrN2ZIT3DNk2ya/nFpLuUfW8gsdyX6WdvTSvpElGDXN8FUi0+KTwucnT4
 aumTPs=
IronPort-HdrOrdr: A9a23:5NijJKu0jQn+k777rUAKDa5w7skCM4Mji2hC6mlwRA09TyX4rb
 HaoB1/73SbtN9/YhEdcK+7SdW9qB/nlKKdgrNhTotKIjOW2ldARbsKheHfKlbbak7DH4BmpM
 Jdm6MXMqyOMbAT5/yX3OHSeexO/DFJmprEuc7ui05ICSVWQ+VY6QF9YzzrYHGfhmN9dOQE/F
 733Ls2m9JkE05nH/hTfUN1O9TrlpnwjZf7ZhxDLwc/gTP+9A+A2frBCh2F2RVbeC9OxLpKyx
 m5ryXJop+7tu29yFv632vehq4m/+fJ+594HcmRjcpQDCvqhh3AXvUGZ5Sy+Aotpf2p6hIRsP
 SkmWZZA+1Dr0nJe32zo1/W1xL+3C0I43vvoGXo+kfLkIjCXTcnDMgEuo5DaBve7CMbzatB7J
 4=
X-Talos-CUID: =?us-ascii?q?9a23=3AWUS7Wml/ZKpsgrWrZxq0nITI7uzXOSHw9Hr7HWG?=
 =?us-ascii?q?YMkxGc6e5EFCM2aJPq9U7zg=3D=3D?=
X-Talos-MUID: 9a23:S6ZPOgr6UpiAAWNardsezxJsJf957PiNMmounJkWuNK/MA8zfA7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,261,1684814400"; 
   d="scan'208";a="119135241"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB4ot9rplJORzk290+lPZRlU2uTz3tcGzPP3CNjkmeVQ0GzTFMynOlTiD2ULMHg6Ox9mXcJSjKCdSmuJLbnJKMCeFn0ELBPL8DwZ2Gl8e+VE6DPaIbcrgafDLYQP70BE7tnph/JWAAyQ39EqFaq1rMHEc2Y748WEUFJZGZP5h9Q7Fkty391ArGfduf8Zh+gr/7peHEPHS/DGCyoNxeAsIr3ygjkFvX21C/OMSkwHPc8hXrjC1Dv5KiEmLYI7Y9aYQuBKBtxSA1xpIPpygEIF7stzWdpxsPc0nAaIJ1ueNXPuSCLKYVbZv7SmyB7tKmtJLihSlsohfGZmXDzboLSA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knZR3xja8bAEDmIUgLm4qlqxCYSBqGV8z2tSXrBwD+4=;
 b=AVfC7KHPg45HXRsXOrAg5JxnqO3/v52Qq5rm5DVcDhC3fhCD1mqk4sL6MQV5sKRQ7lo9TpUW3wbsQDhwrVrKE54DHelI4JGH1u3KsBd5ACKOlUzSaGnrVDtd8s6/6J/QmB8MuziPPcurHYjBwr6GXTZl/abWrdhzkoCiggfzWuNf8DvUbPNZBzbHNYW5py4ejw8VnsbL6caq1NvyzxCd9ke92KSY0PlsTZGVbIjE4CeIhZwK2rMQQ3u3ZlUAh2ZfdzSat93kVcgV6u7B0QiE973PfezEfe7PPNOg9Cp1ZoW4pMw4N5FvZREqsqjpoDL3eQ+Ct5H5JF6VxZL8cX2+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knZR3xja8bAEDmIUgLm4qlqxCYSBqGV8z2tSXrBwD+4=;
 b=DFoSmi6q8aRb107v+JjTkoqhZiF3JZb8Rb2g+2J23pEAic1yndCQ12P7BWC7RNE2rtKoYq+dOKFkZYqyhBLKjDj9s3XnNo+UL0QmY2MxMledVgsMHjYFPsAVJ/188vnmXIt4bzUgWI5bb2lx2SWdllnvVDxSstEtrQM1R/5Fr/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <874de0fb-b3ca-3651-42db-75656838f2f2@citrix.com>
Date: Mon, 7 Aug 2023 11:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
Content-Language: en-GB
To: Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony Liguori <aliguori@amzn.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
 <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
In-Reply-To: <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0405.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: dd55767c-5ba5-4834-1f26-08db972e7fe8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6hqc56oWg1pDeU27HJSh0fA0hQ0ZYPJrgFKOixoZcf+paRKMfSxSH43/U5f9oFL/fEyScCMPL+PqsqPqbsrSTyMDcolfaLBdbtjWALXAT0WW/8nO2QF0F5y4KTLH9ibHBFn5ShbX7aGQRx4jbdtJfpjUA9Y9AKtxkTSwsHC8e1TGdflUxm4so2QzA+rmDWOhwG5ovOX4gmN6ZxtbgIhgC18pbeLOtKFbZoUDBJUg6ijMXMiWgAWFxZowAPhfdsAur/qHtyjLPF8NyrE4ct/x10QmXxr7oLBueM60ofumDUiarPPQI56HLBxRymMdYXufcJGPJYvPdkgD7+IuNyTwvLY5olKHn6XrZ0sJHEXY052km8UQ6YAhdrmgTHxB8CKfO8RE8xBmgtNMyfzikD9zXHkmadbmz4sVhL/n0rw8inuJror062NWjWEfP/DkVpmgaLdyDJ57yk/S0b/9DigkYFjWKG0bubdA2Ee+95+1PHN+Mi8s91oemr3ZWP73jyWvYJ/CtoLboUKb2l0NElpPt3gPPaigexXPWAT1IHtua7QZduiQrrf47kkBtjlNOYYYgUyxTvtLZiDdFFwkdpCE7sFAGYoSqpiy1BeLOu7aALdOFHZs1LhmSsmMLK7Z01XRWnidDFXKjrDWT0rjO+siug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(186006)(1800799003)(2616005)(36756003)(966005)(6512007)(4326008)(316002)(86362001)(478600001)(54906003)(110136005)(38100700002)(66946007)(6666004)(6486002)(66476007)(66556008)(31696002)(53546011)(82960400001)(6506007)(41300700001)(26005)(66574015)(8676002)(8936002)(2906002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEZjMS9SbnlBSmpqV0Zta09mbmpUL01lV2RTZHlPdFVub05GTUNaSjJxbktD?=
 =?utf-8?B?OS9jeXdyRjZ5bEp4WmVka2hzaGlhSVlqRkV1bGsrMzl4L083SVRyYnA3dGpu?=
 =?utf-8?B?OERZOEFPRHVFZXJvRzc3NllVcGU4N2dMQ1JXNVRNSXE1c0RBTmlNYWtLTHhw?=
 =?utf-8?B?ZjhIK1ZSZVlJU2x5eE80OFh4am9FblRvRWlKY1BUTm8xS25vQndaS2lEdFJ4?=
 =?utf-8?B?YjVQbnA0akszNU5TWmtPNkZRWGJydHhXUklybmEyUVRVL2o3eDlzWjVnZ1M1?=
 =?utf-8?B?L3hUV2RtYW5QRm1VQVRDWmRGTVVnQzdmcHdUdHgrQUpKMFZGa2ZVNDR5ZmFa?=
 =?utf-8?B?Ky8wbmhBYk1NbUY0K2ttcmgweEhHbG0wU3pVZnppLzJFUkdOcFF6bm00NGtj?=
 =?utf-8?B?Sk9IVnJpQVZRcWUzU0tUSW11L3hHemxESW0rRkt1L1JCNVdqR0dmczRhMEcv?=
 =?utf-8?B?RTBwbWNCQnE2VjcwMUxDK0Vsc0o4VFI1ZlIrNkpDZHo1VlRCRjdmQ1RGRHZU?=
 =?utf-8?B?ajdzQjFZaUtER0w4WllFVVBwZnJNUmt5bVIrTHorQUdqY0FzUmluZFdIQW1H?=
 =?utf-8?B?RUZoSVVYSUU2RDQ2a1VQZ1R1K2Q0allzbXNLc2ExTEJYZFR6Q3hSMTBjM2d3?=
 =?utf-8?B?dkxacGRzVGZobnI3L2NNUXN0TG9oQmdPaTc1T3NETXdaRTlvcFhhVGVNdGJQ?=
 =?utf-8?B?NEVEZWp1OWZ0Ykd6QzR2aEZHMkJhaFFqQXFkOFh5Qlh6QkZ6TUhWNXJpVEVj?=
 =?utf-8?B?QXo4Nk8wc2dZdEtRdU1yaDFnVnNaeXF5K3hUamJxU25zNXdwcUpHM2E2d3J1?=
 =?utf-8?B?TnRROCtSR202N1YyNWlDdVlWeU9wbC9FRTlTMWVFbjJoM3FPRUlWQ2E4Ni9O?=
 =?utf-8?B?K3dZTzJ6ZjFGYmkycTFSTEhyUm82RVBwQ3lBSmx3U3FKZktiL0g2b0UzcEtu?=
 =?utf-8?B?aWtwNUNmRVpvdkxLdHVFamV5M0NGL2pZM0FRY2lHM0QxNjNYVWc3MTd4SFZE?=
 =?utf-8?B?UnBQN3dHbzNaRlZ6SnppQjZ1OEx2SjhTQzdsQ1NET2RSc1FQbDVWTWphVFlI?=
 =?utf-8?B?emhRN0VuRUdCTUdiUzR4VGJ3eHlpb0RSMHVJVUt0TGlWcitPZ0FnWHhTQS93?=
 =?utf-8?B?cWQ5TU5vaFNNNjJFQ0RNUjNXWmdJUjBocllCem1mdkduOEx3eUhNZU05cFV1?=
 =?utf-8?B?TFJLWDdPZTRNTmtYNXFMR1hZbGpKQnZLNy83a1YwejA0dVBTdVpwbGhMZ3ZW?=
 =?utf-8?B?a3htZ2Q3V3YyMG4yR2YwUDZBc2ZCZGVaRStVMW9Cb3N4TDErdGNPUmNBK3FN?=
 =?utf-8?B?ODh2c1JkK216WEtKL0lzSDhOWmxYWlRIdmRCbk5DSmgrOXFlVldEREVPVjVn?=
 =?utf-8?B?dGUyaGdYUnorQlpSVGtUSlNhWDZuM0hwUHZhN1cxWXhJT08wUmZULzBRZWpV?=
 =?utf-8?B?dHM3ekc3NzhrRS92ek4zRXFFYVBhUVhDNUdoQUV4T203V0NvU1Q0WDI5Z1lt?=
 =?utf-8?B?SzZiQWRiR2ZkUWdsZ0hTY0hHYUNoSi9GY3FwOW1hMTFkMWFTL29YdVowb0kw?=
 =?utf-8?B?U3VGUlR5cENmUjluTkNySWJYVGZKUTNNUGhRaUtwVm9DUGxrV0hseXhPdUMz?=
 =?utf-8?B?NTFEc0I2dTN5YUVBU1FpU2tlOUVrWW44Q3FGcW9wdDNiZDJYNWZ0b0NnYjh6?=
 =?utf-8?B?NmQ4NG9YSnFHYlVIVHpnNUlKcjZCN0UyZ0txL1dNZjBKeG9JZFpxVmFWbDBT?=
 =?utf-8?B?a1UrMlRJSnZ3ekNLYVB4MXcrOHJVa0ZlTENBZHNSSE5xbC9rRFVSaVg1YUtw?=
 =?utf-8?B?YWcxWlBLcnY5SGFuZmRNR1pyaHZtdGUxbzEyWmdsQ1hUVzhVaUl5ejMxV0Fa?=
 =?utf-8?B?UDBzU2FCanZjT0NzemQ3WmxLZ0VMdWVkVTJSQzNGS05vTi90R1Fxb1NxZkgz?=
 =?utf-8?B?ZDRwNTVFdDZvUzVHeVJ1d20weXVmazVIQmNnZ3ZCMjkrcXpLRXVBQ3MrU2Z1?=
 =?utf-8?B?VXpDRmN4UWtOdmFBRjB4eUxvUlJnV2ZLalJjb3ZSMkFRMGFZNXNuUVJhZFkv?=
 =?utf-8?B?amwvVndxY0VCSWhUWFQyeVcyRzRFSFpTdVVTOVZIWFQ5UFU0WFdnaGVKc3RG?=
 =?utf-8?B?TG0rSmFVaVlDQ2E1N2U3eHdzbVgwby83MVJtcWxPMEdrV3E4Ti9kQTBTcnZK?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vkgub4cOixtS3V4O68gPbwy/4puM5v4M+guTJMoc772nu3GTjm3twDTJVxplXgz8a67j/ZJiaJVqkIdzIpRLtpTCFKfstm3mWi6pKJ4wVy1RBGRMYgVbpY8XDN0ppMA6z+1bbk2aVUuidBAToFNdrZuUiQY0O5tPibK+ME5iGjfJyx4WE+Ydyqv8Z/pZ9qsoMq0FeRvF+Nf3KyUiwbsLlv2GNsF9OkBt1fYaCrie9L5aRuk88QVKo2JQxhD12zcQgiEPyims3YjjoO+Z57yzyleGdWTYGbVbPF5c1i0HzKHGOaaG/g4u4GhhFJgw+yPvvseg5G4k76Kckm+OSx7mn1cEeBldoWqvDPJp/G+bzE0kwgkC49rYh1ELGXiq1plz51oozLhk3S1JbzkFN7aXQ7Dg5Genay6qGl6eFy1i4f0jOeARpvuHLaASpi1sk/Y0F3XW7Mg3nbEP6/1uVvjD5VS3DQBB0P6uqFLdNvZcjgyy8bSBcdyrp9YCBwGnBlL1pPTbYg2ZUpLzR9U7PEHTeeLYwejuzU5t23uHe/B1ClU02/9/lK6CBhx/0ZfJby8bJ6R4yz2lrbS07bMih2KbeqatBbBXZhJySYvKRZuo4+sZRqfMP3NFnFchuwQmiJuRobKU6pYTeXA9cBSzm0j+1uCo7R9Mz3XoMYfBCGd9gnYrX/bG09di1EnaoAeCaSc9LkkzYrMCZSfngyhVgcZ6Zazb5D3xVhRICjylNKO/hrSUF9WpX94iAXv5AcZgfXjYSMAWHaMfmw+M+9OMWsrLtgSqONKojiLPgJhxFAG512rdjchKTxbs0s8d2ZVn4Yl2O0q7SqLeBnXPE2Slr6aGiEE42RDcGSAgx3j/nUgBF2Ia/muhde0DZeR99iLNmdQ6GuCRQO6Ayb0Tu0uYcGBf6ESZaZfXNDzCyKgzHCJoB+s=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd55767c-5ba5-4834-1f26-08db972e7fe8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 10:10:17.4388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZGdpjweQeW45AG8BEDLn4TI6Ms5ujw/c5cUKCq6qzclbdPDjNNtwep4LgqO7ntO5XERn3uXyjpCsLy21SRoelgRW7p+DMIuoLEzr6FrUwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5994

On 07/08/2023 9:18 am, Simon Gaiser wrote:
> Anthony Liguori:
>> From: Jan H. Schönherr <jschoenh@amazon.de>
>>
>> Intel says for CPUID leaf 0Bh:
>>
>>   "Software must not use EBX[15:0] to enumerate processor
>>    topology of the system. This value in this field
>>    (EBX[15:0]) is only intended for display/diagnostic
>>    purposes. The actual number of logical processors
>>    available to BIOS/OS/Applications may be different from
>>    the value of EBX[15:0], depending on software and platform
>>    hardware configurations."
>>
>> And yet, we're using them to derive the number cores in a package
>> and the number of siblings in a core.
>>
>> Derive the number of siblings and cores from EAX instead, which is
>> intended for that.
>>
>> Signed-off-by: Jan H. Schönherr <jschoenh@amazon.de>
>> ---
>>  xen/arch/x86/cpu/common.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index e9588b3..22f392f 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -479,8 +479,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c)
>>  	initial_apicid = edx;
>>  
>>  	/* Populate HT related information from sub-leaf level 0 */
>> -	core_level_siblings = c->x86_num_siblings = LEVEL_MAX_SIBLINGS(ebx);
>>  	core_plus_mask_width = ht_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
>> +	core_level_siblings = c->x86_num_siblings = 1 << ht_mask_width;
>>  
>>  	sub_index = 1;
>>  	do {
>> @@ -488,8 +488,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c)
>>  
>>  		/* Check for the Core type in the implemented sub leaves */
>>  		if ( LEAFB_SUBTYPE(ecx) == CORE_TYPE ) {
>> -			core_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
>>  			core_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
>> +			core_level_siblings = 1 << core_plus_mask_width;
>
> On the i5-1135G7 (4 cores with each 2 threads) I'm currently testing on
> I noticed that this changes leads to core_level_siblings == 16 and
> therefore x86_max_cores == 8. If read from ebx like before this change
> and what Linux is still doing [1] it reads core_level_siblings == 8 (as
> expected?).
>
> What's the expected semantic here? If it's to derive the actual number
> of siblings (and therefore cores) in a package as the commit message
> suggest, the new code can't work even ignoring the example from my test
> system. It will always produce powers of 2, so can't get it right on a
> system with, say, 6 cores.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/cpu/topology.c?h=v6.4#n126

Topology is broken in many subtle ways, including bits Xen inherited
from Linux.

As it happens, Thomas is working on the Linux side right now, and it's
been quite an effort...

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/log/?h=x86/topo-full

In some copious free time I'll be ste^W borrowing this.  It comes with a
negative diffstat too.

~Andrew

