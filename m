Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356650FB82
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313789.531538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIqL-00021S-5R; Tue, 26 Apr 2022 10:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313789.531538; Tue, 26 Apr 2022 10:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIqL-0001yi-1B; Tue, 26 Apr 2022 10:54:53 +0000
Received: by outflank-mailman (input) for mailman id 313789;
 Tue, 26 Apr 2022 10:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b/nE=VE=citrix.com=prvs=108c91f88=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njIqI-0001yb-Nm
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:54:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49ced712-c54f-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:54:48 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 06:54:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6858.namprd03.prod.outlook.com (2603:10b6:8:41::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 10:54:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:54:42 +0000
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
X-Inumbo-ID: 49ced712-c54f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650970488;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2EXOvYM0vLVDX3/5XUuLCCDxGie+Sm6ZAc+WzdG2tIk=;
  b=bfwx/o5XWt4ZgT4olVvmO8iazzzGTrJL7v9eeSkqwjQaoARgelUUWwKG
   jDR0oRmpqaW2n8DsuGxQALiszFgQSh0QDe20A7EkOda08MvLi5vUok3Uh
   46rUe4Q6QVkIyPbb7WHZkbkBpEx2xt1vNF8EkyEZGj/ug6jyI5qS/cpSD
   o=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 72381383
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4Kxp8q/duMIhpDVmSrTZDrUDgn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mpNCj+GM/mPM2eje9p/aoWwp0wP6pOGzd5rS1c++Cs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YLnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaGNWVYMffyLo+gUchJHHgpkfvdl+YaSdBBTseTLp6HHW13F5qw2SWsQYsgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHP2MvIcBtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK//FnujODl2Sd1pD2KNyPQtmEafl3l0Wb9
 mbWoF75IjsFYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGGAlg4RXZxXCeJSwAOC0K3P+C6CG3MJCDVGbbQbWNQeQDUr0
 hqDmYzvDDk26LmNEyvFr/GTsC+4PjUTISkafygYQAAZ4t7l5oYukhbISdUlG6mw5jHoJQzNL
 /mxhHBWr90uYQQjjc1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:P+a7/KAYJ6XGMs/lHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Vza/ppVFZql/1XwKqVKuZzIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.90,290,1643691600"; 
   d="scan'208";a="72381383"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b208NmdORNmvXWmtemFyZjtiXUN27g4wYDyV8izTPHOazFCNviudUodIVmHcpY8k4umwv6CfIpHIFH2+lMCclVQUYI663fBOmY8Xcj5UMGD+yCQ4wsVMFI1h+nJjDVDIi5KydyrFt4GpYyXC4MjN09TDlKaWFth0tsmYwjnGrfXwmkcBH/RJHWVA/R8IS+NXBgjPgVzp48M7duwHA5USK7AF+0F9gfhYS2nfHkXQqaYBEdrIfV3d3Hm02mbkVy2oUI+o6iZlOIFnLlM2grJ7LyUdKw8YAWplzwn/Es6MumjxTjdFA+iNI+BKWk5ILgMxT2TDy+PHWFEuaPPUkDAREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EXOvYM0vLVDX3/5XUuLCCDxGie+Sm6ZAc+WzdG2tIk=;
 b=YyKlFUGgN8xnv6SAvVC1srZg6TW31JMuv1URcmzmrj+kn4V+gjk+0m7QTYDM5s6fcqJP98uD0ROQTi2aB7oDCrEXbbUyxkfOx8tfbL29Q7ofMQWA5lb09S7GjkKscwCPCYI7AIBqPiPpTB+3w+EOltptgbHHxTyGQIoGznZBfYQB2T9E8nbF8laa4pgS1hfuP/plMQ+M60fpN1r1DLCNTDSYQXttM0HDUZkJLhMDbbLTCba8X5N7VcOCKBGRcWQNoTW8APPoeK7bHBszef0lDRF5XPPVnmcKV41jiJaJXGfGHS0dnb4Sweeupjbn5ePc+ixC+6QP5jEGVKyQfW9Ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EXOvYM0vLVDX3/5XUuLCCDxGie+Sm6ZAc+WzdG2tIk=;
 b=akIqsodMP3zLY3z7PEU2b4SzBsihQesw/wEocEe0HVCggmX2FsDz+8FeWWBvYbU3tKYU/N7P4za5ZxQ+1T2HrObpy6YpXbX5JHJItrZEsD5sXgeBi727q5ym25ks+6Os9/VfxnviOectYuxo70nM3jh8ZRSvq32Ikq9BDnJwT8s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, George Dunlap
	<George.Dunlap@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 5/8] libxenguest: deal with log-dirty op stats overflow
Thread-Topic: [PATCH v3 5/8] libxenguest: deal with log-dirty op stats
 overflow
Thread-Index: AQHYWVfhm+zZwj1KrEGTWozLvDKzrK0CBWEA
Date: Tue, 26 Apr 2022 10:54:42 +0000
Message-ID: <068a468d-a7a4-bf24-264a-ac86b910dd82@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <1b24d2b5-14ff-6e4f-6fa5-d91d75e315a4@suse.com>
In-Reply-To: <1b24d2b5-14ff-6e4f-6fa5-d91d75e315a4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33bf66ec-31d9-4ca0-95e0-08da27732b38
x-ms-traffictypediagnostic: DM4PR03MB6858:EE_
x-microsoft-antispam-prvs:
 <DM4PR03MB68586590EEECAA0E86DD94DBBAFB9@DM4PR03MB6858.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ysLXSyUqoDGkG8ukWA/7pQkLd9iMSasOEfYh/VElPhMoaPLQ4+M9LnEhAZGvIDa8XWyKqrDRHthuFHJNxzuzp7ys+3bYOa11B/4GjeGwRCYP0C0y5DAgBYXkZkRxUvme0DA1cZN/jhRLlss6giypdKkHgni9Nr83tWuS1HnoE811zg0JNN0AlyVc7hRRcYzBg7/8slfs8+QbthlXsnK55r7/Dpr5pJMUIKFSKA+7MLoHYNyj1yFdK4m3aHifUQmpD74rpbY5+ymLI8IBXY4RdD74zALxQFNqdRflly8YO7qlJX7O7jjhpv7frBf3oLgJhzipqsSeFr/C0HIUtiCpylzfHYhKacqrjvJUhHeLxwrQdC5VaF+N/15kGNg1guV7Wsw1oU6TN0FAulwGp2WI31YJiPB4r/7eMVanjYp3ahhJRcENi6L88uGTogGh4HE4qW+h/GfWXDWvw8NcPst3VtuhmsD7P+Nf4oRQsakQpvk+14HsPwskHJ2THDSDYqrYG6Gb6TmxA30/gWyAUpZ9vU7eu/+ihA0rQiFflYPQSjSn/wQyfm3xAIVF7T1HPVgRuArfmYfXvMNa2dYDIusema6cJnPhPs7U2k0DIImPZQDfj8rTZ79STXjq3fRdtQKh2BSlMqEdXIzN5k64dyswckqm6SMmZaEZHtWxfChm33c1CxbHxEpd2SmHosksEtZFVkDrx9vbaw2QI+EYZv9Br1jnhzCvUHWcaoWx7yEZhqnQPBPNAgIOnuTrCnlQMZsOdMDcZzsLZ4z6THrxpwY9N7uR4JEIu8hROmUb8/jyqSM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(508600001)(316002)(36756003)(8936002)(31696002)(64756008)(8676002)(110136005)(54906003)(76116006)(82960400001)(107886003)(91956017)(31686004)(186003)(5660300002)(6512007)(4744005)(66476007)(66556008)(38100700002)(38070700005)(86362001)(4326008)(66446008)(71200400001)(2616005)(122000001)(2906002)(6486002)(26005)(6506007)(53546011)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmF6WThTRXFFVWthSFJqaFRKTkNucmNLUzBhN3lKanNzaEZuSTczbXdJVC96?=
 =?utf-8?B?VlFzYllTSmgzaS9CbGxNeVVTdGkvWTQzekVZZThYb2lzU1hUazJSSFVpTG0y?=
 =?utf-8?B?WTJkalpvK2Vib0czU0xHUEpoZXM0Rjg0NmJLc2FoN2hSbzUrR2l1ZnR0UWVh?=
 =?utf-8?B?NFUrU1lCdjFVTGlhT3htZVpwMFJxTXkySVNIUGZSTlFSZGttd1RTL1NDcHMw?=
 =?utf-8?B?WSt6MzJoR1ZlUkh2QzRxeHNEaEhWcUFrK0s3UlpXdTVqN29WcUVXZTMza1l1?=
 =?utf-8?B?c28vc0ZHbmVYVENIY3lIdHJBK3FmL0FTcUwxd0w4VzdhbGZIVm9aNlIzT1Jt?=
 =?utf-8?B?Mmt6MTU4L3JrZHFPc0JzQmltZHNuYzM5c1NVcTNlQW5yR2lBMnZ1L3hIVjdr?=
 =?utf-8?B?QUZuWWZBcHBOdXkwaVFwMTdicTNhSERDdTFqSDg1b1d5UzhSb0hpenEwY2pz?=
 =?utf-8?B?MzRXZFduMnRVak93UUFJQm1JVUV3TEpnc3BrRFpSaVhZTndwcnFXVkMvVWNB?=
 =?utf-8?B?ZDg3TDlvT2FUSUE4THpLcUgzd2pLRTZaa2pwL0wwbjRFa1VIN3F3TGFSQXdZ?=
 =?utf-8?B?VDFibHg3a3NSSzhZQklJZWlWdWVUTmdpaGJGc0Uxa2FMOUllQmhtajZxRWVS?=
 =?utf-8?B?YkRUY2pXRk8xb0pQbmZKWTU4NlpFZXREWCsyajhJTjU3V1l6WEVVTjg1VXA5?=
 =?utf-8?B?bDZsanFubE5ydmQralpaTk5zQjdIcUdnMEN5NjVWUTBkZzc2WUpkeko1Tnd3?=
 =?utf-8?B?YUVRaURhd1pQZW9XSTUzcVlCOGh6VnVxOW1mYzd2R0ZZOC93M2ZwYjVFTmNJ?=
 =?utf-8?B?L2lxVjB0MmNhbHNhQzFzbXo3cnJCY2hwVk5DRUswTjNkZVZTbFV5M0RCOXVW?=
 =?utf-8?B?bHdhb0VCU3ZSVnVQalVrc2tEN3k3Mk1MTStJZW55aFBlMnVET3BhUXFwMkNq?=
 =?utf-8?B?K1RTUTJXQUc0MGhnQTBiUDAyLzNpM0JVT2NOT3VTKzg3OVdMU0ZnRzQzb21G?=
 =?utf-8?B?dU4ydm1PZlVYVXNpS2RmcnUvbmRTdnN0RlRTNXhWTnMwcnBmTEFRcG9hUHFB?=
 =?utf-8?B?RE1TVXVuV3cwcGlwb3EvT0F6MW1RazI1SVhpSXo2WFRHRWJvbzBjV3pZTUgr?=
 =?utf-8?B?RUo3VEtjZDQ3VHlxNWJtOU5WSG11VWVqNlJtWHNrUk1pR0RPNnJBYUF4OGVP?=
 =?utf-8?B?bVNlVG9acm5zeDdLRExoTHE2VUdoQlJmMmJRU2twUHNBTXFoOFByVGhOaUdF?=
 =?utf-8?B?aXU2ZERKdGtoSFJXclR3QnZXUHp3SjZlQkk3Tk9KTjdHd004QWNOcEd2VEtj?=
 =?utf-8?B?dFk0YXloQy9kWXRFM2drWHE0cDAwU2RXNkVvQm1STlVMbEovOXBHeUxFQkZL?=
 =?utf-8?B?QVY0N092d3AxZ1pxalM3anZZdytxRGliNmFZeDY4Nm0xUXd2WmFKN2cyb0lZ?=
 =?utf-8?B?QWw2d2dlWE11L2NFVDVLQ2xLbmRLQzNKNXloL0xJNVVPSEZOUElweGVjOGRB?=
 =?utf-8?B?Slc3cmF5c3crVzd2K3BGS0UvSkNzTkdKeEFkazBNcFlFZWk3QURNYUpTMmxp?=
 =?utf-8?B?UXRVZ1RiKzVzR2xsaThlZWtyK3AyRG5JR0s0Z2c5ZGxRTXlKOXROUlBpTHBP?=
 =?utf-8?B?QTZFVThydVJQK1FNSmZVeC9NWUJDd2pSMmZSZS81UHZ5Q0dJNmVsbVh2TjFC?=
 =?utf-8?B?YVRmV00yNHFCV2hmbk5uRFgrdG1CZ0NVS2VHNjVYbDZNazh6ZXh1dFhDYVUx?=
 =?utf-8?B?UmdXQzVkZkdhOEZocTNZRVMzU3UyRlhKVnBQdXdobDhGRXFlMVNKVGh1VWNu?=
 =?utf-8?B?TmdqclNXbkJDRXU0bXVWSUJjYWVyUmdBU2dFNUR6WGZWRktVYVp5U1F6ZmN6?=
 =?utf-8?B?endsWFBKWFRIaTJmdkJaZGd4N2NiNjloRzNXRjQ1bU9kanlyRUJaUG9XK0Rz?=
 =?utf-8?B?VTQvOXhrb3VDQitlS2w0bVdsWmQ4ajBXWWFhT3VnSlBodDhHTlErWjFBK0tP?=
 =?utf-8?B?ZHkxUzVHcExxWU5jTDRVWFNRcFVOU0dpR2Y2TXNkYzN2eGs1SVgyWWtTS1JQ?=
 =?utf-8?B?N3BtbUJ1MmhNV1FScWZiSzFFQUdlbmdYb0o3WWVWYW50dFJNdjJvUTRuY2R6?=
 =?utf-8?B?ZTJPcEtHZkNzOExsblJON3RsRU1KLytnMEs0SDhJY08reE5GVzVucGJUWHdX?=
 =?utf-8?B?eHIxc1VnSzNBd0RGS2t2NVRIWUZXeTdldUNFbzNzNllFUGhFd0xORXgwQU9Z?=
 =?utf-8?B?bGVJWThIRkJUck9qc21WOS9vOTQ5WWFWcWJMTkgxUWpGelBmVEtiUURBdEx0?=
 =?utf-8?B?QW43VXJZbEt5aVFLdmgzVllIc2Jkc0d2dlpHUCtpL1J0QWJvV3dkUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18C478770D12384DA2AF4940A51B9CCA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bf66ec-31d9-4ca0-95e0-08da27732b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 10:54:42.5885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lUK/QAPEM0nphQ6ct7Xcy15RU9+mHmnZvF7Tmp8/eGAYx15+vY6V5djZl7iB77SWZeWiWfwuCo4DjDHN4ysfKvb7xAhv+AmwdiGk3ZV9e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6858

T24gMjYvMDQvMjAyMiAxMToyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEluIHNlbmRfbWVtb3J5
X2xpdmUoKSB0aGUgcHJlY2lzZSB2YWx1ZSB0aGUgZGlydHlfY291bnQgc3RydWN0IGZpZWxkDQo+
IGdldHMgaW5pdGlhbGl6ZWQgdG8gZG9lc24ndCBtYXR0ZXIgbXVjaA0KDQpZZXMgaXQgZG9lcy4N
Cg0KQW5kIGFzIHlvdSBrZWVwIG9uIHJlZnVzaW5nIHRvIGFjdHVhbGx5IGZpeCB0aGUgYnVncyBw
b2ludGVkIG91dCBkdXJpbmcNCnJldmlldywgdGhpcyBlbnRpcmUgc2VyaWVzIGlzIE5BQ0tFRCwg
c2VlaW5nIGFzIHlvdSd2ZSBhbHNvIHJlcGVhdGVkbHkNCmZhaWxlZCB0byBhZGRyZXNzIGZlZWRi
YWNrIGZyb20gcHJldmlvdXMgcmV2aXNpb25zIG9uIG90aGVyIHBhdGNoZXMuDQoNCn5BbmRyZXcN
Cg==

