Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791703CB89A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 16:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157211.290179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4OdC-00028f-5F; Fri, 16 Jul 2021 14:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157211.290179; Fri, 16 Jul 2021 14:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4OdC-00026H-2B; Fri, 16 Jul 2021 14:15:58 +0000
Received: by outflank-mailman (input) for mailman id 157211;
 Fri, 16 Jul 2021 14:15:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3zi8=MI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m4Od9-00026B-PI
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 14:15:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54ae6786-e640-11eb-8984-12813bfff9fa;
 Fri, 16 Jul 2021 14:15:54 +0000 (UTC)
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
X-Inumbo-ID: 54ae6786-e640-11eb-8984-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626444954;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PK17LZNXOJT5wutGM9zoc1m++vdWh34pOmGfAOaZ8Zw=;
  b=GENWwFc6YJh0MF8/eSBcXcOybRdHoSAI8dCDTeDirTSxJbovLe61FZV6
   CcJj6KCFLrujDZqkcIIWoq3jkTk/bKTcybLVwTmUxlLSZSkFy43pnadbT
   bEh/FXJSNi2EX3vdRXYTnEfCvLvnWqtfIUgu43Gol8E/BPlvS9SW6SMpa
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bE6kt66LMfYa/WRigHPcLI17i+G1nT0rX84zHW3hO5TkSomAH7fQgXHwNWC8LWa6A2ePr5hBYJ
 FbaE5t8Hg3cCF4dCrih8Bytg4W7j085MxkMN28eZbwTppvpkGG0ZOSkqUIZUmkblrp27+3HKH5
 W3byEHZlmd66CkM5uxo2glqCKjYDLRyLvDRiBD9XWN1t+U4ze8rAVEinlEfCTA6P1EWuvlJJz3
 J7uDhDmw81hdXyqige4mcdFXgvFBADHVTZrqqpOmKKJqK18MEUB6YBOYDaQ4/gI53Vl3Fy+MyJ
 zxg=
X-SBRS: 5.1
X-MesageID: 50097002
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8nr0V62Fp6Dyg5I8jbj1sgqjBR5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHO1OkPMs1NaZLUXbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy+MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njOsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqg9jIDPr3OtiEmEESotu+aXvUkZ1REhkFznAib0idprD
 ALmWZnAy080QKJQoj/m2qQ5+Cp6kdQ11bSjXuVhmbip8viLQhKdvapw7gpPCcxonBQwu1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxEC3fLFuIYO5l7ZvtH+90a1waR7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm0UxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXp0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLuzNV1wg2fwqUCGLEbQI+1lluhEU4zHNc7W2He4OSETeuOb0oYiPvE=
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="50097002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0BusTKYztdyGIBDDDUPFVZRd3mepYonPMOykV65shtlyrrjoDs3OJlOHsFPK/z/VnNM3o7TkXyuAOsN05SQNZUT6qUqzkunhe6rNDYop5/lnz4yW7p4j39igeO1zpSgtZKwp92XrPSG+nidf1N0NRfkixKWoFYRLmmkCnOjVOK/UHrmPYCFziAu6van6YANBzyxn3oPzutKg/ZfDJxQgXuGzwRoWpEt61dD07Cq6LK7+1oDtM250nWst6M0IM2AGwlyf+bD6s3npDsWfmfUUseIjdjcnf0clCY/iHTxbbzvHygprncokMWm+YxpUzkRFt543ANkOPgykhxnFCxz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ+Q5EtAxnV48hN2u9N8RBoeZR0G3nzW8MVs4RnvMKo=;
 b=U6LopQiy5gD+wgKPy0DCiiBeoW32ZXKfL5UN9OZgqz1vTqL6oW0OufVX51gZ3cS6AQ7VllebU78voNNqM3zm7Gce8m9M+IHTNPrN6gc2VaOZeUB10cxHgAZURnpZzqjZjnJ5Mgw3LEDGZCgszYj8tMVNgCCISortbyu4UGEcS82nCmUJ+ZoS7DsGEawgxxuxlLWbryfN9Ni/D9SEnpU7degz/I7O9l/7Up4qKKWe3tZ/ESuoQY2j6aAD94lKLce1lOnEf+W28uezp/y7Vx6envqHTT+Ftjwl0XbuXA6aDWRlCfVWlIB2EpoaYnSSVPJDM5Z6Ap8KPgzk5tI+3aLRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ+Q5EtAxnV48hN2u9N8RBoeZR0G3nzW8MVs4RnvMKo=;
 b=qkucUSODFfGY6cl/Bj3tc8tL8+QVnxsN+HktO5iEow8FMcZmTprLtwbeNmB73V94IyH0S8zbbCSCYz+KRKJkZlcZ97qe0mitfM6V0MWeV3ZSoJ5mASyVtqsgmq95sqmigNvbpv62w77/tDmCxWdKGDRoMLhGIVgtolPy1mwJDYA=
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, "Paul
 Durrant" <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>, Alexandru Isaila
	<aisaila@bitdefender.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-9-dpsmith@apertussolutions.com>
 <2f9d2f66-563d-4e7d-4886-e4fabffebc78@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a03ae0eb-7ff9-99ac-2e94-d6af2100fada@citrix.com>
Date: Fri, 16 Jul 2021 15:15:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <2f9d2f66-563d-4e7d-4886-e4fabffebc78@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ba17243-4f59-4b21-063f-08d9486434e7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6391:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB639147083BE464E152B4D107BA119@SJ0PR03MB6391.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Abl9rExxkZpz2LPx/Bi6d6o8weXYn4wiuSjr4Oxyy2mYg/e9hDgsMRQiPqYUoB1IPrDAdD1gTzNBsHLcFfUMcOrk0ISkb+Cf8UY+27D6BYiOFJwTi+PVUkG05u2RF4vXZV5M/I3YLmg6z914L7MhAzoiKxxLDEiXnE9xAwv2x5Gq+tF3tba0VA2MjFbvFt6j89OGa/dxnW7fYfCs4Nnr/W6DXZBC2ojOLuBVCQaw4Uajtci9EERlLmm3GHRFHpE1NIqlrzI9C9RlzxSmDXO1IUDCkwN8tavCJjcpKkWLuzr8kr4CACyLK76dspptM8iZGp8O68iKJU6aUwLcSDpBi9ce+7rlTJ4ogFDF6YJk0arz/w2kgAqUJAiCqvDBjVu5573ycVcD4X/E2dXE/S1JcWItLajvI8BnoEJUI0apjAG4M1KdMO/sEx2gDNEIYj1I0/W4AxPVUIIvgz7IA4l2fljDhB8vr8pTkkJP4Urxucp6H9kq+iVXgDirJrgLxl+p9ZscYO317rh/aotUvXvIjK/gSkkFJMU069Bu7CHiYZtFwKUzTTvTz3iC/3SY2xD0LgDWM+3CMaiD7PZ32ABTK+yQf8FAToa5WewhZSU5krCUnitR2eAxqqH980XQ9IbNOqqDT9jR6Z35VXpzl7Z+4CgjUrtgDpgiKhATNV0Ji9eMAvM55sfNmBgBwrO60gm1HAQIiKMPD4+OpGQUl/83ZXeXlYiRYpBrtfHuez/ghG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(38100700002)(66556008)(66476007)(7416002)(2906002)(8676002)(6486002)(53546011)(107886003)(54906003)(186003)(8936002)(16576012)(110136005)(508600001)(6666004)(26005)(31696002)(956004)(4326008)(316002)(66946007)(2616005)(31686004)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUxnTU1XeWpaOTF1aHdiV29DMTdYNFAvaE9mMGxxTWZjY2tORFJRMkJUM1U1?=
 =?utf-8?B?a1pVTDM2MCtwemZVTVMyZUp0MldpYmQ1ckZpc2xDRzk3K3NxT1p0aDU0Q0wv?=
 =?utf-8?B?dXh0bkJVZjM1ZFJvbm03cVRaZWhYQmxmVEh3NUlEdHl1Z1kyYWJBWitlaHRX?=
 =?utf-8?B?VTFBSHFpYkxQMy81bzBWZHAxcDlwSm9ibW1oYm1ZUE9ZcWFkQys3MnRhbUFs?=
 =?utf-8?B?MEJtQy80NldQai9JQU9mcG1COE9NeE1DOTBhbWpVdThtbzc3MkgvQ0U3cERh?=
 =?utf-8?B?NFM1akdVU0pYOWhVSDJLV1VvdVVrT3dhU0tkVzRBMjZBSUpSck1yZWtkbjlX?=
 =?utf-8?B?dzdDcFJ4SG5laUo1NmliTjJUeUYzOFcxNlhzRVRLRy9oWitzMTFKME5jdFdk?=
 =?utf-8?B?NHJodTJwTXI3dzBRS2xJU3p0ckxvaFdDMTRjUGxOdVVBYkRwdHZBU2NraUVB?=
 =?utf-8?B?b3NJSVRtS3hHMUJrTXJhdENTUnEvVWZGb1Q5emlWM3hlTy8wbDB1bkhVMDY1?=
 =?utf-8?B?N2RCNFAyZU9RYWI0SzZMR0RQeHl1YWJWUmNoR1ZmUExWSkl3QXc5eXVEY0hU?=
 =?utf-8?B?T1VwWWtrVTRJWURGZzNFZXU4TWlyOXRycHBhMEpaeWpPc29icTc0Z2JkMjFm?=
 =?utf-8?B?OXUyd29zZlI5V2xjMGdlOTRkVXR3ekxIUWlpUUFRRWV5cVFmSE5lejdBWVRF?=
 =?utf-8?B?RCtvMTNhT3J2bk9yVjZtSGNWcENockpEUWgwQjNIb3RzVTZSQ0ZGZmhiYVdk?=
 =?utf-8?B?OHhxcGFmeTJxdFBrWnR1c09iemFwM1FhZTcwNHo4UW1tbVFYTzBHYmVKV3FQ?=
 =?utf-8?B?S3F0ZitFbWkrbWpQS3lWcnJJdVYzVys0K0NvaEFOeGJpME5ObG1HNFdOTW5T?=
 =?utf-8?B?eFFwR24yOGdYYm5VYXBvczgrMEU4NFMzWURFVGFGd3cwRGxNbW5ncURtbHc4?=
 =?utf-8?B?MS84WFRyMFAvZjVMV1VTZU1rZkRxTk5CUkc0TWhZVWtMQVpIZ08ra0tPUWFE?=
 =?utf-8?B?TVpKK21ndjFsUWNUeTZnVWRnOVpjRFFZL1Uzc094UkRxbXlncWFlUUFZMnpa?=
 =?utf-8?B?UDVWajNWZ2ZSN1kxNmdYZWtLUEp0V3l2bkZ6WVNWeWFzSVA5azBDaytZOGpq?=
 =?utf-8?B?cmo2b0RMODdPVDFwUFZDQXI2Tzh2WndSaFJ1TkpvWnJvMWtHNGdtcWJWUkxT?=
 =?utf-8?B?YzNoVm1ra2U4a1pZL2ZDNitTTVFOUGtIWEYraGc3M3Nja0ZaYTRCNVdHUlV1?=
 =?utf-8?B?Vms1SFRaQm1naEJiTzJhMHdIR3dod2FzUkVCK3Y3R1lsQVhtbnlqWnAxQVFw?=
 =?utf-8?B?SE1vODhGSXVuVUlhWDlZVEJoSTNjalhUM1NOM3A1ZU4vVWtsS3Q4VVlxSGxz?=
 =?utf-8?B?OFJ1NlZzOU9tZnZaZHQ3QUhXTWdTbWp2TThhTHdZcUpLNEJTZ0VzUWtXQ21n?=
 =?utf-8?B?cGhXLzc4ZEhQVlBDaWRzZVhicGJJS291Q1Q1dFBQWElHZjBzVnc5ZHJkY0Mv?=
 =?utf-8?B?Y3JXU1RqQk94amtGNnYrSlBJS3lJSzBReXJjSmhhNzNJbFVVZk1BMHZnNUxy?=
 =?utf-8?B?MGFrcHRPenlibFVTV3BBWHVwVEhTOXZDa0thOFl3MGpvSmY0dHppOFNtTUtZ?=
 =?utf-8?B?U1FidTc5NVAwQWk1UTlXTUpqcGV3ZEJEVEZ5anFqVk1LQlQ3bVprMUFXbG9N?=
 =?utf-8?B?K1B6dHVrMjRsaXRpWC9NUUpqcWRpbUlVRG4wU2orcVBBY0xocUo4WnNLVU13?=
 =?utf-8?Q?0GQ1mrnTjuCl7G92qM44h2qica4LEl0uthKdav2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba17243-4f59-4b21-063f-08d9486434e7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:15:47.3269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDmkbiiTYQzQ4EU5aljqI8VWImn93HNt3J6mCPcBI1Tlasw2l8ml8x3GQJTnsq5eKJKdjSqbRflLorge+y8TBkngcvqDF7YX4o4UB4Zd5OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6391
X-OriginatorOrg: citrix.com

On 16/07/2021 08:23, Jan Beulich wrote:
> On 12.07.2021 22:32, Daniel P. Smith wrote:
>> The passing of an xsm_default_t at each of the xsm hook call sites
>> served different functions depending on whether XSM was enabled or not.
>> When XSM was not enabled it attempted to function as a link-time check
>> that declared default action at the call site matched the default
>> declared action for that hook in the dummy policy. When XSM was enabled,
>> it would just drop the  parameter.
>>
>> The removal of these values is two fold. They are a redundancy that
>> provides little context, especially when the value is XSM_OTHER.
> For XSM_OTHER I may agree, but in general I find the call-site uses
> helpful to know at least the rough level of intended restriction.
> E.g. ...
>
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -1376,7 +1376,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>>      struct xen_mc_msrinject *mc_msrinject;
>>      struct xen_mc_mceinject *mc_mceinject;
>>  
>> -    ret = xsm_do_mca(XSM_PRIV);
>> +    ret = xsm_do_mca();
> ... to now understand what this enforces (or not) I have to go to
> the actual implementation, even if I only want to know the trivial
> dummy incarnation of it. This effectively extends the "provides
> little context" from XSM_OTHER to all hooks.

The old scheme was even worse because it was only a plausible
approximation for the !XSM case while being actively wrong for SILO and
FLASK.

Furthermore, someone reading the code could be forgiven for thinking
that XSM_HOOK was something other than dead code.

~Andrew

