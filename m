Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2214B25DF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 13:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270499.464810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIV8l-0000I3-VJ; Fri, 11 Feb 2022 12:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270499.464810; Fri, 11 Feb 2022 12:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIV8l-0000EY-RH; Fri, 11 Feb 2022 12:35:07 +0000
Received: by outflank-mailman (input) for mailman id 270499;
 Fri, 11 Feb 2022 12:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5m1=S2=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nIV8l-0000ES-38
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 12:35:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0992670a-8b37-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 13:35:05 +0100 (CET)
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
X-Inumbo-ID: 0992670a-8b37-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644582905;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J3dx+gqoJ4Xol3x41MWi11wjGAaBeaeRcnsskeI9gzA=;
  b=ca9iZV39q7EOiDwdiUk8U9Z+HfNE9nC+7DIq+pH7uSkkrxeQY0i2F608
   uzMtYaO79okZmpFVeAGBdAeMAEOQrk2GeTJiZm0Xb/SnaVE2UgknkatwW
   R5sO3+SBuabm1Yk9juRGjfkL00YskclllNkYtC48FjhFWzYl9HOAoK4iC
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZyVWNUsjIyujTyo0j7ZVu0Q4zLC7BRZJiRW/lcvOhAoodTd0IU25RuHNKZT62TVsVJv1RV8z3P
 /pVADqLpAD0N6FYruhbJGcOT/bQix0f4gGNhRcg/CqIcaE+VjONTt/aimFxfkeG9jZbwhEvwrQ
 aiFZOEaAiXvrxP3PCu9OGmALnRiMc+e70trFF8xdFDGZIuNIx/jIQ6nuORqt9Xj3KZPPjhAHxz
 iJYVFw8fTU+nffk8cdk4njEHANvysTt2QIdpm0iBjkpaOwAspfJS+N1WYmX3NFVWIX1XjLKvDv
 59kv5zuP1hh7a8y+cVsCVJHk
X-SBRS: 5.1
X-MesageID: 63457667
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:M1/aLKzbnwJ5F36l3FB6t+fuwSrEfRIJ4+MujC+fZmUNrF6WrkUFm
 GcaXGHVaf6KN2r9ctAlaYW/9EgF65Ddm4BlHAZrqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4B+2
 MgOjaDzdSA4OIrMmrkUUytaCwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JsSQKmAO
 ZVxhTxHRTLyfwNEEHMuBp8XovmPi2DyVxFStwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZMVMpNUNUGqz2q26zz4wTED2g2TCZoPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPQ1
 JTjs5LAhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG0jfho2bZxZIGeBj
 KrvVeV5vs470JyCN/EfXm5MI55ykfiI+SrNCpg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DrGgPHmNrNJ7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4AOXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:RXdOM6loovlfNS/gzPQb+1xuvZLpDfO2imdD5ihNYBxZY6Wkfp
 iV7YkmPNrP+UgssHFJo6HkBEDyewKMyXcV2/hAAV7MZniehILFFvAA0WKm+UybJ8SczJ8U6U
 4DSdkHNDSYNzET5quXjmjZLz9j+qj9zEnBv5aT854Hd3APV0gU1XYeNu/tKDwQeOApP+taKH
 JBjvA37QaISDA7Ytm2DGQCRMjv4+TRkpjrewQLCnccmUSzZAeTmfHH+lWjr1Iju/wm+8ZqzY
 Bp+DaS2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzvMYLz394zzYELiID9e50wwdkaWK0hIHgd
 PMqxAvM4BY8HXKZFy4phPrxk3JzCsuw2WK8y7DvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqptsCw/aliiV3amSa/hTrDvonZMeq59Ls5Ufa/pZVFZpl/1ZwKqBKuZZIMr4gLpXZd
 WGQvusr4cLTbtdB0qp8FWHi+bcIkjbJS32M3TrYKSuonhrdUBCvgolLYQk7wg9HbIGOtp5Dr
 f/Q+ZVfEcndL5hUUpCbN1xMvde/QT2MGXx2OX4GyW4KEnSUEi99KIfpo9FoN1CSaZ4vqfasK
 6xIG9liQ==
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="63457667"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lccuYNlv1PqgR4LGdlLrj+jVgyWIflvd2fe45XATOzOHadHfj6f+UFxwPeiGaWg8HXxpfVAi31U2TUTkoRoYv5own5Yn8S5nd6E8VOAOXsJa9j6b4R2+r0r89ho14GkkRRSz8skkEhEgD/9mDs5BqjcsurWJYVUNS3W/kWcbQjNThDU1udeyTJCBlDd9YkzxGueh4FFIfJa65YHgEv629Dg9Z8XfHdh95YmXwraF9pgj4IinegElYe8cSb6Qzd6FCw8lH6FLPYSAC/HI55AxB5hlNP5/pfCY6cfh6zymhq+QdjY1FX18Jp1nuyj9XJH3vXIF1G5IX72aRBlZVNbJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3dx+gqoJ4Xol3x41MWi11wjGAaBeaeRcnsskeI9gzA=;
 b=FP2leeSZHcjJwdSoxBYmmxLHdy+SQzt6SEHhi1WZy9wcMDXXJNwtb+4b03LlkNY9AOEF67L04EQJjvwMkvg+oE9JVNfjhKUxVBkuj8nYpwnJ4oyHXhNta1pF3w5asItEHCha5ZEu56xvm+V+mU3TZTormTSfnsrIGA0Krslo8AGMFLi9vMC+ELZHioNcaioqNJq+b1oL6oXXw8g6VDUE4pJUok8EKVC3eoe3hqGlkbla/DvEAF7zZuRHZf9ijwwZYIU/NIyQjs0mDMm2190zAbdgRx1XtnQ1T9g8Vnzwguc7wHdrE3VfUwS6qGFpMUVUuqbRjpLObxRVBukN/fJGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3dx+gqoJ4Xol3x41MWi11wjGAaBeaeRcnsskeI9gzA=;
 b=qr4Lq2x2KQ4+PuBKYIsewb32hM93eE3hM0WE+zv1bJdyejO3jqDpxXmSG7h+OkBKCuTVoZFmxjkksidzI/Rs/HlEUaqVcdbsr58lz1+Px+haEfGBQ0NI7PKwkLqgdEFfh6Th1dQb36KJdQuRCJUULTWHlD+mtdtumDzJ01/TX5Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: fix VPBLENDMW with mask and memory operand
Thread-Topic: [PATCH] x86emul: fix VPBLENDMW with mask and memory operand
Thread-Index: AQHYHzffi/wD0570GUy0S5ifa6zkcKyOSRuA
Date: Fri, 11 Feb 2022 12:34:55 +0000
Message-ID: <fb11f488-edc3-3162-4d69-6e2ff6b52f9c@citrix.com>
References: <0d06eaa2-a9b4-5791-e26e-31db0a954827@suse.com>
In-Reply-To: <0d06eaa2-a9b4-5791-e26e-31db0a954827@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1e3bb2f-2d87-4bc4-d351-08d9ed5ae8df
x-ms-traffictypediagnostic: BLAPR03MB5457:EE_
x-microsoft-antispam-prvs: <BLAPR03MB545733054B5DE05A208163CBBA309@BLAPR03MB5457.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dtGl146/JibKuYxKORjZ5nJDHRG912nznF5oDcwyYwl56/+I+sYSnqcHOxqM3W/55/is3BjkNwt6B/lkJ9cMy0lIj85VYfyl34Ggbw/6GpDJaIgUNo0kPnE4227GC9moczwQI/xQE5kjzH/CW8cvhGEgpzz44zzXgj79NGbAKB0qJBzOFj6znhs+PLaNIOXHM6poq9OWPQq2TGysLJD4QbB4QAWwSSNi34hVhK7dFOrqaEv2WPQcVL4IhzUVk4wWMHC5kTYQIrTzAJyJRqU2TahV/7Jo1uRbCYXq1BUo3QwBsm+AofQbqFAWBxrkeBnIc5JxgIyKcV+VEan29mSVEWFRqM4MK2UFf3FNrcS4tOSpEO0OqMNozda+DySNU+Y0IN4vmLaUOdU+weKe4zU6uRY8ysUG2GxaQYYulMatw1dgirX7Amu7YbCZiaTe92WCD/b6zxS4iaNx6J5e29v4zAuoBFN9Hoa9XxX0wpSAfmTbW6QHFGX+bTgZ9p6qAkfmrFaJer+ts1Cx02mbPteIZFtqEiyGkB6pE2F/Gvs5qJgga4EhR28WAXufl2kU+sVT+DO7JO3+pgBKCrJw+c1MH2mlniUJDjeO4/4UHj00bDXwxSobyoxcHb+VHolzJ6w4XVv+TFCe8CJ5VYGf3Q+wSE6zaGttPzcYMKZ73/7K7R/bbdPPl+DkajkJcr54kO28FyLwjbJD/tWcVNH29ReSu2yARH73iPye5crH09uiJtTQdTEy3FmRYF9sPoJSAPig/T2ZAoM8upT+Os2U1vUoMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(316002)(8936002)(53546011)(4326008)(66556008)(8676002)(64756008)(66446008)(66476007)(110136005)(6512007)(6506007)(508600001)(31686004)(5660300002)(91956017)(54906003)(76116006)(86362001)(26005)(38100700002)(558084003)(38070700005)(6486002)(31696002)(36756003)(122000001)(82960400001)(2906002)(107886003)(71200400001)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mjk4cEMwcDdXajdPM0I1ZWJmUC9YSS9OVTkvckpncEJ5U05sUzN0VEhlKy9V?=
 =?utf-8?B?VElRRXpxU21uOWp5dHJ6N0xrMDRhRWx1ZERtQ1llNFEwQzUxWUlqRXo0TGpt?=
 =?utf-8?B?bW8vbStxSVR6dWRhemE0UElCUnpQWm01VVV6YWNMd1phZmRJc2ZlY2pmSXdO?=
 =?utf-8?B?ZGtaNXcya2ZZeFBraFJBLzFrUE1peTVDMysrb3VPS2c0RGRPTEpjdlRVMTR3?=
 =?utf-8?B?cDd5N3c5VVlmTmhWRm8zQkdVd3BiRDZaVnhzNzgxZElFbjlCdEFLMmxlQkFn?=
 =?utf-8?B?OVpzMWdtVFFROVVvUmkvRVc5Qk44RVlIekhpRVlQUzRiRDFlMVVSL3JianFS?=
 =?utf-8?B?V3VFdlNwWStCOVc3OVpuWTUzbkV1cnlUNlZLcWR2WXRsRU14RUQyS0RzUDh1?=
 =?utf-8?B?ZUgyYTRIQ0wzZUVDcStKUVBFQkFGMGFPaHVjYnBHRkd3KzI0M0dkMkdHZi9V?=
 =?utf-8?B?bWpuWk9CY2FBT0tRclFvRTdzcTNmZnFNYUNVSkoxUzgwblFjYzlCWnF6NkRu?=
 =?utf-8?B?d3I0NjlBZlJ2SlIyVkxYdGJNNUt2VHZYWnRFeTB0RkV2K3VHMlVzOXpNaU53?=
 =?utf-8?B?VTIxWHVuSldZdG5lMmlVamgxWTM3cStMdm5vUmdpNEpUcytvdDA0eTVCTTZk?=
 =?utf-8?B?bjR0KzBCRmtwQThrNEU1U2grTWFOd1hFNmsvbzZUaWRzV0h6ajNvalpGNmJ5?=
 =?utf-8?B?bjNVajlLNG1HbkxZQjUyTFU5UDlLblYyV0NmT29WcFVPMG9xNnNJTTduUVVk?=
 =?utf-8?B?WS9MZytiRFZCNEdGdVZFY284Sm0xWDRwSk1NMmRhNHM4ZTZhZXpBay9ETHA0?=
 =?utf-8?B?cno0K3l3NVpramFSWlRWa3M0MlJmb2hPSWJQNHY4ZG8zT1BsLzJJRmdLMVNN?=
 =?utf-8?B?MHNFd3Aydy91RW56OUl6ZUFaNmhtQ00yTXBqV3pQODdkaVlwYXdWeUNXdjA5?=
 =?utf-8?B?RTZEUTA2NERtWTNoMU1DYXEvRzI2aWFMemovSHFtT2l0TkFRNmtNVW9xa01i?=
 =?utf-8?B?SGlXTU8va3NKbXN2SFFSVHFsci9hM1k5M2Z6UVY5T2pxdlpVRDdGQks5dXhy?=
 =?utf-8?B?dmNRQWNKa0NHV2lJVnhTMmttUnZ2NUF1VHYyK3lBZmlMMVowaHp3eE5iKy95?=
 =?utf-8?B?Q3NsVXFDK1BQSmEzUDBhejQ2bVU1RkR2bHVXTFhjN0x1bnh2YzRXSGtxT05s?=
 =?utf-8?B?dGxFM25MNVZzMnRPbllXcmNRTHFXWFk0SExYeDIrNDhtUWc4eU0zdkppRVhK?=
 =?utf-8?B?ajBSVjcrbE9ITTQrbURSVVpDeXhzUzZKejhkTHJCMTdHU0xoVXVWb3VmUFVX?=
 =?utf-8?B?bkJvVzF3Vkk2WkJid3FOK3dEMjF2RGhYQi9IaXk1Y0UrVm5xbHNZUEVtWjNK?=
 =?utf-8?B?cURKUWc5QVp1MjVBenJLSG10SEovd1ZNVFdBUmdZMkxMQXNtNGp0MFMvTEJI?=
 =?utf-8?B?TDlFZGVPM09HbHFPSGI4QUYzUHJKYWxvVDBaSzF3WDQ2WW5LVnU5bm9wR1RJ?=
 =?utf-8?B?QU85OXdjQTRJenlHRlg3bmY0MXdDN2NRa1BjT3VOZlBKVmZpMUVjZ3hoeU5n?=
 =?utf-8?B?Q0tITUNwdGRDUUM5MGI1cktpWm84NSt0UFpVVW5UZ0tlbUJtWUhlakdzcXBB?=
 =?utf-8?B?WStCQmlTSFM3Uy9aQ1o0UmNrSEM5aS83dGVIWVhyNlNPWFdzZUdmZEYrVU1U?=
 =?utf-8?B?WEJpNWpMeStPck96cGhrR2drVFdqazcyVHZCdVRjZ1UxWmFPcmc5MDJRb09F?=
 =?utf-8?B?bDE5czU2VG45VkxKeUFKS0k2cGtJTFNJd05Ca3NoOU9MQXFDd1RXY0hIMk5I?=
 =?utf-8?B?ek5OY001clorcFNKTGNIK3N5Z2V2QldxVUVtVkJwQkNzMDVJOVRUemdVS013?=
 =?utf-8?B?THFvNGtZQllPZ2dzNU1zQ1djUzE1R0dEeGFaYlhxV1dDL29zWXJJQVFCUC9T?=
 =?utf-8?B?b1ZDK2x2cDZMSFZlbDRuN2tEZVhhdm5aRkxQekhUeGNBa0F5a1JCRVk3RXNH?=
 =?utf-8?B?cGMrekIrUWlvU2Q3dU1DNytVWlMxTjhEaVY5R093NURKMXRFZnlyT3l5dXZk?=
 =?utf-8?B?WHNkUWFleXZNY2g0dWZNNjhPVzJCeGFvQWxjVzhUS1UzZnpCRTJCNnNxY2lN?=
 =?utf-8?B?cG02ZzhNTVFKemVTT2FDZUhCdzV6TzZrSVFMMEkyNS9nT2kzWTMwOFN6d2Yx?=
 =?utf-8?B?bjlXZUptTEdSL3VrY1pmOHQ1UkpmN2k0cGd0ZWdaQy9Hbng3andvV25uUVN2?=
 =?utf-8?B?YjY3M1VaTXM1ZGZnanVOSmF4dDVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E8FD407BF47FA46954EFA50140EFC16@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e3bb2f-2d87-4bc4-d351-08d9ed5ae8df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 12:34:55.8208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ueRzf6HpESGvwEY3OhphCJyak0LkdJDK2mamZGzc1BAiNnJ39XW222i0ZdtXw0oDB379pK8y9/xPcvOx0edjpNy2HSlLPkZlX4sDxOy5HnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5457
X-OriginatorOrg: citrix.com

T24gMTEvMDIvMjAyMiAxMTowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEVsZW1lbnQgc2l6ZSBm
b3IgdGhpcyBvcGNvZGUgZGVwZW5kcyBvbiBFVkVYLlcsIG5vdCB0aGUgbG93IG9wY29kZSBiaXQu
DQo+IE1ha2UgdXNlIG9mIEFWWDUxMkJXIGJlaW5nIGEgcHJlcmVxIHRvIEFWWDUxMl9CSVRBTEcg
YW5kIG1vdmUgdGhlIGNhc2UNCj4gbGFiZWwgdGhlcmUsIGFkZGluZyBhbiBBVlg1MTJCVyBmZWF0
dXJlIGNoZWNrLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0K

