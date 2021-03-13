Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F80339D14
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 09:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97475.185196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKzt3-0004sz-Mo; Sat, 13 Mar 2021 08:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97475.185196; Sat, 13 Mar 2021 08:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKzt3-0004sa-J4; Sat, 13 Mar 2021 08:44:41 +0000
Received: by outflank-mailman (input) for mailman id 97475;
 Sat, 13 Mar 2021 08:44:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJcc=IL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKzt2-0004sV-8S
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 08:44:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d2afef5-4a8e-44ea-8290-b61de988a5eb;
 Sat, 13 Mar 2021 08:44:39 +0000 (UTC)
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
X-Inumbo-ID: 1d2afef5-4a8e-44ea-8290-b61de988a5eb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615625079;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QFR2kyZVjCh2iexxa0C1/EGEdKvvkrBkNB7ZjaBZgi0=;
  b=BMmSicOa1a6aRF84UMRVpFrMw3m4maSCneNC2g/3Uaa0ui1l6qbXKyVQ
   HagnGnX95ZVIec9WuTC9Yce5rZOL9qSjchuh9v9M39Fv8zUMOR9CAPGHY
   8wri4XsLuJvIAHVuq0OwuOHjnTdbpaawXJAuxXVhWaTl0xKZ3jYH9sRAv
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CLSdWHelAeFByVaj6N03MWwQMSErfydwk1jaNa2kP7BlDcnsUKNMv7hevfeFDB7fmkQ7sGXMjD
 rmvlGBP1YFusFOXE0AfdtdfxSFXFjjud/x7LEh/LzTxsgmHcxlEpjzaUHY2AHDTe1/h1mGVHCz
 m3vjLR6LeQKv6ScZKsS7ssX6OdfOaQ9qhS3fFl4+msuJyW7HXDrEu5SMadmB9ORLwAMmLSRGV1
 IUA19qOTDwTvr2hhWw4B1bPcA+ELDQj7vzfSfph3g8YEtVpBA4+TySNkClCX3Uf1HTCA6iYk7b
 35I=
X-SBRS: 5.2
X-MesageID: 39386805
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cMVGQ6jCbPDzK4agLzQOTWqLrHBQXkAji2hD6mlwRA09T+Wzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFg7U5F7GkQQXgpS+UPJhvhLGSoAHINg/f0qpm1a
 lme7VjE9GYNzNHpOvz/QXQKbcd6fad9qTAv4jj5lNMaS0vVK169Qd+DW+gfnFeYAVdH5I2GN
 69y6N81l+dUE8aZMi6GXUJNtKrz7enqLvdfRUECxQ7gTPvsRqU7tfBfSSw71M5SDNAwbAr9E
 DfiAzn7qCfs/W2oyWss1Pu0w==
X-IronPort-AV: E=Sophos;i="5.81,245,1610427600"; 
   d="scan'208";a="39386805"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XANrLHQzVV3kO+aNy4eOUROWfgq34cPhnAgXYqMLGNXeDVmqa0sBifb8hKx9wO+R+e8wtLfGb9kzZkYXUeyLlb3RcFcz5K0NAC3tN4C5J0Ti/MlCXyJBg+cASOKAy1sR1iWMxg9zVeJuclmYCkqzytDZ+nrlCSvQ5+PdUnKe+aNCmObX5FrDfDoNyTiyBhQa/Gs0NN59wDuUD4o/M9m5nz07rBHvgSaU68e2/fx3rcqirWp8Qz4XSgDmNpvrbRB+LsPjsBafU1sxpeatyKZ8UGiY/Wd67hwzb2e6q+NNWn0ET/4E5fkGk6/rJ2n6hmmNHUf318qNNxZYNGe28E7pRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dpyw74+07y/GB/ZGjhqnPscJ4yNC8UEefYTbR5KBPQ=;
 b=AmJ9z8LMZ7O1T64Sn5o7ZZ0wxjKoOo3lOXH/yvc3eQB/f9tUA0NOVkcvTxELyJbZosZStHZjqPXf54mAnzjkDTosyR+iZEQrQnQEvLfzWK+Zk/SMPLe2qnXly+VL4UvN31cwi7o7+yOfutXgP8v/hbmWkfEFu7AcWzf5Wtq5XBUOdA8j9kIcCRU7rmwcg1/R0v3ipk6hqZmZ4txKsAKHvpdwVZ/nFdDoW/rh7KAKIEV6u0kBwjYtbnkn5x12vfseWwobGRcmFIap0fG/7eVGNJRwvg5oFTkF5Kg2uSsz/fmjmG2iVX5fwSlH6WQZvINjATw7ghKw4VrkaCIIM8vUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dpyw74+07y/GB/ZGjhqnPscJ4yNC8UEefYTbR5KBPQ=;
 b=S4gTmSuAY6jjZ9LqEOWv64//KsQdVnjKN29vKdLq7HhT4z+d+rlIyD+a/7/dor6iODx3sXYRvxvBQ218xho1Scw+VQmq2BGcAgI+BgBJg3Qhw86NIo6dvpC4v/01Pmh6o+gLkmxcvO3o0EA4QaA+hKPeHPu5cwnSI0xb3kWHoak=
Date: Sat, 13 Mar 2021 09:44:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <cardoe@cardoe.com>, <andrew.cooper3@citrix.com>, <wl@xen.org>,
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] automation: add arm32 cross-build tests for Xen
Message-ID: <YEx7VdoUAqkz4epN@Air-de-Roger>
References: <20210213013813.30114-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210213013813.30114-1-sstabellini@kernel.org>
X-ClientProxiedBy: MRXP264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1f7bdb4-bb14-4c04-8106-08d8e5fc2be4
X-MS-TrafficTypeDiagnostic: DM5PR03MB2636:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2636837072247B9ECD6979198F6E9@DM5PR03MB2636.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9BWXrCYuVSURHzJihIfv/YoIx1P+up3l1vl1BE0urLN9RVbreapxvxBnLSfSFrxpicajjnRgFSWgjmhuavkpjvgDfacMdvwIDXYyvpMIWgUhcPKkAYtxe6+PVJkd6BjeMLK0TQsn7wInAcfIoaR/K5za16sytWFDzwbk3Flc88U9bAu/D72YI3LHehcCn11F7xCluVRuumRV1IqMfECOzgF3Ll4RqeGdYndPLbpM96/vDZwVX46xS0RAKz0LkpmMeFIqYh8iY+50OMongQR8tz1G3trgqwBjmPTkPsDISCeoIdULTdlfI28rBwkr9NBQNzSzv5eNpuRgbuuuYaXUEA0fLwENEaDNwhdQMsULjEeDpoMQToyY1is+I6CQb3Qsb7MyjAaOCiqjXFr3dikAXNcPdC6+1cFD1fxnz0y+2+crVkpaFqjlqO6Zq79ul3RYQ1clCd9j75mKmTRInK0UTP6YO1txVHykXgPnRkV20nf5+zDax+MHT3i/SmbdsC8hiF6RkEcWQx9wEN+CMnAEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(346002)(136003)(376002)(39860400002)(6496006)(8676002)(86362001)(5660300002)(16526019)(66556008)(9686003)(66946007)(66476007)(26005)(6666004)(4326008)(2906002)(316002)(85182001)(6916009)(4744005)(6486002)(478600001)(8936002)(186003)(83380400001)(33716001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?blhjM21uYlNWODJSNTZodU1QZHRLOXhObzRIY2FkNUJKbUJZK09rMDhjcXJz?=
 =?utf-8?B?M3NTYk5rb2FNZ1ZLdFg4RS9vUC9yZWsvY0JRMzJVUWxCT2RVb2FwbjhSZjlx?=
 =?utf-8?B?eVQ1THEvZEV6dFVQeHhHN1YzcmVuYWp0Zk5WSTZWRHZNZWtBVWNYbTc0T3l1?=
 =?utf-8?B?WmNURGpUc09UYnZvK3VYVEFTamY0MFpEK3ZscFIxaWlkS1liSmhYNTYxNUwx?=
 =?utf-8?B?ZStnc3ZuSjkybjRZZitZc0RJajROVEMrUUJjUGxURWFZRE80dXVrN1cxd01E?=
 =?utf-8?B?QkF3MjFUdWhqY2Nldno1VEtmWWJaS1V6VkJCZEJRR2pWb05FQWVqZDgzSENx?=
 =?utf-8?B?V3B4MzR5ZkNyZ045RUN2QVByQ1BmVXgrSStHN2U5bUhoMGx3V2Y0cE12VkJn?=
 =?utf-8?B?cEFnYkpNNFdDZVhKeTQvcGZPMFdDVmFOZ04rK2VYc3lGMW1iN0s1L2dQVWUy?=
 =?utf-8?B?amtUVFBKR21zM25ha1N1d2JFVHRYNjdJUlNwMUxlLzFZUnUxdTZYaFowZWdy?=
 =?utf-8?B?NFJuZFdaQk5EbE1WWmRHeUtLZkZCN3l3ME1tRjlGc3dZMUJyZFRrdmJUTThQ?=
 =?utf-8?B?SGgvSnR6bWxrbkhRTGJTQWNMN2VkY1ptK2ViMEtQTGRDVXFMMDgzRmRrdm9V?=
 =?utf-8?B?Z0tTZVAxNG83RzVxb0VsQXJ2ZTRNdjdqdlJacDF5QnlFd2xDaXlIMlNKUEd0?=
 =?utf-8?B?ZXJuejR0RmN6TEQxNnNwcXpYRWw1OFZlL0NTTnNqTEJjMWhnTVRiVGVEVTBm?=
 =?utf-8?B?SHlyUEhFRUNpL1lJVkhhNVpXdVFrR3FlLy90R1FTbXFFd0kwUDd1SEJNaGFm?=
 =?utf-8?B?elRmL081dllhTkJxU3BTQTUzdE1vTEowaXJHVm5TOW0xT1B2d2N3UXV2aEZP?=
 =?utf-8?B?eGd1d2M3YU1pVWJoc1lKTzA4WUtacFJ5Y3ZLQTlZS1BmVjU1VUc4aGJmT0l0?=
 =?utf-8?B?VldGdWliaDAvaWpya2UzU0FjOC9pRGY3YzJjdGxiZURDRTkwTHd4UUk1d3Zq?=
 =?utf-8?B?K0gzb3o4SFBVd1gyZGRpN1FEMFk0K2YzWkMrYXhyV3ZMOEVDTldQRkVGQnVv?=
 =?utf-8?B?NElrL3lpamIrMnNmQ0RXaFlPSElVQWQ1SXRuczVqUVZFY1JGeTlmZ295Sk1r?=
 =?utf-8?B?UXN5cnJwOFNqSGxxUG4wV0M2S3RVMHNBekp1Z0szc0dTeWZpUTRuK1N0V0hZ?=
 =?utf-8?B?YzQvL2F3WG15RTJ3Y0wxSEtaRWFFbHNmTFNzeUw4dG8yV0dVWmpmUW9KZkpq?=
 =?utf-8?B?Um9zd3ZoRnFaQVErMEZsUkpvaFJsL1NxK2xFK3Z4SU00aTcyMGJSbkJYWlp1?=
 =?utf-8?B?cnlDelU2Y2dTQTJkdVliZ1hRNjdIanNacWozYTkxR3dRcHlpb1YxME1BK0hY?=
 =?utf-8?B?ZzRKTHVVUGxVdE9pM1kyVVZsckl0Q29YRTczY2hNT29WZlZwQURjNHVQUlAz?=
 =?utf-8?B?MXFwdko4ODhBcVMxRkFZK3FscWtEcU9xajZDd2ZzZzluNFcvY3FhQjk2YmFz?=
 =?utf-8?B?UjgwUWxWNlVkb2tBeGllVkE4ZE1sTDRMMEJEdXY4Z0xIRFpVOFdBTXI4N2lk?=
 =?utf-8?B?YVVPQ2NQSlpTQmZXRnRDU0tnekR1NzVuWXpCdWtNU2NCbFZENGZCNVpXMkN4?=
 =?utf-8?B?VW1rRlgwRHAvaG9hUnZNQnVrYVZWSUl4TzB3MkJIeXpCUTUyUkkycUFZYmZq?=
 =?utf-8?B?TVZtbzRzWDRvemdDOCs5VG0zNDluZlhCaW0rRWhxREx6QnVuSE4xV1Rka0o1?=
 =?utf-8?Q?y63RBPMlWeWoSyzGByUYWBevJk3ak0sBv25Ey/I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f7bdb4-bb14-4c04-8106-08d8e5fc2be4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 08:44:10.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCYmExOVt3y7MzeUlEH0BofZ5HpnfsDaEXBCSCfJ/5WOUqEETlLr919ZTTBhBlwZDNxc3Ng3kqkjC/R9khIwcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2636
X-OriginatorOrg: citrix.com

On Fri, Feb 12, 2021 at 05:38:13PM -0800, Stefano Stabellini wrote:
> diff --git a/automation/scripts/build b/automation/scripts/build
> index d8990c3bf4..e7d68f7a9d 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -15,6 +15,15 @@ else
>      make -j$(nproc) -C xen defconfig
>  fi
>  
> +# arm32 only cross-compiles the hypervisor
> +if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
> +    make -j$(nproc) xen
> +    cp xen/.config xen-config
> +    mkdir binaries
> +    cp xen/xen binaries/xen
> +    exit 0
> +fi

You will have to rebase on top of 893103e286ac1c50 at which point you
have an option to do hypervisor only builds already (hypervisor_only).

Thanks, Roger.

