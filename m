Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B13ACA7F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144539.266028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luD7P-0000zz-I1; Fri, 18 Jun 2021 11:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144539.266028; Fri, 18 Jun 2021 11:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luD7P-0000xr-Dt; Fri, 18 Jun 2021 11:57:03 +0000
Received: by outflank-mailman (input) for mailman id 144539;
 Fri, 18 Jun 2021 11:57:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luD7O-0000xl-MK
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:57:02 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6904aebe-1af4-4bed-ba27-f822fa9ebf41;
 Fri, 18 Jun 2021 11:57:01 +0000 (UTC)
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
X-Inumbo-ID: 6904aebe-1af4-4bed-ba27-f822fa9ebf41
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624017420;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y040EGOwykctMb8o9I1ugJ3UNTPDDw/PYoHjD6E3QOc=;
  b=CattnuRXiRBZnFcqbFZ0Bu+esAI+cVExBdDRNQPWqYFC/Md5X7Mpy8IS
   NWoK8p77XCqQjilK4BvjdCqTd2bWcvLoxsTItPKPzi+J6J4GmkbYStH3j
   N0Va+EiI2YJXnBHIr42upm8xGZogeH3x/+2v5VYwcNEYP8tGxPU81oX46
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9CZXDN+S+M4UmOrc01TaHn3qBgnhVko5I6txtEhiFuxS0D/co+B2TOrzPa3sRYEEL4rRoHai3y
 dMo5/9h0GItT0NXYlSHoLK24zQJz3voB8xMK9kV2tgRnF1Q/V/nM59Dd6W2W2zCXwv4AGRG33r
 XydK1gAT3ELpobUuumrV0WvCqreAw/iCchu6IPmFGeWGnupH/pecrokNi2ls7inCuhEzoTrR1C
 lvPbpUMLk6cKbFIu+ChaMv181CHa2tawg2AvrnqEFjkD/oBVyLbwC6uhig91dr4AvH6i74W/+B
 FaI=
X-SBRS: 5.1
X-MesageID: 46523081
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jHANH6H+8ySdp7/ipLqFZJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdsZJkh8erwXJVoMkmsiqKdgLNhc4tKOTOGhILGFvAb0WKP+UyDJ8S6zJ8h6U
 4CSdk+NDSTNykAsS+S2mDReLxMoKjlzEnrv5al854Ed3AwV0gK1XYfNu/vKDwOeOAwP+teKH
 Pz3LsjmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgHfIBej8AreSIrCNWgH4oN69PJkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5weJSFcZ4KUuZkZkIMEjgX5q3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369Mwc/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MF7x2aKpUBza/YQ8SgXwQrLMkcAIDdCRCdU1JcEJ6e
 b8uXtjxBoPkmzVeL6z4KE=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46523081"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4yIpMhUeTh47k36bQpq4hU3DlWw5vbIhe0J6R/UQUocYRgwcyFVuz9FxJ7ndbR6ZJ1hSaebqaQJ10ycB3+V+i26brDJWaCDN+2M9PM5cqKQ5emiWE59i7D6+bN+19KqndGcEMttvdIYopYMjKBdIR7LnpyrV91YyKZXwXK7wGykaDDGC2+34ZSm3LdToBgUEryg32sd3PNLJzajeo+cR9qj86GK6w4lE3Y/nrbbYbvOmwOUYMoA6MHXPkWoNKPZW74ihfUtMIsOryR+37di1yFJEiQw0f3RgD+klFtuXNOYK9OtXlUlVvZ1tDdDzslCKQ6B8gglYgoXkGzBD0lbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y040EGOwykctMb8o9I1ugJ3UNTPDDw/PYoHjD6E3QOc=;
 b=Uf5LsJvSMMpP2RMyIADhxeAXxSgi1bFy+/78nNS+znUKF2YfJ42DJZ6l72bgef5V6RkDbbeuyoTcjHeZtIIixNe8C6zhbrDhUZ88yJQIV980UNGLQLEtcuFwKtGX+rr8dXQrBguSSgjq+RPSD2MwMF00Bglz+D62VyQvucazs18fSlJMjXqGqKnVuABnxdQtjywf+qiWj++OGNDS3l2+/Q4i6ylxt8pO8AA7pC+hxs32/hKYiiIZO26PpBIcGCIm1YAoOQQbJyOoFM6bwgJnfCnoZrAYOZtCjzYinLU2y70aSLFgiC4Y9O/FjTuzXkHnAM+PMxglDew1E/vFOkHFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y040EGOwykctMb8o9I1ugJ3UNTPDDw/PYoHjD6E3QOc=;
 b=LStPGGUk+LOlFbWVV4ov9rPa+d7FXq6EkyNLZvcpj7D1Sck1qF0bZ/2TzyV36clMBsbxw1ipLmI7mxkqVjxO7hPDtjN2vqm1hMNykmZ3/QfOIrBOaZYysoN5+zrZnH0pVwqaB9beRQ4G61lSmLAOsT3rbzY/XiBcarH3Az06aiU=
Subject: Re: [PATCH 4/6] xsm: remove xen_defualt_t from hook definitions
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-5-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f18aa77f-e2ed-aa10-37d3-2cdbcd5645eb@citrix.com>
Date: Fri, 18 Jun 2021 12:56:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617233918.10095-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fff40d1-9b88-417e-5d7e-08d932502a2b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5156:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB51564E8D1F6A52A9DA83A345BA0D9@BY5PR03MB5156.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q39nSVaX86m0HPhgOXmV56uBKwLzlbZ6jJ4abiKU7x5MtK2XnhFflN+Hn/qAUMFZGflhlbPBcUBoJjYSK+xKu+b3S4m6q6x+4DAMFFi4f5u5T6CdNQ/UNLz63LbvEmJ49Djf/L+K6wzEgvJRqR6G11gQkH2JGocTj7cbeXVtLei6vP4itkKoA7vaeEbQKLZnz7DLMF6bkLlOsTnGVw1RsXKGteuTLGRgRM3LRVeIFPAQSaFA6O3cuRDl5D7ZH+zdgE6h5MZaq2IZCR9BQHA0VYW4xstilLS9Y7HH35N2oVbNyNOnxTIO/IDbOf2dLDgdMVch7wuja9vMHdmqZIrgjFZ7EzJIeCDSDSPMCqMZdwxryiUECanEg1pw+WU0q+PpzaF5hPtHo309cLOkD4gfegkMKbAxMYpnI2D6bT1J93JUGKt1iqMlM1pxv7pPdJDMD11nrxO6geGpQ6BbjBqJYlyBfhXWHjJLaOCvMcMbvOwQ6ex1QgXYrdVMjdDRYDohKyQ80vFjm3qJi7CJ6UI426HJ1g479Cpqqo8GXDFlANGHs042dSgn1JtBLw9v54hWahHMiINa0FJsjeoqdZh58hrbM0PVB8Q7O2ftS6KrJRuCKxduLGDZErb37vGAeO7kMhsKJsE8djf7Pmb9CUTEqME4yfS4brP6abqtwYcBktfP/ilj3d7l9pLbDUpPQ8Oh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(956004)(38100700002)(6486002)(478600001)(2616005)(5660300002)(4326008)(16576012)(31696002)(36756003)(316002)(86362001)(4744005)(54906003)(6666004)(66946007)(16526019)(186003)(8676002)(8936002)(2906002)(31686004)(66476007)(66556008)(26005)(53546011)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0o1T04zcS96cEFhd3V2bzRuaTNTMWhVSm1KYm5XT0pGRnBQaHMvTDk1RXpl?=
 =?utf-8?B?VzYvRk1WOHc1bGpFbjFZZzRBbXp1Uk5aVVFsRHpRQ0RweVd6SFNIcFJxZWtl?=
 =?utf-8?B?amRGUWpITlMzZW9NcnZzMDNxckdSWEFlK1Rtbi80QjVWWVcrTUxGbFU0LzFj?=
 =?utf-8?B?eFZLWERaUUVWWkdIT2o2RzFOUkFQNmFWcFd6QzFiTE16MEdoN242c0t0bGFV?=
 =?utf-8?B?bmNZQ1lpdGR5cVVveGJ0eXI2c1BORkZGZGlCZ1lZWEpsZC9sdTFlYlFxNWNq?=
 =?utf-8?B?VW8zUHI3MENDTVZ4bFozVnVIeVA2YWYrR3JsMExNeUNzd1ZKM3dRam1VL3Ju?=
 =?utf-8?B?WWhvUDRqQXBuZE04OVlBV3pGem1vcFF2ZW5BcXk1UDlma3MrNCtXYUdkTmdN?=
 =?utf-8?B?MEVSd1owOFJkTVRKdThFUU9HbVNWUTJhbEU3WUpqd21UMFZRc2FwRUVnOUJZ?=
 =?utf-8?B?WEJVSjJNY3NJVS9UTGt1WEkzSVVPL1FnRVZZNzcvMDBxNzU5L3FHZ3ZaNVJZ?=
 =?utf-8?B?MmtNZVk0Z2hvQnNGbTJ3ZzErSjVRNWtGKzR1ZzNlNVNmMU84emNmenVVeUVs?=
 =?utf-8?B?UmN3T1BEa0VJeXhHbUtvUHprbWFmcERCYnZtUEtjNkFTdWI4SFYySEZ6VGRG?=
 =?utf-8?B?TmFlQ2c3WU9HMkJ4MG1hTlNhbXRNcmx1OVVNQmcrWDY4c1BZMXZRVzlDSEhM?=
 =?utf-8?B?NVNPZTF4alNoTUpnSllac0RaSlpMSUpwTzd3YWxhaXBGcWFDbVMxMGR1eDA4?=
 =?utf-8?B?Y0dxYnJRUDFMVlYyVTkrS2IwS0ZLckRza2pVYlZXc3U1RGJQaHdPUjhBN1lP?=
 =?utf-8?B?eld6ejFjUCtidVRrNVE2VUdiZXlXOG0wYmxJdCs2RXozc0Y1b2U1K292WDZR?=
 =?utf-8?B?TlQ1STJ3NDVReUo3SGFOdFNoVHBQVEZScnczNXpRRFdvNjBzcnl2MzZsMU5v?=
 =?utf-8?B?bUVzcmkwQUdpTEJrek9HbTdQQ2tEYUJHYlVNeTZpTm1sbS9DMXpOUEFjMzZN?=
 =?utf-8?B?ZVRqTGNpVnBKU1pzZUcyVjRnYTAvRTVsckNmZkRHR1BKZVlOOCtpZDZ6RFFQ?=
 =?utf-8?B?TGdYenppUjZlWmlCaHlhb1cvTHFxS2ZWT3p3am51VGtqK0svRzI5MmtpY0xO?=
 =?utf-8?B?Nnh1azRmRkVFQndFc3B3dXY3VitPSEZpMW1Tb1VSOWt0OFFBeVJ2OUE2VnY4?=
 =?utf-8?B?QTdjNlNpNllWK2VGRnBwUWsrWCt6dVc1TGp4YXlaVnFURCtCbnBxcnpZWlpj?=
 =?utf-8?B?b1M5NlB3ZjVtNThSQ1FvMUw4amFnVnVkM05waDFHOG80UlpMSW1DS2w1ZHVz?=
 =?utf-8?B?UWFsTmFubHhoL1NOaitpZGhkODdqRUdFTHRFenhtdTByWEdkZFhvYjVwSXZv?=
 =?utf-8?B?ZTFPZkp5MmVNdXdDcWhWVGhrVnN5OFNkMnBNSENjVytIV0prdFJUM21FdFZv?=
 =?utf-8?B?TElzRU1ZajVkQ3FGR3UzeXJYOFl4VVBXNmNsOW5nZU5vd0hxTkVKbzEvRTV3?=
 =?utf-8?B?bGlrTFNsaFcweHFMQXlpTFQxVUZQYTUzV1NTYjgwU3l3RllyeHM5WnhSbEl6?=
 =?utf-8?B?QWRvanpCeDdVRVdTNHVXQ1YyMlk2MDhhalgvcFhXRTBvTmhPVzZIVVFxOGlj?=
 =?utf-8?B?MHlFaVJzcndoa3Z4bXhRMkkwUWZMYXgyb2ozUFMwL0tIaWRKUFdnZDFZMmlT?=
 =?utf-8?B?enllZ3lsL210akJxcXNRZCtRSVpSUjFxeWhoSko3bXJJbHpwTlhtR2pQMjNu?=
 =?utf-8?Q?EH+p6nRitG4ou2f7ihZe/rU75cJK1Hhb10mJtFB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fff40d1-9b88-417e-5d7e-08d932502a2b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 11:56:53.8242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6asgGbIqMLfoBJfRKdciEJ8xPQTFp/rp30csbgP6PG4Esqw7aSpeZj/+7dLdDWbpsgHWypltvamdvO6/S6Il1D5J0k135LHTIrvZ8dMHQAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5156
X-OriginatorOrg: citrix.com

On 18/06/2021 00:39, Daniel P. Smith wrote:
> With the conversion of making XSM always enabled even the dummy XSM module is
> being invoked through the xsm_ops dispatch which does not use passing of the
> default privilege. This commit removes the xen_default_t parameter from the hook
> definitions and all the respective call sites.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

I'm struggling to parse the first sentence.  Also, there's a typo in the
subject.

~Andrew

