Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A11B36F865
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 12:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120445.227775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQGq-0003uz-O7; Fri, 30 Apr 2021 10:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120445.227775; Fri, 30 Apr 2021 10:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQGq-0003uB-L7; Fri, 30 Apr 2021 10:21:16 +0000
Received: by outflank-mailman (input) for mailman id 120445;
 Fri, 30 Apr 2021 10:21:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3Ge=J3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lcQGp-0003u6-SI
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 10:21:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9303086d-0983-453f-b684-787bdecbcaf6;
 Fri, 30 Apr 2021 10:21:14 +0000 (UTC)
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
X-Inumbo-ID: 9303086d-0983-453f-b684-787bdecbcaf6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619778074;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3qG1r8IKNOHWEo2AUdz9t2JT3SVHVh7z/z7DVAUYODY=;
  b=P/JKCLZXt4J/FUkKJlBSZusGx+FdLXuuMzzGAehNbMpTDz4C16ScWgcA
   Oj20eavk58ceqI9RyBOLpQidYNm8mtvnCJlgyyrhXNI9rVArDzAe5f2+3
   Du+NdcI7Ag4RlSrotMii64usNNDClV/tX9kI6CL5iazSmPo8DdcEcviGp
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OAJuauWU7ilbsg2V85uK26ZONHtUW8gi5z7i+Zo4OeLNhfqofNffN1gOTdKaab5bUy7YTvXy/V
 rM1lhnE+KLQTGA2JBbdWixSmQ5kWbqHWL02JRgO7V/OU/HDb9/5A/ru6EbgDz4VMoLj5ODd/Uc
 iibLmLj5aiwMbMaf9ccMiXXn9t+PY43NLwGCYQLe4oQe+ODpnKI5YYDYQU8sJeFYYwBI9TAZXS
 ZQBCuct7A17FSxGhJLX/7fqdE3DO+MTwX8rSzF24uJZDqPPTNDhC2OQtPI9qpeQyc0cjLGTp43
 i/Y=
X-SBRS: 5.1
X-MesageID: 43171819
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:46mWsqpwup6/zDXE9C36FqIaV5szL9V00zAX/kB9WHVpW+SFis
 brpugR0R/olTodMUtQ4eyoEq+GXH/a6NpJ+oEXJ7ivR03Lv2GvIYFk4+LZslndMgf58fNQ0r
 olTrhmBLTLfD1HpOvZwC39PNYk3dWdmZrDuc7y7VdICTtrZaZp8htjBm+gf3FeaQFaCfMCeK
 a0ydFAo1ObFkg/SuSeKj07U/PYp9vN/aiWAyIuIxI88gGBgXeJxdfBcySw5wwTWT9DzbAp/Q
 H+4nXEz56uuf261RPQvlW7h/9rseDs095SQPGL4/J6FhzXlg2qaI59Mofy3wwdnefH0jcXue
 iJmRs6IMR451TWYCWarRzgwAH83DtG0Q6Y9XaoxUHuutP4Tj4cDdQEv4REaRHUgnBQ2+1U4e
 Zw03mHt5BaKhXf2B7s/fTNXxFu0nW5umAjl+l7tQ04bbcj
X-IronPort-AV: E=Sophos;i="5.82,262,1613451600"; 
   d="scan'208";a="43171819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krvqKJRvTnY5WOGPr5lMXkEVNhPanEdRgrUQdcv0qcHw5bI+aDRDvNWiwQN0BbHX7iU+OQdZ2wusDDti21Q1JUkGRSenerFBeC72Sa+3MoJi6Rug2fy3cgtP2Ivpt4DjXmX/jjIhRh+PZBh7ydUiAh5MB8B7WrxwqhyirObsKo+jmS5X3DsHGVRZA5OJnEBh/pX+XgDbx6abs4TW4UETSZRBKL6efD83jTDJ367GTdqgpO0i/QgugBnAgD7QVHC0LSe7py+AdkKwLKf12Pnvw1AAPtgQ0rb4zA2UnvZK34dW+NQ3rExS8iqDegSgSBiqqRcvGrHOuNyekGk9177Sdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJrh4Nr3g9Zk3M1SqFliLdzySo69DpNFN9meVThbPwI=;
 b=QstqMShRN/pIDYHIJiVI8NbpUYdf7YNsLyg6wtnbUksA7l0NiSIanS7994vYrdAkubqilgeNpEalSqebdB1+oqK5b/rG619x2DOJN9QPu1J9345yRKW9bWF/4CKeJ4agv2tw4uDW2U4PJ2pcjvM62sexo6gmK3W49jTXqOQ4bELix0niTpUBfXQwW4AranPtfpAgihH/ha0CoVntkA4Pn8Q4nWM3vB/WW9qycC3xY/zDVcRSaXdfm1qI4AdNsHXx+vBuuZY2vCX2EgvILtxyA1PtHhw+k5bZNxi9JPqGaBiTnLLDxtSDgSbPwpw4xvxnhmgzCADiZQwwA8JqmQ42vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJrh4Nr3g9Zk3M1SqFliLdzySo69DpNFN9meVThbPwI=;
 b=S0aodjvvN6fW8KvMaiQPBq+t5msZO7GOKg0i+z90PhgGsochtbCcklOX1kTJVLTTfWN+zA97/lc6UyfwGRzJwCkVnBUzWH5q7DhS0ucucMB/wRFwF+yiRYGWWu3JA3iOB2WgvC3wdC304JLQ9m4MsGyPtoN/9gnSxAgF2yjFqmo=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210429221223.28348-1-andrew.cooper3@citrix.com>
 <4781e8f1-d70b-2736-364c-eeed61869031@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Always have CR4.PKE set in HVM context
Message-ID: <5b1938c7-408a-5912-7e66-b5e207e268bd@citrix.com>
Date: Fri, 30 Apr 2021 11:21:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4781e8f1-d70b-2736-364c-eeed61869031@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52a5934d-cd77-406a-d08b-08d90bc1ab44
X-MS-TrafficTypeDiagnostic: BYAPR03MB4296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4296955C2A4DED238C81DF80BA5E9@BYAPR03MB4296.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gMIN+/6ysghYbS/Wll5Ei1EverAgYaJSCOAsxjsVn039nP1g+mhL6ojaaS5NMC2V68Dqa+rBDMLD11CkjpPTqCq0nWyXDm4Y7a1TxvmMK3Dr5lkMjyhSObfcgKeD0d7OGiTKaEvJffgzUpmaimAnNenDCPYDp1Mw6sAbnxP3NUjF0fK/EG0KGkr8A1ccmMJ/NM9uZ/HIdsLNa6h2U7dwul5pAhaViYRkW4xXlloSPhEumfXa+4Kpk2V00a+dUU14LZzA9gDeTi1U+GYKL4azwLf+EqgUw0A0nvm6jskYcblKo8u0jKEGOHuJcAieWpVEbHvL9SFSRbl0XpuSyaN7Q35C7nKsN8lzXi6Nmwo9yv5MaiW7injjhONfsNma0I953WwGh047hKwIcOvG2haqinjCuy52HD3AFjGneWH2+eKJGgOV+en9zreSbSq9C68sc3X9Y+HuVpzQKMuWVXXqH7gjH4cWwIlX/zlidESKrI/2ODKvy174eQaLXTAgjfjMuxqY0bFpFaXuB5+loQauJvutYgB7xrAnZMxpIR5db+ImsE8erdMj93+LrKnjZIagTALCcQEUUTvKtSezB7BbXOKPmZ1XnSmMS2QSuvovEoVhyrEA6w4049EoC82bzfEFrPM5kt87yFo5E1OotOxGt9Rvk+zAmpttXYdwHWG6r26SPScNttlD2L5o8ly098DL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(31696002)(86362001)(66476007)(36756003)(6666004)(2906002)(53546011)(2616005)(66946007)(83380400001)(26005)(8936002)(6916009)(66556008)(31686004)(6486002)(5660300002)(186003)(8676002)(316002)(54906003)(16576012)(38100700002)(478600001)(4326008)(956004)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGxTSDlRVTJSc0xSTzRUa0VOQXlvV2JoYTdiNEhGRkY0WjFKN01rSWV1MFhG?=
 =?utf-8?B?RGE3Nmo0NlBYbTNlc2RsSndyRStqUGtGc0VYSU8yOGtHanZkWmZZMGFsVjcz?=
 =?utf-8?B?V1V2TGdCRUwwTnhaVEZ0WTBBMXk2Y0lBUWtFZEVuNVlRbGIwb1QyV0IyVEd5?=
 =?utf-8?B?M2hwWVFKMlY4UUV2cDZXSHNKbzd0OGxxY3haTjROc1M2aisxa09IUldhbVJW?=
 =?utf-8?B?cjRLeXJoQklkYmlRcFRRNmhIN0NmSlJPZzAzQnRIRlR3SlYvMVpBdG8zNkVK?=
 =?utf-8?B?RmdaSEFDakZ0eW91VC9pWkpYSzVWMFMyKzRrT1lHMkxTd0FFRWkzRVdtMXgz?=
 =?utf-8?B?aTcxQnhLUHNkai9PUzByTXZTL0pmd1lFMlFUeXpyVTRPekZxRTNlSGo4NnJB?=
 =?utf-8?B?cytpSUwxb09PcUZCVTlkZ0xnQnp6b0FZMWU2cGVmak5mTjJZY2RNWVovNW5F?=
 =?utf-8?B?bE9pYVlOaXFaWmsrTjNYeEQ2SXhKTUZHWGFCekpUUm9qaklzZmxUOW14UHhl?=
 =?utf-8?B?Y04rUHZMajQ4V1BBY1BYUWdDZUdHd2cxNXdIdE0yUU5wT0tlUlFsZUZ0WEl0?=
 =?utf-8?B?cCtWb0xmTTFoUXhUa2VPcXJsMWdPUFVTSnJVUWlLYjFDaWFJdmxYMTlYaE9W?=
 =?utf-8?B?elVPM1hoTFM5TTNqQ0hveUg1VW8xL0RRdExCMkJRQytaQ1I0NGVxcmRPNTRM?=
 =?utf-8?B?ajRSSWFWZ2VWWjRxTVU0WUhXSTdIN1pYNWlHMGFjU3BvZ2laR3FLdjJ6eFhx?=
 =?utf-8?B?WHdPWEZUZXk2YzJ1M2U1SUhFNUVhdGhUdG91MkU5ZFc5RWhHWWtnNkNnZmtx?=
 =?utf-8?B?VDJSOEdEWnhNbjhWYUhpZklFQ29HSmtqQXRBWXdHam1Yais2YlQwNWNwclRl?=
 =?utf-8?B?VXpSWUlzQTlrd3dQUENES2wyUmdGRTNHYi9FQkJlL0RZSUV4S0ViK0RFbGVG?=
 =?utf-8?B?bkwya0pDTWpKbXlqdjJnWmN3Qmg3NWFPOFg5Umt6UW9IdzdOdWhXd1kxSkxH?=
 =?utf-8?B?cEFhUStXYkxDZDZWM1JXQnNvd1RlS2Q3ZWY5SGxieUpjWDN3UmJYSDBQUk40?=
 =?utf-8?B?R0JiVTd4UlZaVEtGbG1rS1YzZk5TRk1LQ1NvcXQ3aXhZdjZ0WXU2bUJuT2kw?=
 =?utf-8?B?WGRQbWhJSlB3ZUxGOU5vV3hiSllyZUsxQXZmL29WRkdDTEhNVFZoMXp0SVNt?=
 =?utf-8?B?SzdtV1FaTUNlNktSVmZpVmVsSklzNFZXNktrczNBRWlLNnF4MVVWdjNsUGhZ?=
 =?utf-8?B?aWFDZVdEUE9JK1JMT0Q1TElPdVMrckZDUmdDYlh4eDhweHkrNTFITDZYVFlx?=
 =?utf-8?B?MlFhbTg2YWt3TGs2TkY1MVo3TmJ1akV6c2xIeXRqREVCVjhJQVczdXJrcnhu?=
 =?utf-8?B?OTdlTVp6V1NNaXJldUJlMjgrZXBPdmY4RHU0NU45d0hYQmhOamJVamN4b3l2?=
 =?utf-8?B?OEVnTURZOWFqVFRvL2FDSnJnWjJlL05oR0JUL0JCc1BNc09tc3EyQjVGdU5m?=
 =?utf-8?B?WXExSjNDd3ZnUjQ5OG1IQlJJT2p1SkptbFczRTNOTWIzaUo0aWtjSUs2TXpr?=
 =?utf-8?B?RHZMN1VZeUJLNWpvV3VobmdjQUVhS0VKRU9hQWhpaXFkclVCK1htNDhha2ov?=
 =?utf-8?B?VU50dVVyN1FCTTFMZHNmakFYRWNLUVloWmNscjdkWHZlSExJSzBYallpSkZN?=
 =?utf-8?B?RDM2b3N1bEc0MlNyMUJMaWNkbnlaR0M0ejFTaExucGkrOUVOQ3ZBS0RlTEFn?=
 =?utf-8?Q?pK8iJUEIkaj7WaRt6bWKHUNyHqznkju3nvMhLiz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a5934d-cd77-406a-d08b-08d90bc1ab44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 10:21:08.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sj4uM521cKFQ/6PeHDHyKS3eOWgwic/I0sm8cXRJ6eee9joclqw4hdj3zv9BnJ56++fw6HrHB5DOj4UbkxYmMQAZ9ts/H6MHHWaeYGCIzs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4296
X-OriginatorOrg: citrix.com

On 30/04/2021 10:08, Jan Beulich wrote:
> On 30.04.2021 00:12, Andrew Cooper wrote:
>> The sole user of read_pkru() is the emulated pagewalk, and guarded behin=
d
>> guest_pku_enabled() which restricts the path to HVM (hap, even) context =
only.
>>
>> The commentary in read_pkru() concerning _PAGE_GNTTAB overlapping with
>> _PAGE_PKEY_BITS is only applicable to PV guests.
>>
>> The context switch path, via write_ptbase() unconditionally writes CR4 o=
n any
>> context switch.
>>
>> Therefore, we can guarantee to separate CR4.PKE between PV and HVM conte=
xt at
>> no extra cost.  Set PKE in mmu_cr4_features on boot, so it becomes set i=
n HVM
>> context, and clear it in pv_make_cr4().
>>
>> Rename read_pkru() to rdpkru() now that it is a simple wrapper around th=
e
>> instruction.  This saves two CR4 writes on every pagewalk, which typical=
ly
>> occur more than one per emulation.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> The changes looks perfectly fine to me, but I still feel urged to make
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> conditional upon my "x86emul: support RDPKRU/WRPKRU" (submitted exactly
> half a year ago) going in first, unless there were to be review comments
> making extensive rework necessary. In the absence of such review
> feedback, I consider it pretty inappropriate for me to do rebasing work
> (no matter that this would be largely mechanical afaics) here for a
> patch which has been pending and effectively ignored for so long. (The
> main thing that immediately struck me as odd was "The sole user of
> read_pkru() is ...".)

So the observation about "sole user" occurred to me too, right after I
sent this.=C2=A0 Then I thought "surely Jan has spotted this and done a pat=
ch
for it".

Presumably you're talking about "x86emul: support RDPKRU/WRPKRU" from
Oct 30th ?=C2=A0 I found that via the archives, but I literally don't have =
a
copy in my inbox.


If I do the rebase, are you happy for this patch to stay as it is (so
the complicated change concerning context switching doesn't get more
complicated), and so we're not knowingly adding new constructs which
need immediate changes?

~Andrew


