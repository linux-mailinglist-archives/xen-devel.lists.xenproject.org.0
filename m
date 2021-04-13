Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432E35DFA7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 15:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109747.209467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWIhP-0007nC-Hi; Tue, 13 Apr 2021 13:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109747.209467; Tue, 13 Apr 2021 13:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWIhP-0007mp-E8; Tue, 13 Apr 2021 13:03:23 +0000
Received: by outflank-mailman (input) for mailman id 109747;
 Tue, 13 Apr 2021 13:03:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWIhN-0007mk-Ua
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 13:03:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c246911-129b-4ca6-969d-1bb7db5efca0;
 Tue, 13 Apr 2021 13:03:21 +0000 (UTC)
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
X-Inumbo-ID: 5c246911-129b-4ca6-969d-1bb7db5efca0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618319001;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=agud5dld3jb18gvL9/F4q0wJ5iGl/NtUsx0lOah4/O0=;
  b=X9VYRy+iMVhrhWObLsT+03uiD6HcRkdjPmniUgzXb1KtYLQbC9zpGwOp
   ZaPT0YaaKY30OARPVBJP2NcCST3/b9w05BJyZTriouVm9f4To0BZE6vbU
   k3mRuG+ygRh74zrKWOXzdCZWgupe9xFdWwOKI6DARhaoUnDdJ3Og8L9YT
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wj4t4IKJgnVcMOOfyLCsATo1AIZxn1Zc9cKF2MBryOSyaD2E4loyUMGmLEdi/9jjtfEpmIBlGk
 WY7Ds57Kyv93m7n9WYdmxP4wdt+IVG8Ur91zHDqUtWUcq36gOweKf1SWvIykrL1Uqtz8QPd0gx
 xIvKqcePty9iZ+ov2Cd2L4hdFEtE82q2U9xOQVYWW8JsDVqY2ASiydj/vuL+BeB3HRsLUGgite
 MLdKBTJrAo//zw5UYnSLydlKlC+9nQ4a29ovKTs6pZK7u9bDJzGvA9MTSZx8m4WVSQ7p17vYTX
 lnY=
X-SBRS: 5.2
X-MesageID: 41860809
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9C0DHqquUI7DeKJ19IwhdvwaV5qxeYIsi2QD101hICF9WMqeis
 yogbAnzhfykjkcQzUNntqHNamGTxrnhPxIyKMWOqqvWxSjhXuwIOhZnOjf6hDDOwm7zO5S0q
 98b7NzYeeaMXFWhdv3iTPYL/8O29+CmZrGuc7771NACT5ncLth6QARMGqmO2l7XhNPC5Z8NL
 f03LsjmxOadX4abtu2CxA+NoCoyuHjro7sYhINGncciDWmsDXA0tDHOind+AwfXTNJybIL6n
 PEjAT926Wmv5iAu3vh61M=
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41860809"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRZFCGD1+7rLLzZpFp1A0GBnHKNbhyMNJglvPgRbdToJ8NGLZME7amebq5KwD3YDBgQ2MpD0UNRI1V7F3K0UiYFrSqNoiFlJCypuLAYnD+QBF0YQT3XGUYzYCqasnzRaobuUxmqJ48dul6hQqQJpEgDuP+5zdc2rG2guOKxyj1eu2Ysilxf8ZuHSB+jaGvfhoBZU5V8JAjpf+npOYIokK8YjgiQTRWLC2+JPf7+vG2S2VWJGD4Y+xxU9Wh6Vbb2vd5mumxkEqqe+1M1IpL3Plu0FtAYY9bwMRHfgPA9u3UncbrkEY9FnOP5O5kh32b948oFPJQoTr+PosBWWff/1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxogzJKt1mqp/zV/CtKIlySQhljhRvouFeKXJivfonY=;
 b=bB47jZzQfzOHBF3d8YylUaJZVK5+4aty3hSDILFb7UmtwX6u1rpidt5hRaSWIfv3ozEm4DGO/0eb6eVnkdUdmQ/yJgHsXHDJn2g+QkO2bKB2r1wF1gw8E52OII1FJRddtOtLGeLSAgxiixxm0oCw4Azh7L2/tsBaOpHQeFwFDic0o4ADtqccCSk2m67Nm48QS4HMYHWmIu2wDOODOI8XL9UtxGMK+ic4TqXx/dfh4tf0TSB3O+tRHDtZUxwcRdrYYt5xVXguc9LAJSPavrRjStE6Z73DOqSehH16Sm89fLdngER27IsyRV4YJ+jm+xbkieH2HJKWWulmVZo2Y1YLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxogzJKt1mqp/zV/CtKIlySQhljhRvouFeKXJivfonY=;
 b=Xv/UMDHSn71EfNU6HrUm2hw14mE6ZnnPEvnpGVT1qJ9tGVNerORruVcTinxuWAntPyRXP0+Qp2btvm0YyOvc2hs9gauSdJ4/HwWLk6pWf8dOXSRVI2TFHHkQrYcMz+xcVn+sjpxrYYhekejevCrGTYrVV2UytDLWou3W7xcVLqM=
Date: Tue, 13 Apr 2021 15:03:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
Message-ID: <YHWWkA7bHxmwBtH4@Air-de-Roger>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
 <YHRnvQvWJ7QsXVgX@Air-de-Roger>
 <c07396f2-b0c5-092b-4e3e-5f452c453e56@suse.com>
 <YHVv/wyD6BphWaU/@Air-de-Roger>
 <4190da5f-65c2-dfee-e84e-9d5560dabf69@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4190da5f-65c2-dfee-e84e-9d5560dabf69@suse.com>
X-ClientProxiedBy: PR3P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c194f58-d711-45e5-80a5-08d8fe7c8135
X-MS-TrafficTypeDiagnostic: DM6PR03MB4217:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4217486FF66CD187340D0A3A8F4F9@DM6PR03MB4217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e11ydVkJPLDeuRdjAbX2FJ0sj0uybXyQCVfUFr56KAGqrh5dwex4XsQP6uPFejGJosaGOdBi/gpj18SbRtOYy8vs0gnfv+LDI78Bwu4q0ft1/g7U1BANk2Fq0IXID5dKf1IAb5Y12RRw1kl9VeqsyQJ/e7b5UuapmfHF565CrGfndUVw/TQ+VdytYNSDcRfoZ2qiuRXj3QGkFcBSdRFLHfqCOBN65/yPAsR41sSGJ9pgSbNYhGgrT8E0zj9m0A++u+9IJPHTkfhcPuRCLkzjGMgrSm6DrX6FHzssSONCc7Zmzjq8FuBP0RqX+HSxxo5ONNrFp8hUeX4Y/i6OOLUZCHwbXwdUcXlRWWS0+WRu9HlW99p5QgJFe5/KXddb7xxf4ZxwpwDz6eLyPJfSbY1zalv/lIzUq899QbHrgLK276tcJiEKoNmCOyfXNab1ZO86A9bBzj2o7T7PanioIT5Q6sSkvQkDgxoHA10dqF7fUU5113LNM3YfkIQp4brDQ3vH3mtJZ68/f2MY0ctRlov6LN7h4HULO+fc9DbTwcJ8os1770u4Pjq1lq87vILaCfSvrMG63plTICAH/bD3nBevuIevapWOvcn7Q+HTOj0v92U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(346002)(39850400004)(396003)(136003)(8676002)(8936002)(66556008)(66476007)(66946007)(2906002)(53546011)(83380400001)(86362001)(5660300002)(85182001)(6666004)(9686003)(6496006)(316002)(16526019)(38100700002)(186003)(33716001)(6486002)(54906003)(26005)(6916009)(478600001)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkgzQWgrbzVQM3JEWWd6V0FVanNGNVl0YUwwazJ6SWNySXViM2wwUkpMSXNh?=
 =?utf-8?B?UjVCKzQ5QmNFQys4anBuZE1ZMHV4SFdXeVNXL2xkaENTRVdyamZtTkNBcVBB?=
 =?utf-8?B?cjc3Q3A2cXpWbExwWXg0MU4xVVRCM0U4Rm1KbEloZjNYR20yU01TNEtLYVdT?=
 =?utf-8?B?cjRpRW4vZ0NDUkllK0NIV1lEbXdiYysweGk0aUl4UjNnZ0ljMHZnT2RiSTFP?=
 =?utf-8?B?T1FPRklZbi8wbk1lN2ZsanFpK1E2L3ZqdnVRb3NrZWlJZFVYeFF1WFJqUGRj?=
 =?utf-8?B?N1RIV2l2YmdxczhlSWs0eGR0b3AvRiszRmJBK2VRMGhUT2hjdnJ5d1J2NElz?=
 =?utf-8?B?K1BsZGt1TXE3VC9aWFkzenFqaTZEcm9EQ2ozNjdYamxEZlVpVFFuYWt2cCtM?=
 =?utf-8?B?YmlFR2VrREhRNld6NlhXWkx6VG5VQ2hJWHBJVzVQWHdoRzdPd0kwY3hsVWlk?=
 =?utf-8?B?NXZYbW0vYWlyN3o5V2ErSDFFTEJNNlB3dHdtU1RmR0RNUnBaL0FFVkR5NzM3?=
 =?utf-8?B?NkZsUXJ5RW12c0NkbjVld21hR1NFdStTMnVPM00rNVhpYkhZS1lLUVN1d3FE?=
 =?utf-8?B?dnJoUUVkQjRPN0xyZ01ZQkI1NkRvTDlTMWljTXdNM25DaVllZnpYYVRUVGNt?=
 =?utf-8?B?RFpYU2hBU0NjVTlrVkE4LzY4UDJIUnhiVHJKcWdYaEZYOE9zd0tZK1R3Tjg3?=
 =?utf-8?B?RnVWSUl6TXBkemhCVWhCbzZCWDF2WEdoT2Q0K0RiNHdQQXp5UTRKSHMxV1Fq?=
 =?utf-8?B?SHdWVktCQjh5b2JBcWg4K0QvbnFScjRYcDJaampjY3FKeFNPMkpIQjgxd3pj?=
 =?utf-8?B?akIzR1paanVOMmxUcVpPOG1rRll3SEdQbHVjSEszZW16aWxCNmtHZ2xTT0lH?=
 =?utf-8?B?TDdLTEttRlBHaVFhS1NQUUMwdTZleDYyYlJJTUlvZGlFNHRra3d4MSs1eS8v?=
 =?utf-8?B?SmpRcHVaMXc5OXA5SFo2TkNVcklPd3V4Wm15Qm9xWlZyWWUvbDR2TUZiN3VN?=
 =?utf-8?B?OEFPME1WT2UzU2NuUjFkVTdtK2lvQitudXFEdC9mdEh0Tnc2bGpTVXZScVFk?=
 =?utf-8?B?ZHc4YWF5SU5CaFErSGl1WlYyWnBSeFRZZFRLeEZKVDhHdjFxMVh6S0FvcUly?=
 =?utf-8?B?V0kvNlZ2UVJ6bjdTZEd0TWhuSGF3RUdoTU9ROE5qVmdta3RiKytwdEJZUnhN?=
 =?utf-8?B?b1NqNm5TOXE1dG1weUpuZjUza2hpRTArN1lOa0tMNFZCSEU0L1FBZDZIOWhD?=
 =?utf-8?B?b0QwWTBTOCtBdWlNRlpDQWVCelpGdHJhVkQwU2MwYmk2VzV6MmFMS2M1bnJl?=
 =?utf-8?B?UHNHOXV6Z2dFYkZpY1hPeG56TGVZUXh0V3YzNjUrd3pjYnQ0SEtmZmgrMCtK?=
 =?utf-8?B?dy9kR2RnL2duSlF6a3h3cEloc1I5dFZOMFg5WUVsMzhZRTFmUW14WTJsbEhQ?=
 =?utf-8?B?ZjhKejFhVkFJbVA4YzUvMnhmdzdScVZtcUdDb0JtZGxoVjJhMk5IMGtaajN6?=
 =?utf-8?B?OWoraHhOSXJDSkQzTWFFcW9pdHNaMjhWV3NsS1dJdlVOWk9QZHcwV0dCQjZ6?=
 =?utf-8?B?OXYyTy9DVytDMkRUbGVVWGg4NTl3WXBQWkdKbnlIMWJFYWZpajA5YU9yZkdP?=
 =?utf-8?B?dHRvZzRlS3l1eTR5SEZjMjJwSksvcThpaTJzTGVMM3Z3QzRITWV4ZEdnTGVU?=
 =?utf-8?B?T3JpYWFzdWZUeDBEUXNqSFFwZXRNZGp4Z3VpRkN0Yk9tYk5Bc3k5b05DaDlS?=
 =?utf-8?Q?0Vp7mM8u705hlOr0tTZAM4N3RbrAQWovb6B5YaP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c194f58-d711-45e5-80a5-08d8fe7c8135
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 13:03:17.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIeyNqIV3QngSLCCJ3XpCPH72g4fAzANPVh8h3Rd3/PwUCv1q0LMmc1OTWPmTrN2+/7+AX7cyvFTGQ8BNK3lBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4217
X-OriginatorOrg: citrix.com

On Tue, Apr 13, 2021 at 02:03:52PM +0200, Jan Beulich wrote:
> On 13.04.2021 12:18, Roger Pau Monné wrote:
> > On Tue, Apr 13, 2021 at 11:24:09AM +0200, Jan Beulich wrote:
> >> On 12.04.2021 17:31, Roger Pau Monné wrote:
> >>> On Mon, Apr 12, 2021 at 12:40:48PM +0200, Jan Beulich wrote:
> >>>> +    {
> >>>> +        const struct page_info *pg = mfn_to_page(mfn);
> >>>> +
> >>>> +        if ( !page_get_owner(pg) && (pg->count_info & PGC_extra) )
> >>>> +        {
> >>>> +            ASSERT(type == p2m_mmio_direct);
> >>>> +            return 0;
> >>>
> >>> Are there any other pages that could pass this check? I don't think
> >>> so, but wanted to assert.
> >>
> >> "Normal" extra pages have an owner, so no, there aren't any others.
> >> If and when any appear, this may need further customizing, albeit
> >> generally I'd hope further pages matching this pattern would also
> >> want similar treatment.
> > 
> > I wonder whether we want to add an assert here to make sure only the
> > APIC access page receives this special handling by the shadow code,
> > but maybe that's a bit too much?
> 
> I think so, yes: It would require either a separate function or
> making the variable global. Both feel like a layering violation.

Right, with the INVALID_MFN change and the shadow mfn_valid style
adjustment:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

